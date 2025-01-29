using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace QuickFix.mu
{
    public partial class ContactPage : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {




        }

        protected void sendMessageButton_Click(object sender, EventArgs e)
        {
            string firstname = txtfname.Text;
            string lastname = txtlname.Text;
            string email = txtemail.Text;
            string subject = txtsubject.Text;
            string message = txtmessage.Text;

            using (SqlConnection conn = new SqlConnection(_conString))
            {
                string ContactPage = @"INSERT INTO [dbo].[Contact] (First_Name, Last_Name, Email, Subject, Message) 
                      VALUES (@First_Name, @Last_Name, @Email, @Subject, @Message)";

                using (SqlCommand cmd = new SqlCommand(ContactPage, conn))
                {
                    cmd.Parameters.AddWithValue("@First_Name", firstname);
                    cmd.Parameters.AddWithValue("@Last_Name", lastname);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Subject", subject);
                    cmd.Parameters.AddWithValue("@Message", message);

                    sendemail();
                    conn.Open();

                    cmd.ExecuteNonQuery();
                    conn.Close();

                }
            }

            // Optionally, display a success message or redirect to another page
            Response.Redirect("homePage.aspx");
        }


        private void sendemail()
        {

            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage m = new MailMessage(smtpSection.From, txtemail.Text.Trim()))
            {
                SmtpClient sc = new SmtpClient();
                try
                {
                    m.Subject = "Quick-Fix-Support";
                    m.IsBodyHtml = true;
                    StringBuilder msgBody = new StringBuilder();
                    msgBody.Append("Dear " + txtfname.Text + ",Thank you contacting us, Our support team shall be in touch with you in 2-3 business days.");

                    //msgBody.Append(txtbody.Text.Trim()); 

                    //msgBody.Append("<a href='https://" + HttpContext.Current.Request.Url.Authority + "/'>......</ a > ");
                    m.Body = msgBody.ToString();
                    sc.Host = smtpSection.Network.Host;
                    sc.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                    sc.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                    sc.Credentials = networkCred;
                    sc.Port = smtpSection.Network.Port;
                    sc.Send(m);

                    Response.Write("Email Sent successfully");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

    }
}