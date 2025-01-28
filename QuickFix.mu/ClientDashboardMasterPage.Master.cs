using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuickFix.mu
{
    public partial class ClientDashboardMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void lgout()
        {
            if (Session["ClientUsername"] != null)
            {
                //Remove all session
                Session.RemoveAll();
                //Destroy all Session objects
                Session.Abandon();
                //Redirect to homepage or login page
                Response.Redirect("~/HomePage");
            }
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            lgout();
        }

    }
}