using System;
using System.Data;
using System.Globalization;
using System.Web.UI;
using AvisSystem.Models;

namespace AvisSystem.AvisPages
{
    public partial class AddPayment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            BindBookings();

            // Optional deep link: AddPayment?bookingId=3105
            if (int.TryParse(Request.QueryString["bookingId"], out int wanted))
            {
                var item = ddlBooking.Items.FindByValue(wanted.ToString());
                if (item != null) ddlBooking.SelectedValue = item.Value;
            }

            ShowDetails();
        }

        private void BindBookings()
        {
            DataTable pending = BookingService.GetPendingBookings();

            if (pending.Rows.Count == 0)
            {
                pnlForm.Visible = false;
                pnlEmpty.Visible = true;
                return;
            }


            ddlBooking.DataSource = pending;
            ddlBooking.DataValueField = "BookingID";
            ddlBooking.DataTextField = "Label";
            ddlBooking.DataBind();
        }

        private void ShowDetails()
        {
            pnlDetails.Visible = false;
            if (!int.TryParse(ddlBooking.SelectedValue, out int bookingId)) return;

            DataRow[] rows = BookingService.GetPendingBookings().Select("BookingID = " + bookingId);
            if (rows.Length == 0) return;

            DataRow r = rows[0];
            lblCustomer.Text = Server.HtmlEncode(Convert.ToString(r["CustomerFullName"]));
            lblVin.Text = Server.HtmlEncode(Convert.ToString(r["VehicleVinNo"]));
            lblAmount.Text = "R " + Convert.ToDecimal(r["Amount"]).ToString("N2", CultureInfo.GetCultureInfo("en-ZA"));
            pnlDetails.Visible = true;
        }

        protected void ddlBooking_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlMessage.Visible = false;
            ShowDetails();
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(ddlBooking.SelectedValue, out int bookingId))
            {
                ShowMessage("Choose a booking to pay.", false);
                return;
            }

            if (string.IsNullOrEmpty(ddlType.SelectedValue))
            {
                ShowMessage("Choose a payment type.", false);
                ShowDetails();
                return;
            }

            try
            {
                DataRow[] rows = BookingService.GetPendingBookings().Select("BookingID = " + bookingId);
                if (rows.Length == 0)
                {
                    BindBookings();
                    ShowDetails();
                    ShowMessage("Booking " + bookingId + " can't be paid. It may already be paid, cancelled or expired.", false);
                    return;
                }

                int customerId = Convert.ToInt32(rows[0]["CustomerID"]);
                // Confirms the booking, reserves the vehicle and inserts the PAYMENT row
                // in one transaction. Adjust the arguments if your signature differs.
                bool ok = BookingService.ConfirmPayment(bookingId, ddlType.SelectedValue, customerId);

                if (ok)
                {
                    pnlForm.Visible = false;
                    pnlDone.Visible = true;
                    ShowMessage("Payment recorded for booking " + bookingId + ".", true);
                }
                else
                {
                    BindBookings();
                    ShowDetails();
                    ShowMessage("Booking " + bookingId + " can't be paid. It may already be paid, cancelled or expired.", false);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError("Record payment failed: " + ex);
                ShowDetails();
                ShowMessage("The payment wasn't saved. Try again, and contact support if it keeps happening.", false);
            }
        }

        private void ShowMessage(string text, bool success)
        {
            lblMessage.Text = Server.HtmlEncode(text);
            pnlMessage.CssClass = "pay-msg " + (success ? "ok" : "err");
            pnlMessage.Visible = true;
        }
    }
}