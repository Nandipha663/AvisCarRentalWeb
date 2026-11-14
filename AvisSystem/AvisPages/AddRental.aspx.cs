using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AvisSystem.AvisPages
{
    public partial class AddRental : AvisSystem.Models.SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                txtStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                SqlDSEmployee.SelectParameters["EmailAddress"].DefaultValue = User.Identity.Name.ToString();
                DVEmployees.DataBind();

                if (DVEmployees.Rows.Count > 0)
                {
                    txtEmployeeID.Text = DVEmployees.Rows[0].Cells[1].Text;
                    txtEmployeeName.Text = DVEmployees.Rows[1].Cells[1].Text;
                }
            }
        }

        protected void GVBookings_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCustomerID.Text = GVBookings.SelectedRow.Cells[2].Text;
            txtCustomerName.Text = GVBookings.SelectedRow.Cells[6].Text;
            txtBookingID.Text = GVBookings.SelectedRow.Cells[1].Text;
            txtVehicleVinNo.Text = GVBookings.SelectedRow.Cells[3].Text;
            txtVehicleMakeModel.Text = GVBookings.SelectedRow.Cells[7].Text + " " + GVBookings.SelectedRow.Cells[8].Text;
            txtPickUpDate.Text = Convert.ToDateTime(GVBookings.SelectedRow.Cells[4].Text).ToString("yyyy-MM-dd");
            txtExpectedReturnDate.Text = Convert.ToDateTime(GVBookings.SelectedRow.Cells[5].Text).ToString("yyyy-MM-dd");
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCustomerID.Text = "";
            txtCustomerName.Text = "";
            txtBookingID.Text = "";
            txtVehicleVinNo.Text = "";
            txtVehicleMakeModel.Text = "";
            txtPickUpDate.Text = "";
            txtExpectedReturnDate.Text = "";
            

            txtStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        protected void btnAddRental_Click(object sender, EventArgs e)
        {

            // Check whether a booking has been selected
            if (String.IsNullOrWhiteSpace(txtBookingID.Text))
            {
                lblMessage.Text = "Please select a booking first.";
                return;
            }


            int result = SqlDSAddRental.Insert();

            // Only update the booking if the rental was successfully added
            if (result > 0)
            {
                SqlDSBookingStatus.UpdateParameters["BookingID"].DefaultValue = txtBookingID.Text;

                SqlDSBookingStatus.Update();

                lblMessage.Text = "Rental Added Successfully";

                // Clear the textboxes
                txtCustomerID.Text = "";
                txtCustomerName.Text = "";
                txtBookingID.Text = "";
                txtVehicleVinNo.Text = "";
                txtVehicleMakeModel.Text = "";
                txtPickUpDate.Text = "";
                txtExpectedReturnDate.Text = "";
                txtEmployeeID.Text = "";
                txtEmployeeName.Text = "";

                txtStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                // Refresh the bookings GridView
                GVBookings.DataBind();
            }
            else
            {
                lblMessage.Text = "Rental could not be added.";
            }


            txtCustomerID.Text = "";
            txtCustomerName.Text = "";
            txtBookingID.Text = "";
            txtVehicleVinNo.Text = "";
            txtVehicleMakeModel.Text = "";
            txtPickUpDate.Text = "";
            txtExpectedReturnDate.Text = "";
            txtEmployeeID.Text = "";
            txtEmployeeName.Text = "";

            txtStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            lblMessage.Text = "Rental Added Successfully";

        }
    }
}