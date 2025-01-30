using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;

namespace QuickFix.mu
{
    public partial class SupplierReviewsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClientReviews();
            }
        }

        private void LoadClientReviews()
        {
            string connString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Using INNER JOIN here ensures we only get Clients that have at least one Review
                // and we only get rows where a ClientReview + Supplier record also exists.
                string query = @"
                    SELECT 
                        c.Client_Id,
                        c.FirstName         AS ClientFirstName,
                        c.LastName          AS ClientLastName,
                        c.ProfilePicture    AS ClientProfilePicture,
                        c.Username          AS ClientUsername,

                        cr.ReviewText,
                        cr.ReviewDate,
                        cr.Stars,
                        
                        s.FirstName AS SupplierFirstName,
                        s.LastName  AS SupplierLastName,
                        s.Services  AS SupplierServices

                    FROM Client c
                        INNER JOIN ClientReview cr ON c.Username = cr.ClientUsername
                        INNER JOIN Supplier    s  ON cr.Supplier_Id = s.Supplier_Id
                    WHERE c.IsActive = 1 
                      AND c.IsDeleted = 0
                    ORDER BY c.Client_Id, cr.ReviewDate DESC
                ";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Structure the data: each Client + a list of their reviews
                List<ClientWithReviews> clientList = new List<ClientWithReviews>();

                foreach (DataRow row in dt.Rows)
                {
                    // Identify the client by their username (or Client_Id)
                    string clientUsername = row["ClientUsername"].ToString();

                    // Try to find this client in the existing list
                    var existingClient = clientList.Find(c =>
                        c.Username.Equals(clientUsername, StringComparison.OrdinalIgnoreCase));

                    if (existingClient == null)
                    {
                        existingClient = new ClientWithReviews
                        {
                            ClientId = Convert.ToInt32(row["Client_Id"]),
                            Username = clientUsername,
                            FirstName = row["ClientFirstName"].ToString(),
                            LastName = row["ClientLastName"].ToString(),
                            ProfilePicture = row["ClientProfilePicture"].ToString(),
                            Reviews = new List<ClientReviewInfo>()
                        };
                        clientList.Add(existingClient);
                    }

                    // Since it's an INNER JOIN, every row here definitely has review data
                    existingClient.Reviews.Add(new ClientReviewInfo
                    {
                        ReviewText = row["ReviewText"].ToString(),
                        ReviewDate = Convert.ToDateTime(row["ReviewDate"]),
                        Stars = Convert.ToInt32(row["Stars"]),
                        SupplierFirstName = row["SupplierFirstName"].ToString(),
                        SupplierLastName = row["SupplierLastName"].ToString(),
                        SupplierServices = row["SupplierServices"].ToString()
                    });
                }

                // Bind the structured list to the outer repeater
                rptClients.DataSource = clientList;
                rptClients.DataBind();
            }
        }
    }

    /// <summary>
    /// Represents a single client along with all the reviews they've authored.
    /// </summary>
    public class ClientWithReviews
    {
        public int ClientId { get; set; }
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ProfilePicture { get; set; }

        public List<ClientReviewInfo> Reviews { get; set; }
    }

    /// <summary>
    /// Represents a single review, including star rating and info about the supplier.
    /// </summary>
    public class ClientReviewInfo
    {
        public string ReviewText { get; set; }
        public DateTime ReviewDate { get; set; }
        public int Stars { get; set; }

        public string SupplierFirstName { get; set; }
        public string SupplierLastName { get; set; }
        public string SupplierServices { get; set; }
    }
}
