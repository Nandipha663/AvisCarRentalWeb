using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvisSystem.CustomerPages
{
    public partial class Vehicles : AvisSystem.Models.SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookingInformation();
            }
        }

        private void LoadBookingInformation()
        {
            if (Session["PickupLocation"] == null ||
                Session["PickupDate"] == null ||
                Session["PickupTime"] == null ||
                Session["ReturnDate"] == null ||
                Session["ReturnTime"] == null)
            {
                Response.Redirect("MakeBooking.aspx");
                return;
            }


            lblPickupLocation.Text =
                Session["PickupLocation"].ToString();


            lblPickupDate.Text =
                Session["PickupDate"].ToString()
                + " "
                + Session["PickupTime"].ToString();


            lblReturnDate.Text =
                Session["ReturnDate"].ToString()
                + " "
                + Session["ReturnTime"].ToString();
        }

        protected void btnCategoryDetails_Click(object sender, EventArgs e)
        {
           // pnlHatchback.Visible = !pnlHatchback.Visible;
        }

        protected void btnSUVDetails_Click(object sender, EventArgs e)
        {
           // pnlSUV.Visible = !pnlSUV.Visible;
        }

        protected void btnStandardDetails_Click(object sender, EventArgs e)
        {
           // pnlStandard.Visible = !pnlStandard.Visible;
        }

        protected void btnVanDetails_Click(object sender, EventArgs e)
        {
           // pnlVan.Visible = !pnlVan.Visible;
        }

        protected void btnSedanDetails_Click(object sender, EventArgs e)
        {
           // pnlSedan.Visible = !pnlSedan.Visible;
        }

        protected void btnLuxuryDetails_Click(object sender, EventArgs e)
        {
            //pnlLuxury.Visible = !pnlLuxury.Visible;
        }

        protected void btnPremiumDetails_Click(object sender, EventArgs e)
        {
           // pnlPremium.Visible = !pnlPremium.Visible;
        }

        protected void btnCompactDetails_Click(object sender, EventArgs e)
        {
            //pnlCompact.Visible = !pnlCompact.Visible;
        }

        protected void btnSelectVehicle_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;

            string selectedVehicle = button.CommandArgument;

            decimal dailyRate = 0;

            // Get the daily rate based on the selected vehicle
            switch (selectedVehicle)
            {
                case "Toyota Starlet":
                    dailyRate = 450;
                    break;

                case "Mercedes-Benz GLE Coupe":
                    dailyRate = 1000;
                    break;

                case "BMW XM":
                    dailyRate = 950;
                    break;

                case "Hyundai H1":
                    dailyRate = 650;
                    break;

                case "Suzuki Dzire":
                    dailyRate = 550;
                    break;

                case "Range Rover Sport":
                    dailyRate = 1800;
                    break;

                case "BMW 2 Series Gran Coupe":
                    dailyRate = 1200;
                    break;

                case "Volkswagen Polo Vivo":
                    dailyRate = 350;
                    break;
            }

            // Save selected vehicle information
            Session["SelectedVehicle"] = selectedVehicle;
            Session["DailyRate"] = dailyRate;

            // Get booking dates and times from Session
            DateTime pickupDateTime = Convert.ToDateTime(
                Session["PickupDate"].ToString() + " " +
                Session["PickupTime"].ToString());

            DateTime returnDateTime = Convert.ToDateTime(
                Session["ReturnDate"].ToString() + " " +
                Session["ReturnTime"].ToString());

            // Calculate total rental hours
            TimeSpan rentalDuration = returnDateTime - pickupDateTime;

            double totalHours = rentalDuration.TotalHours;

            // Calculate full days
            int fullDays = (int)(totalHours / 24);

            // Calculate remaining hours
            double remainingHours = totalHours % 24;

            // Calculate daily charge
            decimal totalAmount = fullDays * dailyRate;

            // Charge extra hours as a fraction of the daily rate
            if (remainingHours > 0)
            {
                decimal hourlyRate = dailyRate / 24;
                totalAmount += (decimal)remainingHours * hourlyRate;
            }

            // Make sure we have at least one day's charge
            if (totalAmount < dailyRate)
            {
                totalAmount = dailyRate;
            }

            // Save calculated information
            Session["RentalHours"] = totalHours;
            Session["RentalDays"] = fullDays;
            Session["TotalAmount"] = totalAmount;

            // Display total on the page
            lblTotalAmount.Text = "R" + totalAmount.ToString("N2");
        }
    }
}