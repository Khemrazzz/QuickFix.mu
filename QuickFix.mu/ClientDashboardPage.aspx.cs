using System;
using System.Data.SqlClient;
using System.Configuration;

namespace QuickFix.mu
{
    public partial class ClientDashboardPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["ClientUsername"] == null)
            {
                // Redirect to Login Page if not logged in
                Response.Redirect("LogInPage.aspx");
            }
            else
            {
                string username = Session["ClientUsername"].ToString();
                LoadClientData(username);
            }
        }

        private void LoadClientData(string username)
        {
            // Connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT Client_Id, FirstName, LastName, Email, MobileNumber, ProfilePicture, Bio FROM Client WHERE Username = @Username";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            // Populate client details on the page
                            lblWelcome.Text = "Welcome, " + reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                            lblClientID.Text = reader["Client_Id"].ToString();
                            lblEmail.Text = reader["Email"].ToString();
                            lblContact.Text = reader["MobileNumber"].ToString();
                           
                            lblServicePlan.Text = reader["Bio"].ToString();

                            // Load profile picture
                            string profilePicturePath = reader["ProfilePicture"].ToString();
                            imgProfilePicture.ImageUrl = !string.IsNullOrEmpty(profilePicturePath) ? profilePicturePath : "./images/default-profile.jpg";
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions (log them or show error message)
                    lblWelcome.Text = "An error occurred while loading your data.";
                }
            }
        }
    }
}
