using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickFix.mu
{
    public partial class RegistrationPage : Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // If you want a DOB range (e.g. 10..65 years old):
                DateTime now = DateTime.Now;
                rvClientDOB.MinimumValue = now.AddYears(-65).ToString("yyyy-MM-dd");
                rvClientDOB.MaximumValue = now.AddYears(-10).ToString("yyyy-MM-dd");

                rvSupplierDOB.MinimumValue = now.AddYears(-65).ToString("yyyy-MM-dd");
                rvSupplierDOB.MaximumValue = now.AddYears(-10).ToString("yyyy-MM-dd");

                // Load Districts for both Client & Supplier
                LoadDistricts(ddlClientDistrict);
                LoadDistricts(ddlSupplierDistrict);
            }
        }

        // ---------- LOADING DISTRICTS ----------
        private void LoadDistricts(DropDownList ddl)
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                SqlCommand cmd = new SqlCommand("SELECT District_Id, District_Name FROM District", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddl.DataSource = reader;
                ddl.DataTextField = "District_Name";
                ddl.DataValueField = "District_Id";
                ddl.DataBind();
                reader.Close();
            }
            ddl.Items.Insert(0, new ListItem("Select District", "-1"));
        }

        // ---------- POPULATE VILLAGE/TOWN by District ----------
        private void LoadVillagesByDistrict(DropDownList ddl, int districtId)
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                // Example: you have a stored procedure named "GetVillagesTownsByDistrict"
                SqlCommand cmd = new SqlCommand("GetVillagesTownsByDistrict", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DistrictId", districtId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddl.DataSource = reader;
                ddl.DataTextField = "VT_Name";  // your DB column name for village/town
                ddl.DataValueField = "VT_Id";   // primary key
                ddl.DataBind();
                reader.Close();
            }
            ddl.Items.Insert(0, new ListItem("Select Village/Town", "-1"));
        }

        // ---------- CLIENT District Changed ----------
        protected void ddlClientDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.TryParse(ddlClientDistrict.SelectedValue, out int distId) && distId != -1)
            {
                LoadVillagesByDistrict(ddlClientVillageTown, distId);
            }
            else
            {
                ddlClientVillageTown.Items.Clear();
                ddlClientVillageTown.Items.Insert(0, new ListItem("Select Village/Town", "-1"));
            }
        }

        // ---------- SUPPLIER District Changed ----------
        protected void ddlSupplierDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.TryParse(ddlSupplierDistrict.SelectedValue, out int distId) && distId != -1)
            {
                LoadVillagesByDistrict(ddlSupplierVillageTown, distId);
            }
            else
            {
                ddlSupplierVillageTown.Items.Clear();
                ddlSupplierVillageTown.Items.Insert(0, new ListItem("Select Village/Town", "-1"));
            }
        }

        // ---------- VALIDATIONS ----------
        protected void cvClientPassLen_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !(args.Value.Length < 8 || args.Value.Length > 12);
        }
        protected void cvSupplierPassLen_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !(args.Value.Length < 8 || args.Value.Length > 12);
        }

        // ** NEW: Check if username is taken (across both tables) **
        private bool IsUsernameTaken(string username)
        {
            int count = 0;
            using (SqlConnection con = new SqlConnection(_conString))
            {
                con.Open();

                // 1) Check Client table
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Client WHERE Username = @Username", con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    count += (int)cmd.ExecuteScalar();
                }

                // 2) Check Supplier table
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Supplier WHERE Username = @Username", con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    count += (int)cmd.ExecuteScalar();
                }
            }
            // If count > 0 => username found
            return (count > 0);
        }

        // ** NEW: CustomValidator for Client Username uniqueness **
        protected void cvClientUsernameTaken_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (IsUsernameTaken(args.Value.Trim()))
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        // ** NEW: CustomValidator for Supplier Username uniqueness **
        protected void cvSupplierUsernameTaken_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (IsUsernameTaken(args.Value.Trim()))
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        // ---------- CLIENT REGISTRATION ----------
        protected void btnClientRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string fname = txtClientFName.Text.Trim();
                string mname = txtClientMName.Text.Trim();
                string lname = txtClientLName.Text.Trim();
                string gender = ddlClientGender.SelectedValue;
                string gtag = ddlClientGTag.SelectedValue;
                string dob = txtClientDOB.Text.Trim();
                string bio = txtClientBio.Text.Trim();
                string email = txtClientEmail.Text.Trim();
                string mobile = txtClientMobile.Text.Trim();
                string districtVal = ddlClientDistrict.SelectedValue;
                string villageVal = ddlClientVillageTown.SelectedValue;
                string address = txtClientStreetAddress.Text.Trim();
                string username = txtClientUsername.Text.Trim();

                string encPass = Encrypt(txtClientPass.Text.Trim());
                string encCPass = Encrypt(txtClientCPass.Text.Trim());

                string profilePicPath = SaveFileIfValid(fuClientProfilePic, "~/clientImages/");

                using (SqlConnection con = new SqlConnection(_conString))
                {
                    string query = @"
                INSERT INTO Client 
                (FirstName, MiddleName, LastName, Gender, GTag, DateOfBirth, ProfilePicture,
                 Bio, Email, MobileNumber, Country, District, VillageTown, StrAddress,
                 Username, Password, CPassword, Status, Approval, IsActive, IsDeleted, FailedLoginAttempts)
                VALUES
                (@FName, @MName, @LName, @Gender, @GTag, @DOB, @ProfilePic,
                 @Bio, @Email, @Mobile, @Country, @District, @VillageTown, @StrAddress,
                 @Username, @Password, @CPassword, @Status, @Approval, @IsActive, @IsDeleted, @FailedLoginAttempts)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@FName", fname);
                    cmd.Parameters.AddWithValue("@MName", mname);
                    cmd.Parameters.AddWithValue("@LName", lname);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@GTag", gtag);
                    cmd.Parameters.AddWithValue("@DOB", dob);
                    cmd.Parameters.AddWithValue("@ProfilePic", profilePicPath ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@Bio", bio);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Mobile", mobile);
                    cmd.Parameters.AddWithValue("@Country", "");
                    cmd.Parameters.AddWithValue("@District", districtVal);
                    cmd.Parameters.AddWithValue("@VillageTown", villageVal);
                    cmd.Parameters.AddWithValue("@StrAddress", address);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", encPass);
                    cmd.Parameters.AddWithValue("@CPassword", encCPass);
                    cmd.Parameters.AddWithValue("@Status", "Inactive");
                    cmd.Parameters.AddWithValue("@Approval", "pending");
                    cmd.Parameters.AddWithValue("@IsActive", true);
                    cmd.Parameters.AddWithValue("@IsDeleted", false);
                    cmd.Parameters.AddWithValue("@FailedLoginAttempts", 0);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                // Show the success modal and trigger JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "ShowModal", "showSuccessModal();", true);
            }
        }


        // ---------- SUPPLIER REGISTRATION ----------
        protected void btnSupplierRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string fname = txtSupplierFName.Text.Trim();
                string mname = txtSupplierMName.Text.Trim();
                string lname = txtSupplierLName.Text.Trim();
                string gender = ddlSupplierGender.SelectedValue;
                string gtag = ddlSupplierGTag.SelectedValue;
                string dob = txtSupplierDOB.Text.Trim();
                string bio = txtSupplierBio.Text.Trim();
                string email = txtSupplierEmail.Text.Trim();
                string mobile = txtSupplierMobile.Text.Trim();
                string districtVal = ddlSupplierDistrict.SelectedValue;
                string villageVal = ddlSupplierVillageTown.SelectedValue;
                string address = txtSupplierStreetAddress.Text.Trim();
                string username = txtSupplierUsername.Text.Trim();
                string service = ddlSupplierServices.SelectedValue;

                string encPass = Encrypt(txtSupplierPass.Text.Trim());
                string encCPass = Encrypt(txtSupplierCPass.Text.Trim());

                string profilePicPath = SaveFileIfValid(fuSupplierProfilePic, "~/supplierImages/");

                using (SqlConnection con = new SqlConnection(_conString))
                {
                    string query = @"
                INSERT INTO Supplier
                (FirstName, MiddleName, LastName, Gender, GTag, DateOfBirth, ProfilePicture,
                 Bio, Services, Email, MobileNumber, Country, District, VillageTown, StrAddress,
                 Username, Password, CPassword, Status, Approval, IsActive, IsDeleted, FailedLoginAttempts)
                VALUES
                (@FName, @MName, @LName, @Gender, @GTag, @DOB, @ProfilePic,
                 @Bio, @Services, @Email, @Mobile, @Country, @District, @VillageTown, @StrAddress,
                 @Username, @Password, @CPassword, @Status, @Approval, @IsActive, @IsDeleted, @FailedLoginAttempts)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@FName", fname);
                    cmd.Parameters.AddWithValue("@MName", mname);
                    cmd.Parameters.AddWithValue("@LName", lname);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@GTag", gtag);
                    cmd.Parameters.AddWithValue("@DOB", dob);
                    cmd.Parameters.AddWithValue("@ProfilePic", profilePicPath ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@Bio", bio);
                    cmd.Parameters.AddWithValue("@Services", service);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Mobile", mobile);
                    cmd.Parameters.AddWithValue("@Country", "");
                    cmd.Parameters.AddWithValue("@District", districtVal);
                    cmd.Parameters.AddWithValue("@VillageTown", villageVal);
                    cmd.Parameters.AddWithValue("@StrAddress", address);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", encPass);
                    cmd.Parameters.AddWithValue("@CPassword", encCPass);
                    cmd.Parameters.AddWithValue("@Status", "Inactive");
                    cmd.Parameters.AddWithValue("@Approval", "pending");
                    cmd.Parameters.AddWithValue("@IsActive", true);
                    cmd.Parameters.AddWithValue("@IsDeleted", false);
                    cmd.Parameters.AddWithValue("@FailedLoginAttempts", 0);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                // Show the success modal and trigger JavaScript
                ClientScript.RegisterStartupScript(this.GetType(), "ShowModal", "showSuccessModal();", true);
            }
        }



        // ---------- ENCRYPTION ----------
        private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212"; // sample key
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                var pdb = new Rfc2898DeriveBytes(EncryptionKey,
                    new byte[] { 0x49, 0x76, 0x61, 0x6e,
                                 0x20, 0x4d, 0x65, 0x64,
                                 0x76, 0x65, 0x64, 0x65,
                                 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms,
                        encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        // ---------- FILE UPLOAD HELPER ----------
        private string SaveFileIfValid(FileUpload fu, string folderPath)
        {
            if (fu.HasFile)
            {
                string ext = Path.GetExtension(fu.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                {
                    string fileName = Path.GetFileName(fu.FileName);
                    string serverPath = Server.MapPath(folderPath + fileName);
                    fu.SaveAs(serverPath);
                    return folderPath + fileName; // Return the relative path for DB
                }
            }
            return null;
        }
    }
}
