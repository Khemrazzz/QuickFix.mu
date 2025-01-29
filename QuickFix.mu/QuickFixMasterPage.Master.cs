using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickFix.mu
{
    public partial class QuickFixMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUserLogin();

            // Handle postback from either button
            if (IsPostBack)
            {
                string target = Request["__EVENTTARGET"];
                if (target == "btnLogin")
                {
                    // user clicked "Login"
                    Response.Redirect("~/LogInPage.aspx");
                }
                else if (target == "btnProfile")
                {
                    // user clicked "Profile"
                    if (Session["ClientUsername"] != null)
                    {
                        Response.Redirect("~/ClientDashboardPage.aspx");
                    }
                    else if (Session["SupplierUsername"] != null)
                    {
                        Response.Redirect("~/SupplierDashboardPage.aspx");
                    }
                    else
                    {
                        // If they're not logged in, possibly redirect to login or do nothing
                        Response.Redirect("~/LogInPage.aspx");
                    }
                }
            }
        }

        private void CheckUserLogin()
        {
            if (Session["ClientUsername"] != null)
            {
                // Show Profile, hide Login
                btnLogin.Visible = false;
                phProfileButton.Visible = true;
            }
            else if (Session["SupplierUsername"] != null)
            {
                // Show Profile, hide Login
                btnLogin.Visible = false;
                phProfileButton.Visible = true;
            }
            else
            {
                // Show Login, hide Profile
                btnLogin.Visible = true;
                phProfileButton.Visible = false;
            }
        }








    }
}