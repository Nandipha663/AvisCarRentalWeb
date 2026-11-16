using AvisSystem.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace AvisSystem.CustomerPages
{
    public partial class MakeBooking : CustomerPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadBranches(ddlPickupBranch);
            LoadBranches(ddlReturnBranch);
            string today = DateTime.Today.ToString("yyyy-MM-dd");
            txtPickupDate.Attributes["min"] = today;
            txtReturnDate.Attributes["min"] = today;
        }

        private void LoadBranches(DropDownList ddl)
        {
            var cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            var t = new DataTable();
            using (var con = new SqlConnection(cs))
            using (var da = new SqlDataAdapter("SELECT branchName FROM BRANCH ORDER BY branchName", con))
                da.Fill(t);
            ddl.DataSource = t;
            ddl.DataTextField = "branchName";
            ddl.DataValueField = "branchName";
            ddl.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DateTime pick, ret;
            if (!DateTime.TryParse(txtPickupDate.Text + " " + txtPickupTime.Text, out pick) ||
                !DateTime.TryParse(txtReturnDate.Text + " " + txtReturnTime.Text, out ret))
            { lblMsg.Text = "Enter valid pick-up and return dates and times."; return; }

            if (pick < DateTime.Now) { lblMsg.Text = "Pick-up cannot be in the past."; return; }
            if (ret <= pick) { lblMsg.Text = "Return must be after pick-up."; return; }

            // clear any earlier choice so a new search starts clean
            Session.Remove("SelectedVin");
            Session.Remove("TotalAmount");

            Session["PickupLocation"] = ddlPickupBranch.SelectedValue;
            Session["ReturnLocation"] = ddlReturnBranch.SelectedValue;
            Session["PickupDate"] = pick.ToString("yyyy-MM-dd");
            Session["PickupTime"] = pick.ToString("HH:mm");
            Session["ReturnDate"] = ret.ToString("yyyy-MM-dd");
            Session["ReturnTime"] = ret.ToString("HH:mm");

            Response.Redirect("Vehicles.aspx");
        }
    }
}