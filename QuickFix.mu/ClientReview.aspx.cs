using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickFix.mu
{
    public partial class ClientReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientUsername"] == null)
            {
                // Redirect to the login page and return here after login
                Response.Redirect("LogInPage.aspx?ReturnUrl=ClientReview.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    LoadSuppliers();
                }
            }

        }


        private void LoadSuppliers()
        {
            string connStr = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Supplier_Id, FirstName + ' ' + LastName AS SupplierName FROM Supplier WHERE IsActive = 1 AND IsDeleted = 0";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                ddlSupplier.Items.Clear();
                ddlSupplier.Items.Add(new ListItem("-- Select Supplier --", "0"));

                while (reader.Read())
                {
                    ddlSupplier.Items.Add(new ListItem(reader["SupplierName"].ToString(), reader["Supplier_Id"].ToString()));
                }
                conn.Close();
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string clientUsername = Session["ClientUsername"].ToString();
            int supplierId = int.Parse(ddlSupplier.SelectedValue);
            int stars = int.Parse(ddlStars.SelectedValue);
            string reviewText = txtReview.Text.Trim();

            if (supplierId == 0)
            {
                Response.Write("<script>alert('Please select a supplier.');</script>");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Fetch the client's full name
                string fetchClientNameQuery = "SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName AS FullName FROM Client WHERE Username = @ClientUsername";
                SqlCommand fetchClientNameCmd = new SqlCommand(fetchClientNameQuery, conn);
                fetchClientNameCmd.Parameters.AddWithValue("@ClientUsername", clientUsername);

                string clientFullName = fetchClientNameCmd.ExecuteScalar().ToString();

                // Check if the client already reviewed this supplier
                string checkQuery = "SELECT COUNT(*) FROM CLientReview WHERE Supplier_Id = @SupplierId AND ClientUsername = @ClientUsername";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@SupplierId", supplierId);
                checkCmd.Parameters.AddWithValue("@ClientUsername", clientUsername);

                int existingReviews = (int)checkCmd.ExecuteScalar();
                if (existingReviews > 0)
                {
                    Response.Write("<script>alert('You have already reviewed this supplier.');</script>");
                    return;
                }

                // Insert review
                string insertQuery = "INSERT INTO ClientReview (Supplier_Id, ClientUsername, ClientFullName, Stars, ReviewText) VALUES (@SupplierId, @ClientUsername, @ClientFullName, @Stars, @ReviewText)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                insertCmd.Parameters.AddWithValue("@SupplierId", supplierId);
                insertCmd.Parameters.AddWithValue("@ClientUsername", clientUsername);
                insertCmd.Parameters.AddWithValue("@ClientFullName", clientFullName);
                insertCmd.Parameters.AddWithValue("@Stars", stars);
                insertCmd.Parameters.AddWithValue("@ReviewText", reviewText);

                insertCmd.ExecuteNonQuery();
                conn.Close();

                Response.Write("<script>alert('Review submitted successfully.');</script>");
            }








        }
    }
}