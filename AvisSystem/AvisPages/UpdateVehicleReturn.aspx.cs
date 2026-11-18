using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;


namespace AvisSystem.AvisPages
{
    public partial class UpdateVehicleReturn : AvisSystem.Models.SecurePage
    {
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GVReturns.PageIndex = 0;
            GVReturns.SelectedIndex = -1;
            GVReturns.DataBind();
            lblMessage.ForeColor = System.Drawing.Color.Black;
            lblMessage.Text = GVReturns.Rows.Count == 0 ? "No returns found." : "";
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            GVReturns.PageIndex = 0;
            GVReturns.SelectedIndex = -1;
            GVReturns.DataBind();
            lblMessage.Text = "";
        }

        protected void GVReturns_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfReturnID.Value = GVReturns.SelectedDataKey.Value.ToString();
            DataView dv = (DataView)SqlDSOneReturn.Select(DataSourceSelectArguments.Empty);
            if (dv == null || dv.Count == 0) { Show("Could not load that return.", false); return; }

            DataRowView r = dv[0];
            txtReturnNo.Text = r["ReturnID"].ToString();
            txtBookingRef.Text = r["BookingID"].ToString();
            txtVin.Text = r["VehicleVinNo"].ToString();
            txtVehicle.Text = r["VehicleDescription"].ToString();
            txtReport.Text = r["Inspection Report"].ToString();
            txtCharges.Text = r["Charges"] == DBNull.Value
                ? "0" : Convert.ToDecimal(r["Charges"]).ToString("0.00", CultureInfo.CurrentCulture);

            ddlBranch.ClearSelection();
            ListItem b = ddlBranch.Items.FindByValue(r["BranchName"].ToString());
            if (b != null) b.Selected = true;
            lblMessage.Text = "";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (hfReturnID.Value == "0" || hfReturnID.Value == "")
            { Show("Select a return from the list first.", false); return; }

            string chargeText = string.IsNullOrWhiteSpace(txtCharges.Text) ? "0" : txtCharges.Text.Trim();
            if (!decimal.TryParse(chargeText, NumberStyles.Number, CultureInfo.CurrentCulture, out decimal charges) || charges < 0)
            { Show("Enter a valid charge amount.", false); return; }

            SqlDSReturnUpdate.UpdateParameters["Report"].DefaultValue = txtReport.Text.Trim();
            SqlDSReturnUpdate.UpdateParameters["Charges"].DefaultValue = charges.ToString(CultureInfo.CurrentCulture);
            SqlDSReturnUpdate.UpdateParameters["Branch"].DefaultValue = ddlBranch.SelectedValue;
            SqlDSReturnUpdate.UpdateParameters["ReturnID"].DefaultValue = hfReturnID.Value;

            try
            {
                int rows = SqlDSReturnUpdate.Update();
                if (rows > 0)
                {
                    Show("Return #" + hfReturnID.Value + " updated successfully.", true);
                    GVReturns.DataBind();
                }
                else Show("Nothing was updated. The record may have been removed.", false);
            }
            catch (Exception ex)
            {
                Show("Update failed: " + ex.Message, false);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            hfReturnID.Value = "0";
            txtReturnNo.Text = txtBookingRef.Text = txtVin.Text = txtVehicle.Text = "";
            txtReport.Text = txtCharges.Text = "";
            GVReturns.SelectedIndex = -1;
            lblMessage.Text = "";
        }

        private void Show(string msg, bool ok)
        {
            lblMessage.Text = msg;
            lblMessage.ForeColor = ok ? System.Drawing.Color.Green : System.Drawing.Color.FromArgb(200, 16, 46);
        }
    }
}