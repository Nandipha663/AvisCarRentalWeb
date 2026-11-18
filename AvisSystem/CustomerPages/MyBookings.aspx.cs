using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;
using AvisSystem.Models;

namespace AvisSystem.CustomerPages
{
    public partial class MyBookings : CustomerPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try { BookingService.CancelExpiredBookings(); } catch { }   // must run BEFORE LoadBookings()
            LoadBookings();
        }

        private void LoadBookings()
        {
            // the customer is identified from the login, never from the address bar
            const string sql = @"
                SELECT b.BookingID,
                       b.VehicleVinNo,
                       ISNULL(v.Make + ' ' + v.Model, b.VehicleVinNo) AS Vehicle,
                       v.RegistrationNo,
                       b.PickUpBranchName, b.DropOffBranchName,
                       b.[PickUp Date]        AS PickUpDate,
                       b.ExpectedReturnDate,
                       b.[Invoice Amount]     AS InvoiceAmount,
                       b.Status
                FROM BOOKING b
                INNER JOIN CUSTOMER c ON c.CustomerID = b.CustomerID
                LEFT JOIN VEHICLE v   ON v.VehicleVinNo = b.VehicleVinNo
                WHERE c.CustomerUsername = @u OR c.EmailAddress = @u
                 ORDER BY b.BookingID DESC";

            var table = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@u", User.Identity.Name);
                new SqlDataAdapter(cmd).Fill(table);
            }

            GVMyBookings.DataSource = table;
            GVMyBookings.DataBind();
            lblSummary.Text = table.Rows.Count == 0 ? "" : "You have " + table.Rows.Count + " booking(s).";
        }

        // colour the status so it is easy to scan
        protected void GVMyBookings_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            TableCell cell = e.Row.Cells[8];            // the Status column
            cell.Font.Bold = true;
            switch (cell.Text.Trim())
            {
                case "Confirmed": cell.ForeColor = ColorTranslator.FromHtml("#1E7B34"); break;
                case "Checked Out": cell.ForeColor = ColorTranslator.FromHtml("#B26A00"); break;
                case "Completed": cell.ForeColor = ColorTranslator.FromHtml("#555555"); break;
                case "Cancelled": cell.ForeColor = ColorTranslator.FromHtml("#C8102E"); break;
            }
        }

        protected void GVMyBookings_SelectedIndexChanged(object sender, EventArgs e)
        {
            LblBID.Text = GVMyBookings.SelectedRow.Cells[1].Text;
            LblStatus.Text = GVMyBookings.SelectedRow.Cells[9].Text;
            
            LblVehicle_make.Text = GVMyBookings.SelectedRow.Cells[2].Text;
            LblPDate.Text = GVMyBookings.SelectedRow.Cells[6].Text;
            LblRDate.Text = GVMyBookings.SelectedRow.Cells[7].Text;
            LblPBranch.Text = GVMyBookings.SelectedRow.Cells[4].Text;
            LblDBranch.Text = GVMyBookings.SelectedRow.Cells[5].Text;
            LblTotAmt.Text = GVMyBookings.SelectedRow.Cells[8].Text;
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            int bookingID = Convert.ToInt32(
    GVMyBookings.SelectedDataKey.Values["BookingID"]);

            string vehicleVinNo =
                GVMyBookings.SelectedDataKey.Values["VehicleVinNo"].ToString();

            SqlDSCancelBooking.UpdateParameters["BookingID"].DefaultValue =
                bookingID.ToString();

            SqlDSCancelBooking.UpdateParameters["VehicleVinNo"].DefaultValue =
                vehicleVinNo;

            SqlDSCancelBooking.Update();

            GVMyBookings.DataBind();
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {

        }
    }
}