using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace QuickFix.mu
{
    public partial class MaintenanceServicesPage : System.Web.UI.Page
    {
        private readonly string _conString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadDistricts();
                LoadServices();
            }
        }

        private void LoadCategories()
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT Category_Id, Category_Name FROM Category", con);
                con.Open();
                ddlCategory.DataSource = cmd.ExecuteReader();
                ddlCategory.DataTextField = "Category_Name";
                ddlCategory.DataValueField = "Category_Id";
                ddlCategory.DataBind();
                con.Close();
            }
            ddlCategory.Items.Insert(0, new ListItem("All Categories", ""));
        }

        private void LoadDistricts()
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT District_Id, District_Name FROM District", con);
                con.Open();
                ddlDistrict.DataSource = cmd.ExecuteReader();
                ddlDistrict.DataTextField = "District_Name";
                ddlDistrict.DataValueField = "District_Id";
                ddlDistrict.DataBind();
                con.Close();
            }
            ddlDistrict.Items.Insert(0, new ListItem("All Districts", ""));
        }

        private void LoadServices(string searchQuery = "", string category = "", string district = "", string sortBy = "NameAsc")
        {
            string sortColumn = "SSD.BusinessName";
            string sortOrder = "ASC";

            switch (sortBy)
            {
                case "NameAsc":
                    sortColumn = "SSD.BusinessName";
                    sortOrder = "ASC";
                    break;
                case "NameDesc":
                    sortColumn = "SSD.BusinessName";
                    sortOrder = "DESC";
                    break;
                case "Category":
                    sortColumn = "Category.Category_Name";
                    sortOrder = "ASC";
                    break;
                case "District":
                    sortColumn = "District.District_Name";
                    sortOrder = "ASC";
                    break;
            }

            string query = $@"
        SELECT 
            SSD.[Supplier.SD_Id] AS ServiceId, 
            SSD.BusinessName, 
            Category.Category_Name AS BusinessCategory, 
            ISNULL(SSD.ProfilePicture, '/images/team02.jpg') AS ProfilePicture,
            District.District_Name AS District, 
            ISNULL(VT.VT_Name, '') AS VillageTown,
            ISNULL(SSD.MobileNumber, 'Not Available') AS MobileNumber
        FROM [Supplier.ServiceDetails] AS SSD
        LEFT JOIN Category ON SSD.BusinessCategory = Category.Category_Id
        LEFT JOIN District ON SSD.District = District.District_Id
        LEFT JOIN Village_Town AS VT ON SSD.VillageTown = VT.VT_Id
        INNER JOIN Supplier AS S ON SSD.Supplier_Id = S.Supplier_Id
        WHERE 
            SSD.IsDeleted = 0 AND
            S.Services = 'Maintenance' 
            AND (@SearchQuery = '' OR SSD.BusinessName LIKE '%' + @SearchQuery + '%') 
            AND (@Category = '' OR SSD.BusinessCategory = @Category) 
            AND (@District = '' OR SSD.District = @District)
        ORDER BY {sortColumn} {sortOrder}";

            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@SearchQuery", searchQuery);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@District", district);

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                lvServices.DataSource = dt;
                lvServices.DataBind();
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadServices(txtSearch.Text, ddlCategory.SelectedValue, ddlDistrict.SelectedValue);
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadServices(txtSearch.Text, ddlCategory.SelectedValue, ddlDistrict.SelectedValue);
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadServices(txtSearch.Text, ddlCategory.SelectedValue, ddlDistrict.SelectedValue);
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadServices(txtSearch.Text, ddlCategory.SelectedValue, ddlDistrict.SelectedValue, ddlSortBy.SelectedValue);
        }

        // "Book Now" Click Event
        protected void BookNow_Click(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["ClientUsername"] == null && Session["SupplierUsername"] == null)
            {
                // Save the current URL to redirect back after login
                Session["ReturnUrl"] = Request.RawUrl;
                Response.Redirect("LogInPage.aspx");
                return;
            }

            // Check if the logged-in user is a supplier
            if (Session["SupplierUsername"] != null)
            {
                // Notify the supplier they cannot book
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You are logged in as a supplier. Only clients can book services.');", true);
                return;
            }

            // Check if the logged-in user is a client
            if (Session["ClientUsername"] != null)
            {
                // Extract ServiceId from CommandArgument
                Button btn = (Button)sender;
                int serviceId = Convert.ToInt32(btn.CommandArgument);

                // Redirect to booking page
                Response.Redirect($"BookService.aspx?ServiceId={serviceId}");
            }
        }

    }
}