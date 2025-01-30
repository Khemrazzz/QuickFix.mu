using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickFix.mu
{
    public partial class SupplierReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SupplierUsername"] == null)
            {
                // Redirect to login page if not logged in
                Response.Redirect("LogInPage.aspx?ReturnUrl=SupplierReview.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    LoadSupplierDetails();
                }
            }
        }

        private void LoadSupplierDetails()
        {
            string supplierUsername = Session["SupplierUsername"].ToString();
            string connStr = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName AS SupplierName, Services FROM Supplier WHERE Username = @SupplierUsername";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SupplierUsername", supplierUsername);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblSupplierName.Text = reader["SupplierName"].ToString();
                    lblService.Text = reader["Services"].ToString();
                }
                conn.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string supplierUsername = Session["SupplierUsername"].ToString();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrWhiteSpace(message))
            {
                Response.Write("<script>alert('Please enter your review.');</script>");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string insertQuery = "INSERT INTO SupplierReview (SupplierUsername, ReviewText, ReviewDate) VALUES (@SupplierUsername, @ReviewText, GETDATE())";
                SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                insertCmd.Parameters.AddWithValue("@SupplierUsername", supplierUsername);
                insertCmd.Parameters.AddWithValue("@ReviewText", message);

                insertCmd.ExecuteNonQuery();
                conn.Close();

                Response.Write("<script>alert('Review submitted successfully.');</script>");
            }
        }
    }
}
