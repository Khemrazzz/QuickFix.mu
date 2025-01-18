using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace QuickFix.mu
{
    public partial class LogInPage : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Logic for first-time page load if needed                              
            }
        }

        protected void btnLogin2_Click(object sender, EventArgs e)    
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMsg.Text = "Please enter both Username and Password.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(_conString))
                {
                    con.Open();

                    // Query to check the user in both tables (Client and Supplier)
                    string query = @"SELECT 'Client' AS UserType FROM Client WHERE Username = @Username AND Password = @Password
                                     UNION
                                     SELECT 'Supplier' AS UserType FROM Supplier WHERE Username = @Username AND Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        object result = cmd.ExecuteScalar();

                        if (result != null)
                        {
                            // User authenticated successfully
                            string userType = result.ToString();
                            lblMsg.Text = $"Login successful! Welcome, {userType}.";
                            lblMsg.ForeColor = System.Drawing.Color.Green;

                            // Redirect based on user type
                            if (userType == "Client")
                                Response.Redirect("dash/aDmin.html");
                            else if (userType == "Supplier")
                                Response.Redirect("dash/Client.html");
                        }
                        else
                        {
                            // User not found
                            lblMsg.Text = "Invalid Username or Password.";
                            lblMsg.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = $"An error occurred: {ex.Message}";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }
        }
    }
}
