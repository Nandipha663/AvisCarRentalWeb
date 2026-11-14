using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class UpdateRentals : AvisSystem.Models.SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFromDate.Text = "";
                txtToDate.Text = "";

                DDLStatuses.SelectedValue = "AllStatuses";

                GVRental.DataBind();
            }

        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnClearFilters_Click(object sender, EventArgs e)
        {

        }

        protected void GVRental_SelectedIndexChanged(object sender, EventArgs e)
        {
            LblID.Text = GVRental.SelectedRow.Cells[1].Text;
            LblStatus.Text = GVRental.SelectedRow.Cells[11].Text;
            LblCust.Text = GVRental.SelectedRow.Cells[4].Text;
            LblVehicle.Text = GVRental.SelectedRow.Cells[13].Text;
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            LblID.Text = "ID";
            LblStatus.Text = "Status";
            LblCust.Text = "Customer's Name";
            LblVehicle.Text = "Vehicle";
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            if (GVRental.SelectedIndex == -1)
            {
                return;
            }

            int rentalID = Convert.ToInt32(
                GVRental.DataKeys[GVRental.SelectedIndex].Value
            );

            SqlDSDeleteRental.DeleteParameters["RentalID"].DefaultValue =
                rentalID.ToString();

            SqlDSDeleteRental.Delete();

            GVRental.DataBind();
        }
    }
}