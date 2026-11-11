using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class ViewVehicleInspectionReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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