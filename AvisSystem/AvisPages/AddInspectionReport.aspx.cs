using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.AvisPages
{
    public partial class AddInspectionReport : AvisSystem.Models.SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TxtDateTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                SqlDSEmployee.SelectParameters["EmailAddress"].DefaultValue =
                    User.Identity.Name.ToString();

                DVEmployees.DataBind();

                if (DVEmployees.Rows.Count > 0)
                {
                    TxtEmpID.Text = DVEmployees.Rows[0].Cells[1].Text;
                    TxtEmpName.Text = DVEmployees.Rows[1].Cells[1].Text;
                }
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            UpdateDamageDisplay();
        }

        private void UpdateDamageDisplay()
        {
            bool damageFound = RBLDamageFound.SelectedValue == "Yes";

            // Show Damage Type when damage is found
            DamageTypeSection.Visible = damageFound;

            // Charges are only applicable to Return inspections
            bool isReturn = DDLInspectionType.SelectedValue == "Return";

            decimal damageCharge;

            if (damageFound &&
                isReturn &&
                decimal.TryParse(DDLDamageType.SelectedValue, out damageCharge))
            {
                TxtDamageCharges.Text = damageCharge.ToString("0.00");
                DamageChargeSection.Visible = true;
            }
            else
            {
                TxtDamageCharges.Text = "";
                DamageChargeSection.Visible = false;
            }
        }

        protected void GVRentals_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GVRentals.SelectedDataKey == null)
            {
                
                TxtOdometerR.Text = "";
                TxtCustomerName.Text = "";
                TxtRentalID.Text = "";
                TxtVehicle.Text = "";
                return;
            }

            object rentalKey = GVRentals.SelectedDataKey.Values["RentalID"];
            TxtCustomerName.Text = rentalKey == null ? "" : GetCustomerName(rentalKey.ToString());
            object vinValue = GVRentals.SelectedDataKey.Values["VehicleVinNo"];
            TxtRentalID.Text = rentalKey == null ? "" : rentalKey.ToString();
            TxtVehicle.Text = vinValue == null ? "" : vinValue.ToString();
            if (vinValue == null || string.IsNullOrWhiteSpace(vinValue.ToString()))
            {
                TxtOdometerR.Text = "";
                return;
            }

            string vehicleVinNo = vinValue.ToString();

            SqlDSGetVVN.SelectParameters["VehicleVinNo"].DefaultValue = vehicleVinNo;
            DataView dv = (DataView)SqlDSGetVVN.Select(DataSourceSelectArguments.Empty);
            TxtOdometerR.Text = (dv != null && dv.Count > 0 && dv[0]["OdometerReading"] != DBNull.Value)
                ? dv[0]["OdometerReading"].ToString()
                : "";
        }




    
        private string GetCustomerName(string rentalId)
        {
            const string sql = @"SELECT c.FullName
                         FROM RENTAL rt
                         INNER JOIN BOOKING b ON b.BookingID = rt.BookingID
                         INNER JOIN CUSTOMER c ON c.CustomerID = b.CustomerID
                         WHERE rt.RentalID = @RentalID";
            string cs = ConfigurationManager.ConnectionStrings["GroupPmb3ConnectionString"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@RentalID", rentalId);
                con.Open();
                object result = cmd.ExecuteScalar();
                return result == null ? "" : result.ToString();
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            TxtRentalID.Text = "";
            TxtVehicle.Text = "";
            TxtOdometerR.Text = "";
            TxtInspectionN.Text = "";
            TxtDamageCharges.Text = "";
            TxtCustomerName.Text = "";
            RBLDamageFound.ClearSelection();
            DDLDamageType.SelectedIndex = 0;
            DamageTypeSection.Visible = false;
            DamageChargeSection.Visible = false;
        }

        protected void BtnAddInspection_Click(object sender, EventArgs e)
        {
            // 1. Check if a rental was selected
            if (GVRentals.SelectedDataKey == null)
            {
                Response.Write("<script>alert('Please select a rental first.');</script>");
                return;
            }

            // 2. Check required TextBoxes
            if (string.IsNullOrWhiteSpace(TxtRentalID.Text) ||
                string.IsNullOrWhiteSpace(TxtOdometerR.Text) ||
                string.IsNullOrWhiteSpace(TxtEmpID.Text) ||
                string.IsNullOrWhiteSpace(TxtCustomerName.Text)||
                string.IsNullOrWhiteSpace(TxtDateTime.Text))
            {
                Response.Write("<script>alert('Please make sure all required fields are filled in.');</script>");
                return;
            }

            // 3. Check Fuel Level
            if (RBLFuelLevel.SelectedIndex == -1)
            {
                Response.Write("<script>alert('Please select a fuel level.');</script>");
                return;
            }

            // 4. Check Damage Found
            if (RBLDamageFound.SelectedIndex == -1)
            {
                Response.Write("<script>alert('Please select whether damage was found.');</script>");
                return;
            }


            // 5. Check if this inspection type already exists for this rental
            string cs = ConfigurationManager.ConnectionStrings["GroupPmb3ConnectionString"].ConnectionString;

            string checkSql = @"
    SELECT COUNT(*)
    FROM [VEHICLE INSPECTION]
    WHERE RentalID = @RentalID
      AND InspectionType = @InspectionType";

            using (SqlConnection con = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(checkSql, con))
            {
                cmd.Parameters.AddWithValue("@RentalID", TxtRentalID.Text);
                cmd.Parameters.AddWithValue("@InspectionType", DDLInspectionType.SelectedValue);

                con.Open();

                int existingInspection = (int)cmd.ExecuteScalar();

                if (existingInspection > 0)
                {
                    Response.Write("<script>alert('A " +
                        DDLInspectionType.SelectedValue +
                        " inspection has already been recorded for this rental.');</script>");

                    return;
                }
            }


            // 5. All checks passed
            SqlDSAddInspection.Insert();
            LblMessage.Visible = true;
            LblMessage.Text = "Inspection Added Successfully!";

            //Clear everything
            TxtRentalID.Text = "";
            TxtVehicle.Text = "";
            TxtOdometerR.Text = "";
            TxtInspectionN.Text = "";
            TxtDamageCharges.Text = "";
            RBLDamageFound.ClearSelection();
            DDLDamageType.SelectedIndex = 0;
            DamageTypeSection.Visible = false;
            DamageChargeSection.Visible = false;
        }

        protected void RBLDamageFound_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RBLDamageFound.SelectedValue == "No")
            {
                DDLDamageType.SelectedIndex = 0;
            }

            UpdateDamageDisplay();
        }

        protected void DDLInspectionType_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateDamageDisplay();
        }

        protected void DDLDamageType_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateDamageDisplay();
        }
    }
}