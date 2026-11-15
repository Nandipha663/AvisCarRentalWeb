using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using AvisSystem.Models;

namespace AvisSystem.AvisPages
{
    public partial class AddPayment : SecurePage
    {
        private static string Cs
        { get { return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            try { BookingService.CancelExpiredBookings(); } catch { }   // apply the 24-hour rule first
            LoadPending();
        }

        private void LoadPending()
        {
            const string sql = @"
                SELECT b.BookingID, b.CustomerFullName,
                       ISNULL(b.Vehicle_make + ' ' + b.Vehicle_model, b.VehicleVinNo) AS Vehicle,
                       b.[Invoice Amount] AS Amount, b.PaymentDeadline AS PayBy,
                       DATEDIFF(MINUTE, GETDATE(), b.PaymentDeadline) AS MinutesLeft
                FROM BOOKING b
                WHERE b.Status = 'Pending'
                  AND (@q = '' OR CAST(b.BookingID AS varchar(20)) = @q
                              OR b.CustomerFullName LIKE '%' + @q + '%')
                ORDER BY b.PaymentDeadline";

            var t = new DataTable();
            using (var con = new SqlConnection(Cs))
            using (var cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@q", txtSearch.Text.Trim());
                new SqlDataAdapter(cmd).Fill(t);
            }

            t.Columns.Add("TimeLeft", typeof(string));
            foreach (DataRow r in t.Rows)
            {
                if (r["MinutesLeft"] == DBNull.Value) { r["TimeLeft"] = "—"; continue; }
                int m = Convert.ToInt32(r["MinutesLeft"]);
                r["TimeLeft"] = m <= 0 ? "less than a minute" : (m / 60) + " h " + (m % 60) + " min";
            }

            GVPending.SelectedIndex = -1;
            GVPending.DataSource = t;
            GVPending.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            pnlPay.Visible = false;
            pnlMessage.Visible = false;
            LoadPending();
        }

        // staff picked a booking: show its details (read from the database, not from the grid)
        protected void GVPending_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(GVPending.SelectedDataKey.Value);

            const string sql = @"
                SELECT BookingID, CustomerFullName,
                       ISNULL(Vehicle_make + ' ' + Vehicle_model, VehicleVinNo) AS Vehicle,
                       [Invoice Amount] AS Amount
                FROM BOOKING WHERE BookingID = @id AND Status = 'Pending'";

            var t = new DataTable();
            using (var con = new SqlConnection(Cs))
            using (var cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                new SqlDataAdapter(cmd).Fill(t);
            }

            if (t.Rows.Count == 0)
            {
                ShowMessage("That booking is no longer waiting for payment.", false);
                pnlPay.Visible = false;
                LoadPending();
                return;
            }

            DataRow r = t.Rows[0];
            ViewState["BookingId"] = id;
            lblBookingNo.Text = id.ToString();
            lblCustomer.Text = Convert.ToString(r["CustomerFullName"]);
            lblVehicle.Text = Convert.ToString(r["Vehicle"]);
            lblAmount.Text = "R" + Convert.ToDecimal(r["Amount"]).ToString("N2");
            ddlPaymentType.SelectedIndex = 0;
            txtDescription.Text = "";
            pnlMessage.Visible = false;
            pnlPay.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            if (ViewState["BookingId"] == null) { ShowMessage("Please select a booking first.", false); return; }

            int id = (int)ViewState["BookingId"];
            string error = BookingService.RecordStaffPayment(id, ddlPaymentType.SelectedValue, txtDescription.Text);

            if (error == null)
                ShowMessage("Payment recorded. Booking " + id + " is now Confirmed and the vehicle is Reserved.", true);
            else
                ShowMessage(error, false);

            pnlPay.Visible = false;
            ViewState["BookingId"] = null;
            LoadPending();
        }

        private void ShowMessage(string text, bool ok)
        {
            lblMessage.Text = text;
            pnlMessage.CssClass = ok ? "ap-ok" : "ap-err";
            pnlMessage.Visible = true;
        }
    }
}