using System;
using System.Threading;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using AvisSystem.Models;

namespace AvisSystem
{
    public class Global : HttpApplication
    {
        private static Timer _expiryTimer;

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            try
            {
                AvisRoles.EnsureRoles();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("EnsureRoles failed: " + ex.Message);
            }

            // 24-hour rule: cancel unpaid bookings past their deadline and release the vehicles.
            // First run after 1 minute, then every 5 minutes, even if nobody opens a page.
            _expiryTimer = new Timer(_ =>
            {
                try { BookingService.CancelExpiredBookings(); }
                catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Expiry timer failed: " + ex.Message); }
            }, null, TimeSpan.FromMinutes(1), TimeSpan.FromMinutes(5));
        }
    }
}