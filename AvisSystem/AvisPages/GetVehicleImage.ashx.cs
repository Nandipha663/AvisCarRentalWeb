using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


namespace AvisSystem.AvisPages
{
    /// <summary>
    /// Summary description for GetVehicleImage
    /// </summary>
    public class GetVehicleImage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string vin = context.Request.QueryString["vin"];

            if (string.IsNullOrEmpty(vin))
                return;

            string connectionString =
                "Data Source=146.230.177.46;Initial Catalog=GroupPmb3;User ID=GroupPmb3;Password=tt9d2h;TrustServerCertificate=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Image FROM VEHICLE WHERE VehicleVinNo = @VIN";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@VIN", vin);

                    con.Open();

                    object result = cmd.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        byte[] imageBytes = (byte[])result;

                        context.Response.ContentType = "image/jpeg";
                        context.Response.BinaryWrite(imageBytes);
                    }
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}