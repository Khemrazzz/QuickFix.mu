using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickFix.mu
{
    public partial class SupplierAddService : System.Web.UI.Page
    {
        private string _conString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SupplierUsername"] == null)
            {
                Response.Redirect("LogInPage.aspx");
            }

            if (!IsPostBack)
            {
                PopulateCategoryList();
                PopulateDistrictList();
                PopulateVillageTownList();
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
                ddlBusinessCategory.Items.Insert(0, new ListItem("Choose Category", "-1"));
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
                ddlDistrict.Items.Insert(0, new ListItem("Choose District", "-1"));
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
                ddlVillageTown.Items.Insert(0, new ListItem("Choose Village/Town", "-1"));
            }
        }

        protected void btnSubmitService_Click(object sender, EventArgs e)
        {
            if (Session["SupplierUsername"] == null)
            {
                lblMsg.Text = "Error: You must be logged in to add a service.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string supplierUsername = Session["SupplierUsername"].ToString();
            string serviceImage = "";

            if (fileUploadImage.HasFile)
            {
                string fileName = Path.GetFileName(fileUploadImage.PostedFile.FileName);
                string filePath = "/images/services/" + fileName;
                fileUploadImage.PostedFile.SaveAs(Server.MapPath(filePath));
                serviceImage = filePath;

            }

            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [Supplier.ServiceDetails] (Supplier_Id, BusinessName, BusinessCategory, ProfilePicture, Bio, Email, MobileNumber, District, VillageTown, StrAddress, Status, Approval, IsDeleted) " +
                                "VALUES ((SELECT Supplier_Id FROM Supplier WHERE Username = @SupplierUsername), @BusinessName, @BusinessCategory, @ProfilePicture, @Bio, @Email, @MobileNumber, @District, @VillageTown, @StrAddress, @Status, @Approval, @IsDeleted)", con);

                cmd.Parameters.AddWithValue("@SupplierUsername", supplierUsername);
                cmd.Parameters.AddWithValue("@BusinessName", txtBusinessName.Text.Trim());
                cmd.Parameters.AddWithValue("@BusinessCategory", ddlBusinessCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@ProfilePicture", serviceImage);
                cmd.Parameters.AddWithValue("@Bio", txtBio.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@District", ddlDistrict.SelectedValue);
                cmd.Parameters.AddWithValue("@VillageTown", ddlVillageTown.SelectedValue);
                cmd.Parameters.AddWithValue("@StrAddress", txtStrAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", "Pending");
                cmd.Parameters.AddWithValue("@Approval", "0");
                cmd.Parameters.AddWithValue("@IsDeleted", false);

                con.Open();
                int rowsInserted = cmd.ExecuteNonQuery();
                con.Close();

                if (rowsInserted > 0)
                {
                    lblMsg.Text = "Service added successfully!";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMsg.Text = "Error while adding service.";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}