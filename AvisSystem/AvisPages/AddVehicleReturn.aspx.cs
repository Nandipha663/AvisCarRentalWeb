using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace AvisSystem.AvisPages
{
    public partial class AddVehicleReturn : AvisSystem.Models.SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtReturnDate.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GVRentals.PageIndex = 0;
            GVRentals.DataBind();
            lblMessage.Text = "";
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            GVRentals.PageIndex = 0;
            GVRentals.DataBind();
            lblMessage.Text = "";
        }

        protected void GVRentals_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GVRentals.SelectedRow;

            txtRentalID.Text = row.Cells[1].Text;
            txtBookingID.Text = row.Cells[2].Text;
            txtCustomerName.Text = Server.HtmlDecode(row.Cells[3].Text);
            txtVehicleVinNo.Text = Server.HtmlDecode(row.Cells[4].Text);
            txtVehicleMakeModel.Text = Server.HtmlDecode(row.Cells[5].Text);
            txtEmployeeName.Text = Server.HtmlDecode(row.Cells[6].Text);
            txtExpectedReturnDate.Text = row.Cells[7].Text;

            txtReturnDate.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            lblMessage.Text = "";
        }

        protected void btnAddReturn_Click(object sender, EventArgs e)
        {
            if (txtRentalID.Text == "")
            {
                lblMessage.Text = "Please select a rental first.";
                return;
            }

            decimal charges;
            if (!decimal.TryParse(txtCharges.Text, out charges) || charges < 0)
            {
                lblMessage.Text = "Please enter a valid charge amount.";
                return;
            }

            if (txtInspectionReport.Text.Trim() == "")
            {
                txtInspectionReport.Text = "No damage";
            }

            try
            {
                SqlDSAddReturn.Insert();
                SqlDSCompleteRental.Update();

                lblMessage.Text = "Vehicle return added. Rental " + txtRentalID.Text + " is now completed.";
                ClearFields();
                GVRentals.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "The return could not be saved: " + ex.Message;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
            lblMessage.Text = "";
        }

        private void ClearFields()
        {
            txtRentalID.Text = "";
            txtBookingID.Text = "";
            txtCustomerName.Text = "";
            txtVehicleVinNo.Text = "";
            txtVehicleMakeModel.Text = "";
            txtEmployeeName.Text = "";
            txtExpectedReturnDate.Text = "";
            txtInspectionReport.Text = "";
            txtCharges.Text = "0";
            GVRentals.SelectedIndex = -1;
        }
    }
}