using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
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
            if (ddlPaymentFor.SelectedValue != "Booking")
            {
                var items = (DataTable)ViewState["Items"];
                DataRow[] rows = items.Select("ItemID = '" + ddlBooking.SelectedValue + "'");
                if (rows.Length == 0) { ClearDetails(); return; }

                lblCustomer.Text = rows[0]["CustomerName"].ToString();
                lblVin.Text = rows[0]["Vehicle"].ToString();
                lblAmount.Text = string.Format("R {0:N2}", rows[0]["Amount"]);
                pnlDetails.Visible = true;
                return;
            }
            pnlMessage.Visible = false;
            ShowDetails();
        }
        protected void btnPay_Click(object sender, EventArgs e)
        {
            bool isBooking = ddlPaymentFor.SelectedValue == "Booking";

            if (string.IsNullOrEmpty(ddlBooking.SelectedValue))
            {
                ShowMessage(isBooking ? "Choose a booking to pay." : "Choose an item to pay.", false);
                return;
            }

            if (string.IsNullOrEmpty(ddlType.SelectedValue))
            {
                ShowMessage("Choose a payment type.", false);
                if (isBooking) ShowDetails();
                return;
            }

            try
            {
                // ---- NEW: vehicle return / inspection charges ----
                if (!isBooking)
                {
                    bool paid = BookingService.PayCharge(
                        ddlPaymentFor.SelectedValue,   // "Return" or "Inspection"
                        ddlBooking.SelectedValue,      // ReturnID or InspectionCode
                        ddlType.SelectedValue);

                    if (paid)
                    {
                        pnlForm.Visible = false;
                        pnlDone.Visible = true;
                        ShowMessage("Payment recorded.", true);
                    }
                    else
                    {
                        LoadItems();
                        ShowMessage("This charge can't be paid. It may already be paid or have no amount due.", false);
                    }
                    return;
                }

                // ---- EXISTING: booking payment (unchanged) ----
                if (!int.TryParse(ddlBooking.SelectedValue, out int bookingId))
                {
                    ShowMessage("Choose a booking to pay.", false);
                    return;
                }

                DataRow[] rows = BookingService.GetPendingBookings().Select("BookingID = " + bookingId);
                if (rows.Length == 0)
                {
                    BindBookings();
                    ShowDetails();
                    ShowMessage("Booking " + bookingId + " can't be paid. It may already be paid, cancelled or expired.", false);
                    return;
                }

                int customerId = Convert.ToInt32(rows[0]["CustomerID"]);
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
                if (isBooking) ShowDetails();
                ShowMessage("The payment wasn't saved. Try again, and contact support if it keeps happening.", false);
            }
        }



        private void ShowMessage(string text, bool success)
        {
            lblMessage.Text = Server.HtmlEncode(text);
            pnlMessage.CssClass = "pay-msg " + (success ? "ok" : "err");
            pnlMessage.Visible = true;
        }
        protected void ddlPaymentFor_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadItems();
        }

        private void LoadItems()
        {
            string sql;
            switch (ddlPaymentFor.SelectedValue)
            {
                case "Return":
                    lblItem.Text = "Vehicle return with charges due";
                    sql = @"SELECT r.ReturnID AS ItemID,
                   'Return ' + CAST(r.ReturnID AS varchar(10)) + ' - ' + c.FullName AS ItemText,
                   c.FullName AS CustomerName, r.VehicleVinNo AS Vehicle, r.Charges AS Amount
            FROM [VEHICLE RETURN] r
            INNER JOIN BOOKING b ON b.BookingID = r.BookingID
            INNER JOIN CUSTOMER c ON c.CustomerID = b.CustomerID
            WHERE r.Charges > 0
              AND NOT EXISTS (SELECT 1 FROM PAYMENT p WHERE p.ReturnID = r.ReturnID)";
                    break;

                case "Inspection":
                    lblItem.Text = "Inspection with damage charges due";
                    sql = @"SELECT i.InspectionCode AS ItemID,
                   'Inspection ' + CAST(i.InspectionCode AS varchar(20)) + ' - ' + c.FullName AS ItemText,
                   c.FullName AS CustomerName, i.VehicleMakeModel AS Vehicle, i.DamageCharges AS Amount
            FROM [VEHICLE INSPECTION] i
            INNER JOIN RENTAL rt ON rt.RentalID = i.RentalID
            INNER JOIN BOOKING b ON b.BookingID = rt.BookingID
            INNER JOIN CUSTOMER c ON c.CustomerID = b.CustomerID
            WHERE i.DamageCharges > 0
              AND NOT EXISTS (SELECT 1 FROM PAYMENT p WHERE p.InspectionCode = i.InspectionCode)";
                    break;

                default:
                    lblItem.Text = "Pending booking";
                    BindBookings();     // your existing method for the booking list
                    return;
            }
            DataTable items = GetTable(sql);
            ViewState["Items"] = items;
            ddlBooking.DataSource = items;
            ddlBooking.DataTextField = "ItemText";
            ddlBooking.DataValueField = "ItemID";
            ddlBooking.DataBind();
            ddlBooking.Items.Insert(0, new ListItem("-- Select --", ""));
            ClearDetails();

        }
        private DataTable GetTable(string sql)
        {
            var dt = new DataTable();
            string cs = ConfigurationManager.ConnectionStrings["GroupPmb3ConnectionString"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var da = new SqlDataAdapter(sql, con))
            {
                da.Fill(dt);
            }
            return dt;
        }

        private void ClearDetails()
        {
            pnlDetails.Visible = false;
            // also clear the Customer / Vehicle / Amount controls inside pnlDetails here
        }
    }
}