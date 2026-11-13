using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class ViewClaims : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // Triggered when the user clicks "Delete"
        protected void GVClaims_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Optional: You can add logic here to log the deletion, or prevent specific users from deleting
            lblMessage.Text = "Claim deleted successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        // Triggered when the user clicks "Update" after editing
        protected void GVClaims_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            lblMessage.Text = "Claim updated successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}
