using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Threading;
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
                AvisSystem.Models.AvisRoles.EnsureRoles();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("EnsureRoles failed: " + ex.Message);
            }
            // Cancel unpaid bookings after 24 hours, even if nobody opens a page
            _expiryTimer = new Timer(_ =>
            {
                try { BookingService.CancelExpiredBookings(); }
                catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Expiry timer failed: " + ex.Message); }
            }, null, TimeSpan.FromMinutes(1), TimeSpan.FromMinutes(5));

        }

    }
}