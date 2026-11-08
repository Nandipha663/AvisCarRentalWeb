using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations.Model;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class UpdateBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFromDate.Text = "";
                txtToDate.Text = "";

                DDLStatuses.SelectedValue = "AllStatuses";

                SqlDSBookingSearch.SelectParameters["CustName"].DefaultValue = "";
                SqlDSBookingSearch.SelectParameters["FromDate"].DefaultValue = null;
                SqlDSBookingSearch.SelectParameters["ToDate"].DefaultValue = null;
                SqlDSBookingSearch.SelectParameters["Status"].DefaultValue = "AllStatuses";

                GVBooking.DataBind();
            }
        }

        

        protected void GVBooking_SelectedIndexChanged(object sender, EventArgs e)
        {
            LblBID.Text = GVBooking.SelectedRow.Cells[1].Text;
            LblStatus.Text = GVBooking.SelectedRow.Cells[7].Text;
            LblCustN.Text = GVBooking.SelectedRow.Cells[15].Text;
            LblVehicle_make.Text = GVBooking.SelectedRow.Cells[18].Text;
            LblVehicle_model.Text = GVBooking.SelectedRow.Cells[19].Text;
            LblBDate.Text = GVBooking.SelectedRow.Cells[4].Text;
            LblPDate.Text = GVBooking.SelectedRow.Cells[5].Text;
            LblRDate.Text = GVBooking.SelectedRow.Cells[6].Text;
            LblPBranch.Text = GVBooking.SelectedRow.Cells[12].Text;
            LblDBranch.Text = GVBooking.SelectedRow.Cells[13].Text;
            LblTotAmt.Text = GVBooking.SelectedRow.Cells[8].Text;
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {
            // Check whether a booking has been selected.
            if (GVBooking.SelectedDataKey == null)
            {
                lblCancelMessage.Visible = true;
                lblCancelMessage.Text = "Please select a booking first.";
                lblCancelMessage.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }

            // Get the selected booking ID.
            int bookingID = Convert.ToInt32(
                GVBooking.SelectedDataKey.Value);

            // Get the current status of the selected booking.
            string status = GVBooking.SelectedRow.Cells[7].Text.Trim();

            // Prevent cancellation if the booking is checked out.
            if (status.Equals("Checked Out",
                StringComparison.OrdinalIgnoreCase))
            {
                lblCancelMessage.Visible = true;
                lblCancelMessage.Text =
                    "This booking cannot be cancelled because the vehicle has already been checked out.";

                lblCancelMessage.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }

            // Prevent cancellation if the booking is completed.
            if (status.Equals("Completed",
                StringComparison.OrdinalIgnoreCase))
            {
                lblCancelMessage.Visible = true;
                lblCancelMessage.Text =
                    "This booking cannot be cancelled because it is already completed.";

                lblCancelMessage.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }

            // Prevent cancelling a booking that is already cancelled.
            if (status.Equals("Cancelled",
                StringComparison.OrdinalIgnoreCase))
            {
                lblCancelMessage.Visible = true;
                lblCancelMessage.Text =
                    "This booking has already been cancelled.";

                lblCancelMessage.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }

            // Supply the selected booking ID to the SQL query.
            SqlDSCancelBooking.UpdateParameters["BookingID"].DefaultValue =
                bookingID.ToString();

            // Execute the cancellation query.
            int rowsAffected = SqlDSCancelBooking.Update();

            if (rowsAffected > 0)
            {
                lblCancelMessage.Visible = true;
                lblCancelMessage.Text =
                    "Booking cancelled successfully.";

                lblCancelMessage.ForeColor =
                    System.Drawing.Color.Green;

                // Refresh the bookings displayed in the GridView.
                GVBooking.DataBind();

                // Clear the selection after cancellation.
                GVBooking.SelectedIndex = -1;

                // Refresh or clear your booking summary here.
            }
            else
            {
                lblCancelMessage.Visible = true;
                lblCancelMessage.Text =
                    "The booking could not be cancelled. Its status may have changed. Please refresh and try again.";

                lblCancelMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            // Unselect the selected booking
            GVBooking.SelectedIndex = -1;

            LblBID.Text = "e.g ID";
            LblStatus.Text = "e.g Status";
            LblCustN.Text = "e.g Customer name";
            LblVehicle_make.Text = "e.g Vehicle Make";
            LblVehicle_model.Text = "e.g Vehicle Model";
            LblBDate.Text = "e.g Booking Date";
            LblPDate.Text = "e.g Pick up Date";
            LblRDate.Text = "e.g Expected Return Date";
            LblPBranch.Text = "e.g Pick up Branch";
            LblDBranch.Text = "e.g Drop off branch";
            LblTotAmt.Text = "e.g Total Amount";

            // Clear any previous messages
            lblCancelMessage.Text = "";
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            SqlDSBookingSearch.SelectParameters["FromDate"].DefaultValue =
        string.IsNullOrWhiteSpace(txtFromDate.Text)
        ? null : txtFromDate.Text;

            SqlDSBookingSearch.SelectParameters["ToDate"].DefaultValue =
                string.IsNullOrWhiteSpace(txtToDate.Text)
                ? null : txtToDate.Text;

            GVBooking.DataBind();
        }
    }
}