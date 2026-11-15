using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace AvisSystem.CustomerPages
{
    public partial class Vehicles : System.Web.UI.Page
    {
        private string _branch;
        private DateTime _pick, _ret;

        private string ConnStr
        { get { return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ReadSearch()) return;
            if (!IsPostBack) LoadVehicles();
        }

        // read the customer's search from Session (set by the MakeBooking search button)
        private bool ReadSearch()
        {
            if (Session["PickupLocation"] == null || Session["PickupDate"] == null ||
                Session["PickupTime"] == null || Session["ReturnDate"] == null ||
                Session["ReturnTime"] == null)
            {
                Response.Redirect("MakeBooking.aspx");
                return false;
            }

            try
            {
                _branch = Session["PickupLocation"].ToString().Trim();
                _pick = Convert.ToDateTime(Session["PickupDate"].ToString() + " " + Session["PickupTime"].ToString());
                _ret = Convert.ToDateTime(Session["ReturnDate"].ToString() + " " + Session["ReturnTime"].ToString());
            }
            catch
            {
                Response.Redirect("MakeBooking.aspx");
                return false;
            }

            lblPickupLocation.Text = _branch;
            lblPickupDate.Text = _pick.ToString("dd MMM yyyy HH:mm");
            lblReturnDate.Text = _ret.ToString("dd MMM yyyy HH:mm");

            if (_ret <= _pick)
            {
                ShowMessage("The return date and time must be after the pick-up date and time. Please change your search.");
                rptVehicles.Visible = false;
                return false;
            }
            return true;
        }

        private void LoadVehicles()
        {
            DataTable t = FetchAvailable(null);
            rptVehicles.DataSource = t;
            rptVehicles.DataBind();

            if (t.Rows.Count == 0)
                ShowMessage("No vehicles are available at " + _branch + " for those dates. Please try other dates or another branch.");
        }

        // Vehicles at the chosen branch with NO overlapping booking for the dates (date check alone).
        // Pass a VIN to re-check one vehicle.
        private DataTable FetchAvailable(string vin)
        {
            string sql = @"
                SELECT v.VehicleVinNo, v.RegistrationNo, v.Make, v.Model, v.Category,
                       v.DailyRate, v.VehicleDescription, v.OdometerReading, v.BranchName
                FROM VEHICLE v
                WHERE LTRIM(RTRIM(v.BranchName)) = @branch
                  AND NOT EXISTS (
                        SELECT 1 FROM BOOKING b
                        WHERE b.VehicleVinNo = v.VehicleVinNo
                          AND b.Status NOT IN ('Cancelled', 'Completed')
                          AND b.[PickUp Date] < @ret
                          AND b.ExpectedReturnDate > @pick)";
            if (vin != null) sql += " AND v.VehicleVinNo = @vin";
            sql += " ORDER BY v.Category, v.Make, v.Model";

            var t = new DataTable();
            using (var con = new SqlConnection(ConnStr))
            using (var cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@branch", _branch);
                cmd.Parameters.Add("@pick", SqlDbType.DateTime).Value = _pick;
                cmd.Parameters.Add("@ret", SqlDbType.DateTime).Value = _ret;
                if (vin != null) cmd.Parameters.AddWithValue("@vin", vin);
                new SqlDataAdapter(cmd).Fill(t);
            }

            // estimated total for the stay, shown on each box
            t.Columns.Add("EstTotal", typeof(decimal));
            t.Columns.Add("RentalLabel", typeof(string));
            foreach (DataRow r in t.Rows)
            {
                double hrs; int days;
                r["EstTotal"] = CalcTotal(Convert.ToDecimal(r["DailyRate"]), _pick, _ret, out hrs, out days);
                r["RentalLabel"] = RentalText(hrs);
            }
            return t;
        }

        protected void rptVehicles_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "Select") return;
            string vin = Convert.ToString(e.CommandArgument);

            // re-check against the database: someone else may have just booked it
            DataTable t = FetchAvailable(vin);
            if (t.Rows.Count == 0)
            {
                ShowMessage("Sorry, that vehicle is no longer available for your dates. Please choose another.");
                LoadVehicles();
                return;
            }

            DataRow r = t.Rows[0];
            decimal rate = Convert.ToDecimal(r["DailyRate"]);
            double hrs; int days;
            decimal total = CalcTotal(rate, _pick, _ret, out hrs, out days);

            Session["SelectedVin"] = vin;
            Session["SelectedRegistration"] = r["RegistrationNo"].ToString();
            Session["SelectedVehicle"] = r["Make"] + " " + r["Model"];
            Session["DailyRate"] = rate;
            Session["RentalHours"] = hrs;
            Session["RentalDays"] = days;
            Session["TotalAmount"] = total;

            Response.Redirect("MakePayment.aspx");      // next page in your flow
        }

        // full days at the daily rate, extra hours as a fraction, one-day minimum
        private static decimal CalcTotal(decimal rate, DateTime pick, DateTime ret,
                                         out double totalHours, out int fullDays)
        {
            totalHours = (ret - pick).TotalHours;
            fullDays = (int)(totalHours / 24);
            double remaining = totalHours % 24;

            decimal total = fullDays * rate;
            if (remaining > 0) total += (decimal)remaining * (rate / 24);
            if (total < rate) total = rate;
            return total;
        }

        private static string RentalText(double totalHours)
        {
            int days = (int)(totalHours / 24);
            int hours = (int)Math.Round(totalHours % 24);
            if (days == 0) return hours + " hour(s)";
            return days + " day(s)" + (hours > 0 ? " " + hours + " hour(s)" : "");
        }

        private void ShowMessage(string text)
        {
            lblMessage.Text = text;
            pnlMessage.Visible = true;
        }
    }
}