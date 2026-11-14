using System;
using System.Web.UI;

namespace AvisSystem.Models
{
    // Default: staff only (Office Admin + Manager)
    public abstract class SecurePage : Page
    {
        protected virtual string[] AllowedRoles
        {
            get { return new[] { AvisRoles.OfficeAdmin, AvisRoles.Manager }; }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (!Request.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login?ReturnUrl=" + Server.UrlEncode(Request.RawUrl), true);
                return;
            }

            foreach (string role in AllowedRoles)
                if (User.IsInRole(role)) return;

            Response.Redirect("~/AvisPages/AccessDenied.aspx", true);
        }
    }

    // Manager only
    public abstract class ManagerPage : SecurePage
    {
        protected override string[] AllowedRoles
        {
            get { return new[] { AvisRoles.Manager }; }
        }
    }

    // Customer only
    public abstract class CustomerPage : SecurePage
    {
        protected override string[] AllowedRoles
        {
            get { return new[] { AvisRoles.Customer }; }
        }
    }
}