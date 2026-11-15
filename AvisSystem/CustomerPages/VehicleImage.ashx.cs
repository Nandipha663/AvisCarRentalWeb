using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace AvisSystem.CustomerPages
{
    public class VehicleImage : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string vin = context.Request.QueryString["vin"];
            if (string.IsNullOrEmpty(vin)) { context.Response.StatusCode = 404; return; }

            string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (var con = new SqlConnection(cs))
            using (var cmd = new SqlCommand("SELECT [Image] FROM VEHICLE WHERE VehicleVinNo = @vin", con))
            {
                cmd.Parameters.AddWithValue("@vin", vin);
                con.Open();
                object o = cmd.ExecuteScalar();
                if (o == null || o == DBNull.Value) { context.Response.StatusCode = 404; return; }

                byte[] bytes = (byte[])o;
                bool isPng = bytes.Length > 4 && bytes[0] == 0x89 && bytes[1] == 0x50;
                context.Response.ContentType = isPng ? "image/png" : "image/jpeg";
                context.Response.Cache.SetCacheability(HttpCacheability.Public);
                context.Response.Cache.SetMaxAge(TimeSpan.FromHours(1));
                context.Response.BinaryWrite(bytes);
            }
        }

        public bool IsReusable { get { return true; } }
    }
}