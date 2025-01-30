using System;
using System.Data.SqlClient;
using System.Configuration;

namespace QuickFix.mu
{
    public partial class ServiceDetails : System.Web.UI.Page
    {
        private readonly string _conString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string serviceId = Request.QueryString["ServiceId"];
                if (!string.IsNullOrEmpty(serviceId))
                {
                    LoadServiceDetails(serviceId);
                }
                else
                {
                    lblMessage.Text = "Service not found.";
                }
            }
        }

        private void LoadServiceDetails(string serviceId)
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                string query = @"
                    SELECT 
                        SSD.BusinessName, 
                        Category.Category_Name AS BusinessCategory, 
                        ISNULL(SSD.ProfilePicture, '/images/default.jpg') AS ProfilePicture, 
                        SSD.Bio, 
                        CONCAT(District.District_Name, ', ', ISNULL(VT.VT_Name, '')) AS Location, 
                        SSD.MobileNumber, 
                        SSD.Email, 
                        SSD.StrAddress
                    FROM [Supplier.ServiceDetails] AS SSD
                    LEFT JOIN Category ON SSD.BusinessCategory = Category.Category_Id
                    LEFT JOIN District ON SSD.District = District.District_Id
                    LEFT JOIN Village_Town AS VT ON SSD.VillageTown = VT.VT_Id
                    WHERE SSD.[Supplier.SD_Id] = @ServiceId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ServiceId", serviceId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblServiceName.Text = reader["BusinessName"].ToString();
                    lblCategory.Text = reader["BusinessCategory"].ToString();
                    lblBio.Text = reader["Bio"].ToString();
                    lblLocation.Text = reader["Location"].ToString();
                    lblContact.Text = reader["MobileNumber"].ToString();
                    lblEmail.Text = reader["Email"].ToString();
                    lblStreetAddress.Text = reader["StrAddress"].ToString();
                    imgService.Src = ResolveUrl(reader["ProfilePicture"].ToString());

                    pnlServiceDetails.Visible = true;
                }
                else
                {
                    lblMessage.Text = "Service details not available.";
                }
            }
        }
    }
}
