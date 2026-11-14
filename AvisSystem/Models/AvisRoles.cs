using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;

namespace AvisSystem.Models   // <-- use YOUR project namespace
{
    public static class AvisRoles
    {
        public const string Customer = "Customer";
        public const string OfficeAdmin = "OfficeAdmin";
        public const string Manager = "Manager";

        // Creates the three roles if they don't exist yet
        public static void EnsureRoles()
        {
            using (var db = new ApplicationDbContext())
            {
                var rm = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(db));
                foreach (var r in new[] { Customer, OfficeAdmin, Manager })
                    if (!rm.RoleExists(r)) rm.Create(new IdentityRole(r));
            }
        }

        // Highest role wins: Manager > OfficeAdmin > Customer
        public static string HomePageFor(System.Collections.Generic.IList<string> roles)
        {
            if (roles.Contains(Manager) || roles.Contains(OfficeAdmin))
                return "~/AvisPages/Dashboard.aspx";
            if (roles.Contains(Customer))
                return "~/CustomerPages/Vehicles.aspx";
            return "~/Default.aspx";
        }

        // Inactive accounts cannot log in (WEB-02). Needs the IsActive column from Part 7.
        public static bool IsActive(string userName)
        {
            string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var cmd = new SqlCommand("SELECT IsActive FROM AspNetUsers WHERE UserName = @u", con))
            {
                cmd.Parameters.AddWithValue("@u", userName);
                con.Open();
                object o = cmd.ExecuteScalar();
                return o == null || Convert.ToBoolean(o);   // unknown user -> let Identity reject it
            }
        }
    }
}