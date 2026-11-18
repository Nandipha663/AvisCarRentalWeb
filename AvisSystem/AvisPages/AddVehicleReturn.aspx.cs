using System;
using System.Globalization;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class AddVehicleReturn : System.Web.UI.Page
    {
        const int GraceMinutes = 30;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtReturnDate.Text = CurrentTime().ToString("yyyy-MM-dd HH:mm");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GVRentals.PageIndex = 0;
            GVRentals.DataBind();
            lblMessage.Text = "";
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            GVRentals.PageIndex = 0;
            GVRentals.DataBind();
            lblMessage.Text = "";
        }

        protected void GVRentals_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GVRentals.SelectedRow;

            txtRentalID.Text = row.Cells[1].Text;
            txtBookingID.Text = row.Cells[2].Text;
            txtCustomerName.Text = Server.HtmlDecode(row.Cells[3].Text);
            txtVehicleVinNo.Text = Server.HtmlDecode(row.Cells[4].Text);
            txtVehicleMakeModel.Text = Server.HtmlDecode(row.Cells[5].Text);
            txtEmployeeName.Text = Server.HtmlDecode(row.Cells[6].Text);
            txtExpectedReturnDate.Text = row.Cells[7].Text;
            txtDailyRate.Text = row.Cells[8].Text;

            CalculateCharges();
            lblMessage.Text = "";

            ClientScript.RegisterStartupScript(this.GetType(), "ScrollToRental",
                "document.getElementById('selectedRental').scrollIntoView({ behavior: 'smooth' });", true);
        }

        protected void btnAddReturn_Click(object sender, EventArgs e)
        {
            if (txtRentalID.Text == "")
            {
                lblMessage.Text = "Please select a rental first.";
                return;
            }

            if (txtInspectionReport.Text.Trim() == "")
            {
                txtInspectionReport.Text = "No damage";
            }

            CalculateCharges();
            string charge = txtCharges.Text;
            string message = "Vehicle return added. Booking " + txtBookingID.Text + " and rental " + txtRentalID.Text
                + " are now completed. " + txtVehicleMakeModel.Text + " is now available at " + ddlBranch.SelectedValue + ".";

            try
            {
                SqlDSAddReturn.Insert();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "The return could not be saved: " + ex.Message;
                return;
            }

            decimal amount;
            decimal.TryParse(charge, out amount);

            if (amount > 0)
            {
                try
                {
                    SqlDSAddPayment.InsertParameters["PaymentDescription"].DefaultValue = "Additional charges for return of rental " + txtRentalID.Text;
                    SqlDSAddPayment.Insert();
                    message += " Payment of R" + charge + " recorded (" + ddlPaymentType.SelectedValue + ").";
                }
                catch (Exception ex)
                {
                    message += " The payment of R" + charge + " could not be recorded: " + ex.Message;
                }
            }

            lblMessage.Text = message;
            ClearFields();
            GVRentals.DataBind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
            lblMessage.Text = "";
        }

        private void CalculateCharges()
        {
            DateTime expected;
            decimal dailyRate;

            if (!DateTime.TryParseExact(txtExpectedReturnDate.Text, "yyyy-MM-dd HH:mm",
                CultureInfo.InvariantCulture, DateTimeStyles.None, out expected)
                || !decimal.TryParse(txtDailyRate.Text, NumberStyles.Number, CultureInfo.CurrentCulture, out dailyRate))
            {
                return;
            }

            DateTime returned = CurrentTime();
            TimeSpan late = returned - expected;
            int days = 0;

            if (late.TotalMinutes > GraceMinutes)
            {
                days = (int)Math.Ceiling(late.TotalHours / 24);
            }

            txtReturnDate.Text = returned.ToString("yyyy-MM-dd HH:mm");
            txtDaysCharged.Text = days.ToString();
            txtCharges.Text = (days * dailyRate).ToString("0.00");
        }

        private DateTime CurrentTime()
        {
            return TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.UtcNow, "South Africa Standard Time");
        }

        private void ClearFields()
        {
            txtRentalID.Text = "";
            txtBookingID.Text = "";
            txtCustomerName.Text = "";
            txtVehicleVinNo.Text = "";
            txtVehicleMakeModel.Text = "";
            txtEmployeeName.Text = "";
            txtExpectedReturnDate.Text = "";
            txtDailyRate.Text = "";
            txtInspectionReport.Text = "";
            txtDaysCharged.Text = "0";
            txtCharges.Text = "0.00";
            ddlPaymentType.SelectedIndex = 0;
            GVRentals.SelectedIndex = -1;
        }
    }
}