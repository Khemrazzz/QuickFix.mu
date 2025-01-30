using System;
using System.Data.SqlClient;
using System.Configuration;
using WebGrease.Activities;

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
                            if (!string.IsNullOrEmpty(profilePicturePath))
                            {
                                imgProfilePicture.ImageUrl = profilePicturePath;
                            }
                            else
                            {
                                imgProfilePicture.ImageUrl = "./images/default-profile.jpg"; // Default picture
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                   
                }
            }
        }
    }
}
