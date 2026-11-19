using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AvisSystem.Models
{
    public static class BookingService
    {
        public const string Pending = "Pending", Confirmed = "Confirmed", Cancelled = "Cancelled";
        public const string Available = "Available", Reserved = "Reserved", OnHold = "On Hold";

        private static string Cs
        { get { return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString; } }

        // CustomerID of the logged-in user (username or email); -1 if not found
        public static int GetCustomerId(string loginName)
        {
            using (var con = new SqlConnection(Cs))
            using (var cmd = new SqlCommand(
                "SELECT TOP 1 CustomerID FROM CUSTOMER WHERE CustomerUsername = @u OR EmailAddress = @u", con))
            {
                cmd.Parameters.AddWithValue("@u", loginName);
                con.Open();
                object o = cmd.ExecuteScalar();
                return o == null ? -1 : Convert.ToInt32(o);
            }
        }

        // paid = true  -> Confirmed + vehicle Reserved + a PAYMENT row
        // paid = false -> Pending (24 hours to pay) + vehicle On Hold
        // Returns the BookingID, or -1 if the vehicle was taken in the meantime.
        public static int CreateBooking(int customerId, string vin, DateTime pick, DateTime ret,
                                        string pickBranch, string dropBranch, decimal amount,
                                        bool paid, string paymentType)
        {
            using (var con = new SqlConnection(Cs))
            {
                con.Open();
                using (var tx = con.BeginTransaction(IsolationLevel.Serializable))
                {
                    try
                    {
                        // 1. still free? (locked while we check)
                        using (var chk = new SqlCommand(@"
                            SELECT COUNT(*) FROM BOOKING WITH (UPDLOCK, HOLDLOCK)
                            WHERE VehicleVinNo = @vin
                              AND Status NOT IN ('Cancelled', 'Completed')
                              AND [PickUp Date] < @ret AND ExpectedReturnDate > @pick", con, tx))
                        {
                            chk.Parameters.AddWithValue("@vin", vin);
                            chk.Parameters.Add("@pick", SqlDbType.DateTime).Value = pick;
                            chk.Parameters.Add("@ret", SqlDbType.DateTime).Value = ret;
                            if ((int)chk.ExecuteScalar() > 0) { tx.Rollback(); return -1; }
                        }

                        // 2. the booking
                        int bookingId;
                        using (var ins = new SqlCommand(@"
                            INSERT INTO BOOKING
                                (CustomerID, VehicleVinNo, [Booking Date], [PickUp Date], ExpectedReturnDate,
                                 Status, [Invoice Amount], PickUpBranchName, DropOffBranchName, BranchName,
                                 CustomerFullName, Vehicle_make, Vehicle_model, RefundStatus,
                                 PaymentDeadline, LastUpdated)
                            VALUES
                                (@cust, @vin, GETDATE(), @pick, @ret,
                                 @status, @amt, @pb, @db, @pb,
                                 (SELECT FullName FROM CUSTOMER WHERE CustomerID = @cust),
                                 (SELECT Make  FROM VEHICLE WHERE VehicleVinNo = @vin),
                                 (SELECT Model FROM VEHICLE WHERE VehicleVinNo = @vin),
                                 'Not Applicable',
                                 CASE WHEN @paid = 1 THEN NULL ELSE DATEADD(HOUR, 24, GETDATE()) END, GETDATE());
                            SELECT CAST(SCOPE_IDENTITY() AS int);", con, tx))
                        {
                            ins.Parameters.AddWithValue("@cust", customerId);
                            ins.Parameters.AddWithValue("@vin", vin);
                            ins.Parameters.Add("@pick", SqlDbType.DateTime).Value = pick;
                            ins.Parameters.Add("@ret", SqlDbType.DateTime).Value = ret;
                            ins.Parameters.AddWithValue("@status", paid ? Confirmed : Pending);
                            ins.Parameters.AddWithValue("@amt", amount);
                            ins.Parameters.AddWithValue("@pb", pickBranch ?? "");
                            ins.Parameters.AddWithValue("@db", dropBranch ?? pickBranch ?? "");
                            ins.Parameters.AddWithValue("@paid", paid ? 1 : 0);
                            bookingId = (int)ins.ExecuteScalar();
                        }

                        // 3. vehicle status (never overwrite a car that is Rented or in maintenance)
                        string sql = paid
                            ? "UPDATE VEHICLE SET Status = 'Reserved', LastUpdated = GETDATE() WHERE VehicleVinNo = @vin AND Status IN ('Available', 'On Hold')"
                            : "UPDATE VEHICLE SET Status = 'On Hold',  LastUpdated = GETDATE() WHERE VehicleVinNo = @vin AND Status = 'Available'";
                        using (var veh = new SqlCommand(sql, con, tx))
                        {
                            veh.Parameters.AddWithValue("@vin", vin);
                            veh.ExecuteNonQuery();
                        }

                        // 4. the payment record
                        if (paid) InsertPayment(con, tx, bookingId, paymentType);

                        tx.Commit();
                        return bookingId;
                    }
                    catch { tx.Rollback(); throw; }
                }
            }
        }

        // Customer pays for a Pending booking (Pay now on My Bookings).
        // false = the booking is not theirs, was already paid, or was cancelled for non-payment.
        public static bool ConfirmPayment(int bookingId, string paymentType, int customerId)
        {
            CancelExpiredBookings();   // an expired booking can no longer be paid

            using (var con = new SqlConnection(Cs))
            {
                con.Open();
                using (var tx = con.BeginTransaction())
                {
                    try
                    {
                        if (!ConfirmCore(con, tx, bookingId, customerId)) { tx.Rollback(); return false; }
                        InsertPayment(con, tx, bookingId, paymentType);
                        tx.Commit();
                        return true;
                    }
                    catch { tx.Rollback(); throw; }
                }
            }
        }

        // For STAFF pages that already save their own PAYMENT row (e.g. AddPayment):
        // only flips the booking to Confirmed and the vehicle to Reserved.
        public static bool MarkBookingPaid(int bookingId)
        {
            CancelExpiredBookings();

            using (var con = new SqlConnection(Cs))
            {
                con.Open();
                using (var tx = con.BeginTransaction())
                {
                    try
                    {
                        if (!ConfirmCore(con, tx, bookingId, 0)) { tx.Rollback(); return false; }
                        tx.Commit();
                        return true;
                    }
                    catch { tx.Rollback(); throw; }
                }
            }
        }

        // Manual cancellation (staff or customer): booking -> Cancelled, vehicle -> Available
        // unless it still has another active booking.
        public static bool CancelBooking(int bookingId)
        {
            using (var con = new SqlConnection(Cs))
            {
                con.Open();
                using (var tx = con.BeginTransaction())
                {
                    try
                    {
                        int rows;
                        using (var up = new SqlCommand(@"
                            UPDATE BOOKING SET Status = 'Cancelled', LastUpdated = GETDATE()
                            WHERE BookingID = @id AND Status IN ('Pending', 'Confirmed')", con, tx))
                        {
                            up.Parameters.AddWithValue("@id", bookingId);
                            rows = up.ExecuteNonQuery();
                        }
                        if (rows == 0) { tx.Rollback(); return false; }

                        using (var veh = new SqlCommand(@"
                            UPDATE v SET Status = 'Available', LastUpdated = GETDATE()
                            FROM VEHICLE v
                            WHERE v.VehicleVinNo = (SELECT VehicleVinNo FROM BOOKING WHERE BookingID = @id)
                              AND v.Status IN ('On Hold', 'Reserved')
                              AND NOT EXISTS (SELECT 1 FROM BOOKING x
                                              WHERE x.VehicleVinNo = v.VehicleVinNo
                                                AND x.Status IN ('Pending', 'Confirmed', 'Checked Out'))", con, tx))
                        {
                            veh.Parameters.AddWithValue("@id", bookingId);
                            veh.ExecuteNonQuery();
                        }
                        tx.Commit();
                        return true;
                    }
                    catch { tx.Rollback(); throw; }
                }
            }
        }

        // The 24-hour rule: cancels unpaid bookings past their deadline. Returns how many.
        public static int CancelExpiredBookings()
        {
            using (var con = new SqlConnection(Cs))
            using (var cmd = new SqlCommand("dbo.usp_CancelExpiredBookings", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                object o = cmd.ExecuteScalar();
                return o == null ? 0 : Convert.ToInt32(o);
            }
        }

        // ---- helpers ----

        // Pending -> Confirmed and vehicle -> Reserved. customerId 0 = no ownership check.
        private static bool ConfirmCore(SqlConnection con, SqlTransaction tx, int bookingId, int customerId)
        {
            int rows;
            using (var up = new SqlCommand(@"
                UPDATE BOOKING SET Status = 'Confirmed', PaymentDeadline = NULL, LastUpdated = GETDATE()
                WHERE BookingID = @id AND Status = 'Pending'
                  AND (@cust = 0 OR CustomerID = @cust)", con, tx))
            {
                up.Parameters.AddWithValue("@id", bookingId);
                up.Parameters.AddWithValue("@cust", customerId);
                rows = up.ExecuteNonQuery();
            }
            if (rows == 0) return false;

            using (var veh = new SqlCommand(@"
                UPDATE VEHICLE SET Status = 'Reserved', LastUpdated = GETDATE()
                WHERE VehicleVinNo = (SELECT VehicleVinNo FROM BOOKING WHERE BookingID = @id)
                  AND Status IN ('Available', 'On Hold')", con, tx))
            {
                veh.Parameters.AddWithValue("@id", bookingId);
                veh.ExecuteNonQuery();
            }
            return true;
        }

        private static void InsertPayment(SqlConnection con, SqlTransaction tx, int bookingId, string paymentType)
        {
            using (var cmd = new SqlCommand(@"
                INSERT INTO PAYMENT
                    (BookingID, PaymentType, PaymentDate, PaymentAmount, PaymentStatus, PaymentDescription, CustomerName)
                SELECT b.BookingID, @type, CAST(GETDATE() AS date), b.[Invoice Amount], 'Completed',
                       'Online payment for booking ' + CAST(b.BookingID AS varchar(10)), b.CustomerFullName
                FROM BOOKING b WHERE b.BookingID = @id", con, tx))
            {
                cmd.Parameters.AddWithValue("@type", paymentType ?? "Online");
                cmd.Parameters.AddWithValue("@id", bookingId);
                cmd.ExecuteNonQuery();
            }
        }
        // Paste inside the BookingService class (it uses the existing Cs connection string
        // and CancelExpiredBookings, so expired bookings never show in the list).
        // Needs: using System.Data; using System.Data.SqlClient;

        public static DataTable GetPendingBookings()
        {
            CancelExpiredBookings();

            using (var con = new SqlConnection(Cs))
            using (var da = new SqlDataAdapter(@"
        SELECT BookingID,
               CustomerID,
               CustomerFullName,
               VehicleVinNo,
               [Invoice Amount] AS Amount,
               'Booking ' + CAST(BookingID AS varchar(10)) + ' - ' + CustomerFullName AS Label
        FROM BOOKING
        WHERE Status = 'Pending'
        ORDER BY BookingID DESC", con))
            {
                var dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        
           
        public static bool PayCharge(string kind, string id, string paymentType)
        {
            const string head = @"
        DECLARE @Inv varchar(20) =
          'INV' + CAST(ISNULL((SELECT MAX(TRY_CAST(SUBSTRING(InvoiceID, 4, 20) AS INT))
                               FROM PAYMENT WITH (UPDLOCK, HOLDLOCK)), 1000) + 1 AS varchar(20));
        INSERT INTO PAYMENT (InvoiceID, BookingID, ReturnID, InspectionCode, PaymentType, PaymentDate,
                             PaymentAmount, PaymentStatus, PaymentDescription, CustomerName) ";

            string body = kind == "Return"
              ? @"SELECT @Inv, r.BookingID, r.ReturnID, NULL, @Type, GETDATE(), r.Charges, 'Completed',
                 'Additional charges for return ' + CAST(r.ReturnID AS varchar(10)), c.FullName
          FROM [VEHICLE RETURN] r
          INNER JOIN BOOKING b ON b.BookingID = r.BookingID
          INNER JOIN CUSTOMER c ON c.CustomerID = b.CustomerID
          WHERE r.ReturnID = @Id AND r.Charges > 0
            AND NOT EXISTS (SELECT 1 FROM PAYMENT p WHERE p.ReturnID = r.ReturnID)"
              : @"SELECT @Inv, rt.BookingID, NULL, i.InspectionCode, @Type, GETDATE(), i.DamageCharges, 'Completed',
                 'Damage charges for inspection ' + CAST(i.InspectionCode AS varchar(20)), c.FullName
          FROM [VEHICLE INSPECTION] i
          INNER JOIN RENTAL rt ON rt.RentalID = i.RentalID
          INNER JOIN BOOKING b ON b.BookingID = rt.BookingID
          INNER JOIN CUSTOMER c ON c.CustomerID = b.CustomerID
          WHERE i.InspectionCode = @Id AND i.DamageCharges > 0
            AND NOT EXISTS (SELECT 1 FROM PAYMENT p WHERE p.InspectionCode = i.InspectionCode)";

            string cs = ConfigurationManager.ConnectionStrings["GroupPmb3ConnectionString"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var cmd = new SqlCommand(head + body, con))
            {
                cmd.Parameters.AddWithValue("@Type", paymentType);
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                return cmd.ExecuteNonQuery() == 1;
            }
        }

    }
}