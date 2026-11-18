using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class ViewPayments : AvisSystem.Models.SecurePage
    {
        private static string Cs
        { get { return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) LoadPayments();
        }

        private void LoadPayments()
        {
            // LEFT JOIN so a payment still shows even if its booking row is missing.
            const string sql = @"
                SELECT  p.PaymentID,
                        p.InvoiceID,
                        p.BookingID,
                        p.CustomerName,
                        LTRIM(RTRIM(ISNULL(b.Vehicle_make, '') + ' ' + ISNULL(b.Vehicle_model, ''))) AS Vehicle,
                        p.PaymentType,
                        p.PaymentAmount,
                        p.PaymentDate,
                        p.PaymentStatus,
                        p.PaymentDescription
                FROM    PAYMENT p
                LEFT JOIN BOOKING b ON b.BookingID = p.BookingID
                WHERE   (@q = ''
                         OR CAST(p.BookingID AS varchar(20)) LIKE '%' + @q + '%'
                         OR p.InvoiceID                      LIKE '%' + @q + '%'
                         OR p.CustomerName                   LIKE '%' + @q + '%'
                         OR p.PaymentType                    LIKE '%' + @q + '%')
                ORDER BY p.PaymentDate DESC, p.PaymentID DESC;";

            try
            {
                var dt = new DataTable();
                using (var con = new SqlConnection(Cs))
                using (var cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@q", (txtSearch.Text ?? "").Trim());
                    new SqlDataAdapter(cmd).Fill(dt);
                }

                decimal total = 0;
                foreach (DataRow r in dt.Rows)
                    if (r["PaymentAmount"] != DBNull.Value) total += Convert.ToDecimal(r["PaymentAmount"]);

                lblSummary.Text = dt.Rows.Count + " payment(s), total R" + total.ToString("N2");
                gvPayments.DataSource = dt;
                gvPayments.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Firebrick;
                lblMessage.Text = "Could not load payments: " + Server.HtmlEncode(ex.Message);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvPayments.PageIndex = 0;
            LoadPayments();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            gvPayments.PageIndex = 0;
            LoadPayments();
        }

        protected void gvPayments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPayments.PageIndex = e.NewPageIndex;
            LoadPayments();
        }
    }
}