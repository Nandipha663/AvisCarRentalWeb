using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class AddClaim : AvisSystem.Models.SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initially hide the results until a search is done
                GVSearchResults.Visible = false;
            }
        }
        // 1. SEARCH BUTTON CLICK
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GVSearchResults.PageIndex = 0;
            GVSearchResults.SelectedIndex = -1;
            GVSearchResults.Visible = true;
            GVSearchResults.DataBind();

            pnlSelectedBooking.Visible = false;
            pnlClaimForm.Visible = false;
            lblMessage.Text = "";
        }

        // 2. USER CLICKS "SELECT" ON A GRID ROW
        protected void GVSearchResults_SelectedIndexChanged(object sender, EventArgs e)
        {

            DataKey key = GVSearchResults.SelectedDataKey;

            if (key == null || key.Values["BookingID"] == null)
            {
                lblMessage.Text = "This inspection has no booking linked, so a claim can't be filed.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string inspectionCode = Convert.ToString(key.Values["InspectionCode"]);
            string selectedBookingId = Convert.ToString(key.Values["BookingID"]);
            string selectedCustomerName = Convert.ToString(key.Values["CustomerFullName"]);

            hfSelectedBookingID.Value = selectedBookingId;
            hfVehicleVinNo.Value = Convert.ToString(key.Values["VehicleVinNo"]);
            hfVehicleMake.Value = Convert.ToString(key.Values["Vehicle_make"]);
            hfVehicleModel.Value = Convert.ToString(key.Values["Vehicle_model"]);

            lblSelectedBooking.Text = $"Inspection #{inspectionCode} - Booking #{selectedBookingId} - {selectedCustomerName}";
            pnlSelectedBooking.Visible = true;
            pnlClaimForm.Visible = true;
            GVSearchResults.Visible = false;
            lblMessage.Text = "";
        }

        // 3. USER CLICKS "SUBMIT CLAIM"
        protected void btnSubmitClaim_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(hfSelectedBookingID.Value) || string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                lblMessage.Text = "Please ensure a booking is selected and the description is filled.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                // Execute the Insert command using the SqlDataSource2 you created
                SqlDataSource2.Insert();

                // Show Success Message
                lblMessage.Text = "Claim submitted successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                GVSearchResults.SelectedIndex = -1;
                GVSearchResults.Visible = true;
                GVSearchResults.DataBind();

               // Reset the UI for the next claim

               //pnlSelectedBooking.Visible = false;
               // pnlClaimForm.Visible = false;
               // GVSearchResults.Visible = false;
                hfSelectedBookingID.Value = "";
                txtSearchName.Text = "";
                txtDescription.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Database Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            // Search and form fields
            txtSearchName.Text = "";
            txtDescription.Text = "";
            ddlResponsibleParty.SelectedIndex = 0;
            ddlClaimType.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;

            // Selected inspection and booking details
            hfSelectedBookingID.Value = "";
            hfVehicleVinNo.Value = "";
            hfVehicleMake.Value = "";
            hfVehicleModel.Value = "";
            lblSelectedBooking.Text = "";
            lblMessage.Text = "";

            // Panels and grid back to the first-load state
            pnlSelectedBooking.Visible = false;
            pnlClaimForm.Visible = false;
            GVSearchResults.SelectedIndex = -1;
            GVSearchResults.PageIndex = 0;
            GVSearchResults.Visible = false;
        }
    }
}