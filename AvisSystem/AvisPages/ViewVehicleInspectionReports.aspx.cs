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
    public partial class ViewVehicleInspectionReports : AvisSystem.Models.SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBranches();
            }
        }
        private void LoadBranches()
        {
            string connString = ConfigurationManager.ConnectionStrings["GroupPmb3ConnectionString"].ConnectionString;
            string query = "SELECT BranchName FROM BRANCH ORDER BY BranchName";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                      //  Populate the DropDownList
                        ddlBranch.DataSource = dt;
                        ddlBranch.DataTextField = "BranchName"; // The text the user sees
                        ddlBranch.DataValueField = "BranchName"; // The value passed to SQL
                        ddlBranch.DataBind();

                       // Add a default "All" option at the top

                       ddlBranch.Items.Insert(0, new ListItem("-- All Branches --", "All"));
                    }
                }
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            GVInspections.DataBind();
            lblMessage.Text = "";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearchEmp.Text = "";
            ddlBranch.SelectedIndex = 0; // Resets to 'All'
            ddlType.SelectedIndex = 0;   // Resets to 'All'
            txtFromDate.Text = "";
            txtToDate.Text = "";

            GVInspections.DataBind();
            lblMessage.Text = "";
        }

        protected void GVInspections_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            lblMessage.Text = "Inspection report deleted successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        protected void GVInspections_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            lblMessage.Text = "Inspection report updated successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}