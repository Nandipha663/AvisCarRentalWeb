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
            if (string.IsNullOrWhiteSpace(txtSearchName.Text))
            {
                lblMessage.Text = "Please enter a name to search.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                GVSearchResults.Visible = false;
                return;
            }
            // Bind the grid using the SqlDataSource1 you created in the toolbox
            GVSearchResults.DataBind();
            GVSearchResults.Visible = true;

            // Clear previous states
            pnlSelectedBooking.Visible = false;
            pnlClaimForm.Visible = false;
            lblMessage.Text = "";
        }

        // 2. USER CLICKS "SELECT" ON A GRID ROW
        protected void GVSearchResults_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the Booking ID from the DataKeyNames attribute
            string selectedBookingId = GVSearchResults.SelectedDataKey.Value.ToString();

            // Get the Customer Name from the selected row (Column index 2)
            string selectedCustomerName = GVSearchResults.SelectedRow.Cells[2].Text;
            string vehicleVinNo = GVSearchResults.SelectedRow.Cells[5].Text;
            string vehicleMake = GVSearchResults.SelectedRow.Cells[3].Text;
            string vehicleModel = GVSearchResults.SelectedRow.Cells[4].Text;

            // Store the ID in the HiddenField so SqlDataSource2 can grab it later
            hfSelectedBookingID.Value = selectedBookingId;

            // Store vehicle information in HiddenFields
            hfVehicleVinNo.Value = vehicleVinNo;
            hfVehicleMake.Value = vehicleMake;
            hfVehicleModel.Value = vehicleModel;

            // Update the UI
            lblSelectedBooking.Text = $"Booking #{selectedBookingId} - {selectedCustomerName}";
            pnlSelectedBooking.Visible = true;
            pnlClaimForm.Visible = true;      // Show the claim form
            GVSearchResults.Visible = false;  // Hide the search grid
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

                // Reset the UI for the next claim
                pnlSelectedBooking.Visible = false;
                pnlClaimForm.Visible = false;
                GVSearchResults.Visible = false;
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
    }
}