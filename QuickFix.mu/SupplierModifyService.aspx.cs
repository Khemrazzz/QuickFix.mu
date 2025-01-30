using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace QuickFix.mu
{
    public partial class SupplierModifyService : System.Web.UI.Page
    {
        private readonly string _conString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SupplierUsername"] == null)
            {
                Response.Redirect("LogInPage.aspx");
            }

            if (!IsPostBack)
            {
                PopulateServiceList();
                PopulateCategoryList();
                PopulateDistrictList();
                PopulateVillageTownList();
            }
        }

        private void PopulateServiceList()
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("SELECT [Supplier.SD_Id], BusinessName FROM [Supplier.ServiceDetails] WHERE Supplier_Id = (SELECT Supplier_Id FROM Supplier WHERE Username = @Username)", con);
                cmd.Parameters.AddWithValue("@Username", Session["SupplierUsername"].ToString());
                con.Open();
                ddlServices.DataSource = cmd.ExecuteReader();
                ddlServices.DataTextField = "BusinessName";
                ddlServices.DataValueField = "Supplier.SD_Id";
                ddlServices.DataBind();
                ddlServices.Items.Insert(0, new ListItem("Select a Service", "-1"));
            }
        }

        private void PopulateCategoryList()
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Category_Id, Category_Name FROM Category", con);
                con.Open();
                ddlBusinessCategory.DataSource = cmd.ExecuteReader();
                ddlBusinessCategory.DataTextField = "Category_Name";
                ddlBusinessCategory.DataValueField = "Category_Id";
                ddlBusinessCategory.DataBind();
            }
        }

        private void PopulateDistrictList()
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("SELECT District_Id, District_Name FROM District", con);
                con.Open();
                ddlDistrict.DataSource = cmd.ExecuteReader();
                ddlDistrict.DataTextField = "District_Name";
                ddlDistrict.DataValueField = "District_Id";
                ddlDistrict.DataBind();
            }
        }

        private void PopulateVillageTownList()
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("SELECT VT_Id, VT_Name FROM Village_Town", con);
                con.Open();
                ddlVillageTown.DataSource = cmd.ExecuteReader();
                ddlVillageTown.DataTextField = "VT_Name";
                ddlVillageTown.DataValueField = "VT_Id";
                ddlVillageTown.DataBind();
            }
        }

        protected void ddlServices_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlServices.SelectedValue == "-1")
            {
                pnlModifyService.Visible = false;
                return;
            }

            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Supplier.ServiceDetails] WHERE [Supplier.SD_Id] = @ServiceId", con);
                cmd.Parameters.AddWithValue("@ServiceId", ddlServices.SelectedValue);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtBusinessName.Text = reader["BusinessName"].ToString();
                    ddlBusinessCategory.SelectedValue = reader["BusinessCategory"].ToString();
                    txtBio.Text = reader["Bio"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtMobileNumber.Text = reader["MobileNumber"].ToString();
                    ddlDistrict.SelectedValue = reader["District"].ToString();
                    ddlVillageTown.SelectedValue = reader["VillageTown"].ToString();
                    chkIsDeleted.Checked = Convert.ToBoolean(reader["IsDeleted"]);
                    pnlModifyService.Visible = true;
                }
            }
        }

        protected void btnUpdateService_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand(@"UPDATE [Supplier.ServiceDetails] 
                                                  SET BusinessName = @BusinessName, 
                                                      BusinessCategory = @BusinessCategory, 
                                                      Bio = @Bio, 
                                                      Email = @Email, 
                                                      MobileNumber = @MobileNumber, 
                                                      District = @District, 
                                                      VillageTown = @VillageTown, 
                                                      IsDeleted = @IsDeleted 
                                                  WHERE [Supplier.SD_Id] = @ServiceId", con);

                cmd.Parameters.AddWithValue("@BusinessName", txtBusinessName.Text.Trim());
                cmd.Parameters.AddWithValue("@BusinessCategory", ddlBusinessCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Bio", txtBio.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@District", ddlDistrict.SelectedValue);
                cmd.Parameters.AddWithValue("@VillageTown", ddlVillageTown.SelectedValue);
                cmd.Parameters.AddWithValue("@IsDeleted", chkIsDeleted.Checked);
                cmd.Parameters.AddWithValue("@ServiceId", ddlServices.SelectedValue);

                con.Open();
                int rowsUpdated = cmd.ExecuteNonQuery();
                if (rowsUpdated > 0)
                {
                    lblMsg.Text = "Service updated successfully!";
                    lblMsg.CssClass = "message success";
                }
                else
                {
                    lblMsg.Text = "Error updating service.";
                    lblMsg.CssClass = "message error";
                }
            }
        }
    }
}
