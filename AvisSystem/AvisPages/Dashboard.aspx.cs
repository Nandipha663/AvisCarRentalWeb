using AvisSystem.Models;
using System;
using System.Data;
using System.Web.UI;

namespace AvisSystem.AvisPages
{
    public partial class Dashboard : SecurePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Available cars
                DataView dvCars = (DataView)SqlDSAvailableCars.Select(DataSourceSelectArguments.Empty);
                LblAvailableCars.Text = dvCars[0]["AvailableCars"].ToString();

                // Bookings today
                DataView dvBookings = (DataView)SqlDSBookingsToday.Select(DataSourceSelectArguments.Empty);
                LblBookingsToday.Text = dvBookings[0]["BookingsToday"].ToString();

                // Active rentals
                DataView dvActiveRentals = (DataView)SqlDSActiveRentalsCount.Select(DataSourceSelectArguments.Empty);
                LblActiveRentals.Text = dvActiveRentals[0]["ActiveRentals"].ToString();

                // Rentals due today
                DataView dvRentalsDue = (DataView)SqlDSRentalsDueToday.Select(DataSourceSelectArguments.Empty);
                LblRentalsDueToday.Text = dvRentalsDue[0]["RentalsDueToday"].ToString();
            }
        }
    }
}