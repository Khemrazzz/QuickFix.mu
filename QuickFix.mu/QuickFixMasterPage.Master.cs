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
            if (IsPostBack && Request["__EVENTTARGET"] == "btnLogin")
            {
                // Handle button click
                Response.Redirect("~/LogInPage.aspx");
            }

        }
    }
}