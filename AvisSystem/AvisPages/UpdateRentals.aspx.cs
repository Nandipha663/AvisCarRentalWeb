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
    }
}