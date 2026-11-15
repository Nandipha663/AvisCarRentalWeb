using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using AvisSystem.Models;

namespace AvisSystem.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (!IsValid) return;

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

            // accept a username OR an email address
            string typed = Email.Text.Trim();
            var found = manager.FindByName(typed) ?? manager.FindByEmail(typed);
            string loginName = found != null ? found.UserName : typed;

            // inactive accounts are refused
            if (!AvisSystem.Models.AvisRoles.IsActive(loginName))
            {
                FailureText.Text = "This account is inactive. Please contact the branch.";
                ErrorMessage.Visible = true;
                return;
            }

            var result = signinManager.PasswordSignIn(loginName, Password.Text,
                                                      RememberMe.Checked, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:
                    var user = manager.FindByName(loginName);
                    var roles = manager.GetRoles(user.Id);

                    string returnUrl = Request.QueryString["ReturnUrl"];
                    // only follow ReturnUrl if it is a path on this site (blocks redirects to other websites)
                    bool isLocal = !string.IsNullOrEmpty(returnUrl)
                                   && returnUrl.StartsWith("/")
                                   && !returnUrl.StartsWith("//")
                                   && !returnUrl.StartsWith("/\\");

                    if (isLocal)
                        Response.Redirect(returnUrl);
                    else
                        Response.Redirect(AvisSystem.Models.AvisRoles.HomePageFor(roles));
                    break;

                default:
                    FailureText.Text = "Invalid login attempt";
                    ErrorMessage.Visible = true;
                    break;

            }
        
        }
    }
}