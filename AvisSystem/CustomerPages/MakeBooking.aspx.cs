using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.CustomerPages
{
    public partial class MakeBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearchVehicles_Click(object sender, EventArgs e)
        {
            bool isValid = true;

            // Remove previous error styling and messages
            ClearValidationStyles();

            // ==========================================
            // PICKUP LOCATION
            // ==========================================

            if (string.IsNullOrEmpty(ddlPickupLocation.SelectedValue))
            {
                ShowError(
                    ddlPickupLocation,
                    lblPickupLocationError,
                    "Please choose a pickup location."
                );

                isValid = false;
            }

            // ==========================================
            // PICKUP DATE
            // ==========================================

            if (string.IsNullOrEmpty(txtPickupDate.Text))
            {
                ShowError(
                    txtPickupDate,
                    lblPickupDateError,
                    "Please choose a pickup date."
                );

                isValid = false;
            }

            // ==========================================
            // PICKUP TIME
            // ==========================================

            if (string.IsNullOrEmpty(ddlPickupTime.SelectedValue))
            {
                ShowError(
                    ddlPickupTime,
                    lblPickupTimeError,
                    "Please choose a pickup time."
                );

                isValid = false;
            }

            // ==========================================
            // RETURN DATE
            // ==========================================

            if (string.IsNullOrEmpty(txtReturnDate.Text))
            {
                ShowError(
                    txtReturnDate,
                    lblReturnDateError,
                    "Please choose a return date."
                );

                isValid = false;
            }

            // ==========================================
            // RETURN TIME
            // ==========================================

            if (string.IsNullOrEmpty(ddlReturnTime.SelectedValue))
            {
                ShowError(
                    ddlReturnTime,
                    lblReturnTimeError,
                    "Please choose a return time."
                );

                isValid = false;
            }

            // ==========================================
            // RETURN LOCATION
            // ==========================================

            if (chkDifferentLocation.Checked &&
                string.IsNullOrEmpty(ddlReturnLocation.SelectedValue))
            {
                ShowError(
                    ddlReturnLocation,
                    lblReturnLocationError,
                    "Please choose a return location."
                );

                isValid = false;
            }

            // ==========================================
            // STOP IF VALIDATION FAILED
            // ==========================================

            if (!isValid)
            {
                return;
            }

            // ==========================================
            // SAVE BOOKING INFORMATION
            // ==========================================

            Session["PickupLocation"] =
                ddlPickupLocation.SelectedValue;

            Session["PickupDate"] =
                txtPickupDate.Text;

            Session["PickupTime"] =
                ddlPickupTime.SelectedValue;

            Session["ReturnDate"] =
                txtReturnDate.Text;

            Session["ReturnTime"] =
                ddlReturnTime.SelectedValue;

            // ==========================================
            // RETURN LOCATION
            // ==========================================

            if (chkDifferentLocation.Checked)
            {
                Session["ReturnLocation"] =
                    ddlReturnLocation.SelectedValue;
            }
            else
            {
                Session["ReturnLocation"] =
                    ddlPickupLocation.SelectedValue;
            }

            // ==========================================
            // GO TO VEHICLE SELECTION PAGE
            // ==========================================

            Response.Redirect("~/CustomerPages/Vehicles.aspx");
        }

        // ==============================================
        // SHOW VALIDATION ERROR
        // ==============================================

        private void ShowError(
            WebControl control,
            Label errorLabel,
            string message)
        {
            // Add red error styling
            control.CssClass += " input-error";

            // Display error message
            errorLabel.Text = message;

            errorLabel.Visible = true;
        }

        // ==============================================
        // CLEAR PREVIOUS VALIDATION ERRORS
        // ==============================================

        private void ClearValidationStyles()
        {
            // Reset CSS classes

            ddlPickupLocation.CssClass =
                "booking-dropdown";

            txtPickupDate.CssClass =
                "booking-input";

            ddlPickupTime.CssClass =
                "booking-input";

            txtReturnDate.CssClass =
                "booking-input";

            ddlReturnTime.CssClass =
                "booking-input";

            ddlReturnLocation.CssClass =
                "booking-dropdown";

            // Clear error messages

            lblPickupLocationError.Text = "";
            lblPickupDateError.Text = "";
            lblPickupTimeError.Text = "";
            lblReturnDateError.Text = "";
            lblReturnTimeError.Text = "";
            lblReturnLocationError.Text = "";

            // Hide error labels

            lblPickupLocationError.Visible = false;
            lblPickupDateError.Visible = false;
            lblPickupTimeError.Visible = false;
            lblReturnDateError.Visible = false;
            lblReturnTimeError.Visible = false;
            lblReturnLocationError.Visible = false;
        }
    }

}