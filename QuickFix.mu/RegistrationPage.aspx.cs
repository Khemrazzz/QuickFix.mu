using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace QuickFix.mu
{
    public partial class Registration : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial setup logic if needed
            }
        }

        //protected void btnRegister_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString))
        //        {
        //            con.Open();

        //            // Determine the table name based on user type
        //            string tableName = ddlUserType.SelectedValue == "Client" ? "Client" : "Supplier";

        //            // Prepare the INSERT query
        //            string query = $"INSERT INTO {tableName} (FirstName, LastName, Gender, DateOfBirth, Bio, Email, MobileNumber, Country, District, VillageTown, StrAddress, Username, Password, CPassword) " +
        //                           "VALUES (@FirstName, @LastName, @Gender, @DateOfBirth, @Bio, @Email, @MobileNumber, @Country, @District, @VillageTown, @StrAddress, @Username, @Password, @CPassword)";

        //            using (SqlCommand cmd = new SqlCommand(query, con))
        //            {
        //                // Add parameters
        //                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
        //                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
        //                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
        //                cmd.Parameters.AddWithValue("@DateOfBirth", txtDateOfBirth.Text.Trim());
        //                cmd.Parameters.AddWithValue("@Bio", txtBio.Text.Trim());
        //                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
        //                cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text.Trim());
        //                cmd.Parameters.AddWithValue("@Country", txtCountry.Text.Trim());
        //                cmd.Parameters.AddWithValue("@District", txtDistrict.Text.Trim());
        //                cmd.Parameters.AddWithValue("@VillageTown", txtVillageTown.Text.Trim());
        //                cmd.Parameters.AddWithValue("@StrAddress", txtStrAddress.Text.Trim());
        //                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
        //                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
        //                cmd.Parameters.AddWithValue("@CPassword", txtConfirmPassword.Text.Trim());

        //                // Execute the query
        //                int rowsAffected = cmd.ExecuteNonQuery();
        //                if (rowsAffected > 0)
        //                {
        //                    lblMsg.Text = "Registration successful!";
        //                    lblMsg.ForeColor = System.Drawing.Color.Green;
        //                }
        //                else
        //                {
        //                    lblMsg.Text = "Registration failed. Please try again.";
        //                    lblMsg.ForeColor = System.Drawing.Color.Red;
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMsg.Text = $"An error occurred: {ex.Message}";
        //        lblMsg.ForeColor = System.Drawing.Color.Red;
        //        System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
        //    }
        //}


    }
}
