using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class AddRental : AvisSystem.Models.SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        protected void GVBookings_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCustomerID.Text = GVBookings.SelectedRow.Cells[2].Text;
            txtCustomerName.Text = GVBookings.SelectedRow.Cells[5].Text;
            txtBookingID.Text = GVBookings.SelectedRow.Cells[1].Text;
            txtVehicleVinNo.Text = GVBookings.SelectedRow.Cells[3].Text;
            txtVehicleMakeModel.Text = GVBookings.SelectedRow.Cells[7].Text + " " + GVBookings.SelectedRow.Cells[8].Text;
            txtPickUpDate.Text = GVBookings.SelectedRow.Cells[4].Text;
            txtExpectedReturnDate.Text = GVBookings.SelectedRow.Cells[2].Text;
            
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
            txtEmployeeID.Text = "";
            txtEmployeeName.Text = "";

            txtStartDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        protected void btnAddRental_Click(object sender, EventArgs e)
        {

        }
    }
}