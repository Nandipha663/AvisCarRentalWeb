using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class UpdateVehicles : AvisSystem.Models.SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GVVehicles.DataBind();
            }
        }

        protected void TxtSearch_TextChanged(object sender, EventArgs e)
        {
            GVVehicles.DataBind();
        }

        protected void GVVehicles_SelectedIndexChanged(object sender, EventArgs e)
        {
            VehImage.ImageUrl = "GetVehicleImage.ashx?vin=" +
                    Server.UrlEncode(GVVehicles.SelectedDataKey.Value.ToString());

            LblStatus.Text = GVVehicles.SelectedRow.Cells[6].Text;
            LblVVN.Text = GVVehicles.SelectedRow.Cells[1].Text;
            LblCategory.Text = GVVehicles.SelectedRow.Cells[5].Text;
            LblMake.Text = GVVehicles.SelectedRow.Cells[3].Text;
            LblModel.Text = GVVehicles.SelectedRow.Cells[4].Text;
            LblDailyRate.Text = GVVehicles.SelectedRow.Cells[8].Text;

        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            VehImage.ImageUrl = "";
            LblStatus.Text = "";
            LblVVN.Text = "";
            LblCategory.Text = "";
            LblMake.Text = "";
            LblModel.Text = "";
            LblDailyRate.Text = "";
        }

        protected void DDLBranchName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnFilter_Click(object sender, EventArgs e)
        {
            GVVehicles.DataBind();
        }

        protected void BtnClearFilters_Click(object sender, EventArgs e)
        {
            // Clear search
            TxtSearch.Text = "";

            // Reset dropdowns
            DDLBranchName.SelectedIndex = 0;
            DDLCategory.SelectedIndex = 0;
            DDLStatus.SelectedIndex = 0;
            DDLDailyRate.SelectedIndex = 0;

            // Clear selected vehicle
            GVVehicles.SelectedIndex = -1;

            // Clear vehicle summary
            VehImage.ImageUrl = "";
            LblStatus.Text = "";
            LblVVN.Text = "";
            LblCategory.Text = "";
            LblMake.Text = "";
            LblModel.Text = "";
            LblDailyRate.Text = "";

            // Reload all vehicles
            GVVehicles.DataBind();

        }
    }
}