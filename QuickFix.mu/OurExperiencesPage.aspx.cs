using System;
using System.Configuration;
using System.Data.SqlClient;

namespace QuickFix.mu
{
    public partial class OurExperiencesPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }

        private void BindRepeater()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

            // Note: SupplierReview references Supplier via 'SupplierUsername' = 'Username'.
            //       There's NO 'Supplier_Id' in SupplierReview, so we join on the Username fields.
            string query = @"
                SELECT 
                    sr.Review_Id,
                    s.FirstName + ' ' + s.LastName AS SupplierFullName,
                    s.Services,
                    s.ProfilePicture AS SupplierProfilePicture,
                    sr.ReviewText,
                    sr.ReviewDate,
                    si.Image AS ServiceImage
                FROM SupplierReview sr
                INNER JOIN Supplier s
                    ON sr.SupplierUsername = s.Username
                LEFT JOIN ServiceImages si
                    ON s.Services = si.Service
                ORDER BY sr.ReviewDate DESC
            ";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    rptReviews.DataSource = cmd.ExecuteReader();
                    rptReviews.DataBind();
                }
            }
        }
    }
}
