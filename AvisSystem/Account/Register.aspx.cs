using AvisSystem.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.BuilderProperties;
using Owin;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Collections.Generic;

namespace AvisSystem.Account
{
    public partial class Register : Page
    {

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            ErrorMessage.Visible = false;
            lblMessage.Visible = false;

            //  Validate the registration form
            if (!Page.IsValid)
                return;

            if (!AgreeTerms.Checked)
            {
                TermsError.Visible = true;
                return;
            }

            TermsError.Visible = false;

            // Get Identity managers
            var manager = Context.GetOwinContext()
                .GetUserManager<ApplicationUserManager>();

            var signInManager = Context.GetOwinContext()
                .Get<ApplicationSignInManager>();

            string email = Email.Text.Trim();
            string username = Username.Text.Trim();

            // Check whether the email and username already exist
            bool emailInCustomer = Exists(
                "SELECT COUNT(*) FROM CUSTOMER WHERE EmailAddress = @value",
                email);

            bool emailInIdentity = manager.FindByEmail(email) != null;

            bool usernameInCustomer = Exists(
                "SELECT COUNT(*) FROM CUSTOMER WHERE CustomerUsername = @value",
                username);

            bool usernameInIdentity = manager.FindByName(username) != null;

            bool emailExists = emailInCustomer || emailInIdentity;
            bool usernameExists = usernameInCustomer || usernameInIdentity;

            if (emailExists && usernameExists)
            {
                ShowError("This email address and username are already registered. Please use different details.");
                return;
            }

            if (emailExists)
            {
                ShowError("This email address already exists. Please use another email.");
                return;
            }

            if (usernameExists)
            {
                ShowError("This username already exists. Please choose another one.");
                return;
            }

            //  Create ASP.NET Identity account
            var user = new ApplicationUser()
            {
                UserName = username,
                Email = email
            };

            IdentityResult result = manager.Create(user, Password.Text);

            if (!result.Succeeded)
            {
                FailureText.Text = string.Join(" ", result.Errors);
                ErrorMessage.Visible = true;
                return;
            }

            //  Insert customer details into CUSTOMER
            try
            {
                SqlDataSource1.InsertParameters["FullName"].DefaultValue =
                    FullName.Text.Trim();

                SqlDataSource1.InsertParameters["Address"].DefaultValue =
                    PhysicalAddress.Text.Trim();

                SqlDataSource1.InsertParameters["ContactNumber"].DefaultValue =
                    ContactNumber.Text.Trim();

                SqlDataSource1.InsertParameters["EmailAddress"].DefaultValue =
                    email;

                SqlDataSource1.InsertParameters["LicenceNumber"].DefaultValue =
                    TextBox1.Text.Trim();

                SqlDataSource1.InsertParameters["LicenceCode"].DefaultValue =
                    DropDownList1.SelectedValue;

                SqlDataSource1.InsertParameters["CustomerUsername"].DefaultValue =
                    username;

                SqlDataSource1.InsertParameters["LicenceCountryOfIssue"].DefaultValue =
                    LicenceCountry.Text.Trim();

                SqlDataSource1.InsertParameters["CustomerPassword"].DefaultValue =
                    Password.Text.Trim();

                // Do not supply Status.
                // SQL Server assigns Active through its default constraint.

                // Do not insert CustomerPassword.
                // ASP.NET Identity manages password hashes.

                int insertedRows = SqlDataSource1.Insert();

                if (insertedRows <= 0)
                {
                    throw new Exception("Customer information was not saved.");
                }
            }
            catch (Exception ex )
            {
                //  Remove Identity account if CUSTOMER insertion fails
                IdentityResult deleteResult = manager.Delete(user);

                if (!deleteResult.Succeeded)
                {
                    ShowError(
                        "Registration failed and account cleanup was unsuccessful. Please contact support.");
                    return;
                }

                // Log ex on the server in a production application.
                ShowError(
                    "Registration failed. Please check your details and try again.");
                return;
            }

            //  Sign in only after successful registration
            signInManager.SignIn(
                user,
                isPersistent: false,
                rememberBrowser: false);

            //  Redirect
            IdentityHelper.RedirectToReturnUrl(
                Request.QueryString["ReturnUrl"], Response);
        }

        // CHECK WHETHER A RECORD EXISTS
        private bool Exists(string query, string value)
        {
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                    "DefaultConnection"].ConnectionString;

            using (SqlConnection con =
                new SqlConnection(connectionString))
            using (SqlCommand cmd =
                new SqlCommand(query, con))
            {
                cmd.Parameters.Add("@value", SqlDbType.NVarChar, 256)
                    .Value = value;

                con.Open();

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                return count > 0;
            }
        }

        // DISPLAY ERROR MESSAGE
        private void ShowError(string message)
        {
            lblMessage.Text = Server.HtmlEncode(message);
            lblMessage.ForeColor =
                System.Drawing.Color.Red;
            lblMessage.Visible = true;
        }

        // DISPLAY SUCCESS MESSAGE
        private void ShowSuccess(string message)
        {
            lblMessage.Text = Server.HtmlEncode(message);
            lblMessage.ForeColor =
                System.Drawing.Color.Green;
            lblMessage.Visible = true;
        }
    }
}