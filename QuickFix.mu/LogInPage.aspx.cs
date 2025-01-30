using System;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
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
                // Optional: Clear session data for fresh login
                // Session.Clear();
            }
        }

        protected void btnLogin2_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Check if username and password are provided
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

                    // Fetch encrypted password and user type from database
                    string query = @"
                        SELECT 
                            Password, 
                            'Client' AS UserType 
                        FROM Client 
                        WHERE Username = @Username
                        UNION
                        SELECT 
                            Password, 
                            'Supplier' AS UserType 
                        FROM Supplier 
                        WHERE Username = @Username";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string storedEncryptedPassword = reader["Password"].ToString();
                                string userType = reader["UserType"].ToString();

                                // Decrypt the stored password
                                string decryptedPassword = Decrypt(storedEncryptedPassword);

                                if (password == decryptedPassword)
                                {
                                    // Clear previous session data
                                    Session["ClientUsername"] = null;
                                    Session["SupplierUsername"] = null;

                                    // Store user session
                                    if (userType == "Client")
                                    {
                                        Session["ClientUsername"] = username;
                                        Session["UserType"] = "Client";
                                    }
                                    else if (userType == "Supplier")
                                    {
                                        Session["SupplierUsername"] = username;
                                        Session["UserType"] = "Supplier";
                                    }

                                    // Redirect based on return URL or dashboard
                                    if (Session["ReturnUrl"] != null)
                                    {
                                        string returnUrl = Session["ReturnUrl"].ToString();
                                        Session["ReturnUrl"] = null; // Clear the return URL session
                                        Response.Redirect(returnUrl);
                                    }
                                    else
                                    {
                                        // Default behavior if no return URL
                                        if (userType == "Client")
                                        {
                                            Response.Redirect("ClientDashboardPage.aspx");
                                        }
                                        else if (userType == "Supplier")
                                        {
                                            Response.Redirect("SupplierDashboardPage.aspx");
                                        }
                                    }
                                }
                                else
                                {
                                    lblMsg.Text = "Invalid Username or Password.";
                                    lblMsg.ForeColor = System.Drawing.Color.Red;
                                }
                            }
                            else
                            {
                                lblMsg.Text = "Invalid Username or Password.";
                                lblMsg.ForeColor = System.Drawing.Color.Red;
                            }
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

        // Decrypt method
        private string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212"; // Use the same key as in encryption
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                var pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
                    0x49, 0x76, 0x61, 0x6e,
                    0x20, 0x4d, 0x65, 0x64,
                    0x76, 0x65, 0x64, 0x65,
                    0x76
                });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
    }
}
