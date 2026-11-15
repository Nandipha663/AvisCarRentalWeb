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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFromDate.Text = "";
                txtToDate.Text = "";

                GVReturn.DataBind();
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            GVReturn.PageIndex = 0;
            GVReturn.SelectedIndex = -1;
            GVReturn.DataBind();
        }

        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            txtFromDate.Text = "";
            txtToDate.Text = "";

            GVReturn.PageIndex = 0;
            GVReturn.SelectedIndex = -1;
            GVReturn.DataBind();
        }

        protected void GVReturn_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GVReturn.SelectedRow;

            hfReturnID.Value = row.Cells[1].Text;
            lblReturnID.Text = "Return #" + row.Cells[1].Text;
            lblBookingID.Text = row.Cells[2].Text;
            lblVehicleVinNo.Text = Server.HtmlDecode(row.Cells[3].Text);
            lblVehicle.Text = Server.HtmlDecode(row.Cells[4].Text);
            lblReturnDate.Text = row.Cells[5].Text;
            txtInspection.Text = Server.HtmlDecode(row.Cells[6].Text).Trim();
            txtCharges.Text = row.Cells[7].Text;

            ListItem branch = ddlBranch.Items.FindByValue(Server.HtmlDecode(row.Cells[8].Text));
            if (branch != null)
            {
                ddlBranch.SelectedValue = branch.Value;
            }

            lblMessage.Text = "";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (hfReturnID.Value == "0")
            {
                lblMessage.Text = "Please select a return first.";
                return;
            }

            decimal charges;
            if (!decimal.TryParse(txtCharges.Text, out charges) || charges < 0)
            {
                lblMessage.Text = "Please enter a valid charge amount.";
                return;
            }

            try
            {
                SqlDSUpdateReturn.Update();
                lblMessage.Text = "Return updated successfully.";
                GVReturn.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "The return could not be updated: " + ex.Message;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            hfReturnID.Value = "0";
            lblReturnID.Text = "Return #";
            lblBookingID.Text = "-";
            lblVehicleVinNo.Text = "-";
            lblVehicle.Text = "-";
            lblReturnDate.Text = "-";
            txtInspection.Text = "";
            txtCharges.Text = "";
            lblMessage.Text = "";
            GVReturn.SelectedIndex = -1;
        }
    }
}