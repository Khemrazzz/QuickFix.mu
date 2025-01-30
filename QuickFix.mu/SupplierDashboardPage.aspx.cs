using System;
using System.Data.SqlClient;
using System.Configuration;

namespace QuickFix.mu
{
    public partial class SupplierDashboardPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["SupplierUsername"] == null)
            {
                // Redirect to Login Page if not logged in
                Response.Redirect("LogInPage.aspx");
            }
            else
            {
                string username = Session["SupplierUsername"].ToString();
                LoadSupplierData(username);
                LoadServiceAnalytics(username);
            }
        }

        private void LoadSupplierData(string username)
        {
            // Connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT FirstName, LastName, Email, MobileNumber, ProfilePicture, StrAddress FROM Supplier WHERE Username = @Username";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            // Populate user details on the page
                            lblWelcome.Text = "Welcome, " + reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                            lblEmail.Text = reader["Email"].ToString();
                            lblMobileNumber.Text = reader["MobileNumber"].ToString();
                            lblladdress.Text = reader["StrAddress"].ToString();

                            // Load profile picture
                            string profilePicturePath = reader["ProfilePicture"].ToString();
                            imgProfilePicture.ImageUrl = !string.IsNullOrEmpty(profilePicturePath) ? profilePicturePath : "./images/default-profile.jpg";
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exception (e.g., log error)
                }
            }
        }

        private void LoadServiceAnalytics(string username)
        {
            // Connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    // Get Supplier ID
                    string getSupplierIdQuery = "SELECT Supplier_Id FROM Supplier WHERE Username = @Username";
                    int supplierId;
                    using (SqlCommand cmd = new SqlCommand(getSupplierIdQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        supplierId = (int)cmd.ExecuteScalar();
                    }

                    // Query for Pending Services
                    string queryPending = "SELECT COUNT(*) FROM [Supplier.ServiceDetails] WHERE Supplier_Id = @SupplierId AND Status = 'Pending'";
                    lblPendingServices.Text = ExecuteScalar(queryPending, supplierId, con).ToString();

                    // Query for Approved Services
                    string queryApproved = "SELECT COUNT(*) FROM [Supplier.ServiceDetails] WHERE Supplier_Id = @SupplierId AND Status = 'Approved'";
                    lblApprovedServices.Text = ExecuteScalar(queryApproved, supplierId, con).ToString();

                    // Query for Rejected Services
                    string queryRejected = "SELECT COUNT(*) FROM [Supplier.ServiceDetails] WHERE Supplier_Id = @SupplierId AND Status = 'Rejected'";
                    lblRejectedServices.Text = ExecuteScalar(queryRejected, supplierId, con).ToString();

                    // Query for Total Services
                    string queryTotal = "SELECT COUNT(*) FROM [Supplier.ServiceDetails] WHERE Supplier_Id = @SupplierId";
                    lblTotalServices.Text = ExecuteScalar(queryTotal, supplierId, con).ToString();
                }
                catch (Exception ex)
                {
                    // Handle exception (e.g., log error)
                }
            }
        }

        private int ExecuteScalar(string query, int supplierId, SqlConnection con)
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@SupplierId", supplierId);
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }
}
