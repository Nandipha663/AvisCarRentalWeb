using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using AvisSystem.Models;
using System.Text.RegularExpressions;

namespace AvisSystem.CustomerPages
{
    public partial class MakePayment : CustomerPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;


            try { BookingService.CancelExpiredBookings(); } catch { }

            int id;
           
            if (int.TryParse(Request.QueryString["bookingId"], out id)) LoadExisting(id);
            else LoadNew();
            if (ViewState["BookingId"] != null)
                lblBankRef.Text = "Booking #" + ViewState["BookingId"];
            else
                lblBankRef.Text = "Your booking number (shown after you confirm)";


        }

        // booking chosen on the Vehicles page (nothing saved yet)
        private void LoadNew()
        {
            if (Session["SelectedVin"] == null) { Response.Redirect("MakeBooking.aspx"); return; }

            DateTime pick = Convert.ToDateTime(Session["PickupDate"] + " " + Session["PickupTime"]);
            DateTime ret = Convert.ToDateTime(Session["ReturnDate"] + " " + Session["ReturnTime"]);

            lblVehicle.Text = Convert.ToString(Session["SelectedVehicle"])
                               + " (" + Convert.ToString(Session["SelectedRegistration"]) + ")";
            lblPickupLoc.Text = Convert.ToString(Session["PickupLocation"]);
            lblReturnLoc.Text = Convert.ToString(Session["ReturnLocation"]);
            lblPickupDate.Text = pick.ToString("dd MMM yyyy HH:mm");
            lblReturnDate.Text = ret.ToString("dd MMM yyyy HH:mm");
            lblTotal.Text = "R" + Convert.ToDecimal(Session["TotalAmount"]).ToString("N2");
        }

        // paying for a booking that is already Pending (link from My Bookings)
        private void LoadExisting(int bookingId)
        {
            int customerId = BookingService.GetCustomerId(User.Identity.Name);

            const string sql = @"
                SELECT ISNULL(b.Vehicle_make + ' ' + b.Vehicle_model, b.VehicleVinNo) AS Vehicle,
                       b.PickUpBranchName, b.DropOffBranchName,
                       b.[PickUp Date] AS PickUp, b.ExpectedReturnDate AS Ret, b.[Invoice Amount] AS Amount
                FROM BOOKING b
                WHERE b.BookingID = @id AND b.CustomerID = @cust AND b.Status = 'Pending'
                  AND (b.PaymentDeadline IS NULL OR b.PaymentDeadline > GETDATE())";

            var t = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@id", bookingId);
                cmd.Parameters.AddWithValue("@cust", customerId);
                new SqlDataAdapter(cmd).Fill(t);
            }

            if (t.Rows.Count == 0)
            {
                ShowMessage("This booking cannot be paid. It is not yours, it was already paid, or it was cancelled because the 24 hours passed.");
                pnlSummary.Visible = false;
                pnlPay.Visible = false;
                return;
            }

            DataRow r = t.Rows[0];
            ViewState["BookingId"] = bookingId;
            lblVehicle.Text = Convert.ToString(r["Vehicle"]);
            lblPickupLoc.Text = Convert.ToString(r["PickUpBranchName"]);
            lblReturnLoc.Text = Convert.ToString(r["DropOffBranchName"]);
            lblPickupDate.Text = Convert.ToDateTime(r["PickUp"]).ToString("dd MMM yyyy HH:mm");
            lblReturnDate.Text = Convert.ToDateTime(r["Ret"]).ToString("dd MMM yyyy HH:mm");
            lblTotal.Text = "R" + Convert.ToDecimal(r["Amount"]).ToString("N2");

            btnPayLater.Visible = false;        // it is already booked
            pnlLaterNote.Visible = false;
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {

            string type = ddlPaymentType.SelectedValue;
            if (string.IsNullOrEmpty(type)) { ShowMessage("Please choose a payment method."); return; }

            if (IsCard(type) && !TryValidateCard(out string cardError))
            {
                ShowMessage(cardError);
                return;
            }
            if (ViewState["BookingId"] != null)      // paying for an existing Pending booking
            {
                int customerId = BookingService.GetCustomerId(User.Identity.Name);
                bool ok = BookingService.ConfirmPayment((int)ViewState["BookingId"], type, customerId);
                if (!ok)
                {
                    ShowMessage("Sorry, this booking can no longer be paid because it was cancelled. Please make a new booking.");
                    pnlPay.Visible = false;
                    return;
                }
                Response.Redirect("MyBookings.aspx");
                return;
            }

            SaveNewBooking(true, type);
        }

        protected void btnPayLater_Click(object sender, EventArgs e)
        {
            SaveNewBooking(false, null);
        }

        private void SaveNewBooking(bool paid, string paymentType)
        {
            if (Session["SelectedVin"] == null) { Response.Redirect("MakeBooking.aspx"); return; }

            int customerId = BookingService.GetCustomerId(User.Identity.Name);
            if (customerId < 0)
            {
                ShowMessage("We could not find your customer record. Please contact the branch.");
                return;
            }

            DateTime pick = Convert.ToDateTime(Session["PickupDate"] + " " + Session["PickupTime"]);
            DateTime ret = Convert.ToDateTime(Session["ReturnDate"] + " " + Session["ReturnTime"]);

            int bookingId = BookingService.CreateBooking(
                customerId,
                Convert.ToString(Session["SelectedVin"]), pick, ret,
                Convert.ToString(Session["PickupLocation"]), Convert.ToString(Session["ReturnLocation"]),
                Convert.ToDecimal(Session["TotalAmount"]), paid, paymentType);

            if (bookingId < 0)    // someone booked it a moment ago
            {
                Session.Remove("SelectedVin");
                Response.Redirect("Vehicles.aspx");
                return;
            }

            Session.Remove("SelectedVin");     // a refresh cannot book it twice
            Response.Redirect("MyBookings.aspx");
        }

        private void ShowMessage(string text)
        {
            lblMessage.Text = text;
            pnlMessage.Visible = true;
        }
        private static bool IsCard(string method)
        {
            return method == "Credit Card" || method == "Debit Card";
        }

        private bool TryValidateCard(out string error)
        {
            if (!Regex.IsMatch(txtCardNumber.Text.Trim(), @"^\d{16}$"))
            {
                error = "Card number must be 16 digits.";
                return false;
            }
            if (!Regex.IsMatch(txtCVV.Text.Trim(), @"^\d{3}$"))
            {
                error = "CVV must be 3 digits.";
                return false;
            }
            string name = txtCardName.Text.Trim();
            string number = new string(txtCardNumber.Text.Where(char.IsDigit).ToArray());
            string expiry = txtExpiry.Text.Trim();
            string cvv = txtCVV.Text.Trim();

            if (name.Length < 2) { error = "Enter the name on the card."; return false; }

            if (number.Length < 13 || number.Length > 19 || !PassesLuhn(number))
            { error = "Enter a valid card number."; return false; }

            if (!Regex.IsMatch(expiry, @"^(0[1-9]|1[0-2])/\d{2}$"))
            { error = "Enter the expiry date as MM/YY."; return false; }

            int month = int.Parse(expiry.Substring(0, 2));
            int year = 2000 + int.Parse(expiry.Substring(3, 2));
            var lastDay = new DateTime(year, month, DateTime.DaysInMonth(year, month));
            if (lastDay < DateTime.Today)
            { error = "This card has expired."; return false; }

            if (!Regex.IsMatch(cvv, @"^\d{3,4}$"))
            { error = "Enter the 3 or 4 digit CVV."; return false; }

            error = null;
            return true;
        }

        private static bool PassesLuhn(string digits)
        {
            int sum = 0;
            bool alt = false;
            for (int i = digits.Length - 1; i >= 0; i--)
            {
                int d = digits[i] - '0';
                if (alt) { d *= 2; if (d > 9) d -= 9; }
                sum += d;
                alt = !alt;
            }
            return sum % 10 == 0;
        }

        private void ClearCardFields()
        {
            txtCardName.Text = "";
            txtCardNumber.Text = "";
            txtExpiry.Text = "";
            txtCVV.Text = "";
        }

    }
}