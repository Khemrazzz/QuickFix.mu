using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Net.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace QuickFix.mu
{
    public partial class BookService : System.Web.UI.Page
    {
        private string _conString = ConfigurationManager.ConnectionStrings["QuickFixDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientUsername"] == null)
            {
                Response.Redirect("LogInPage.aspx");
            }
            else if (Session["SupplierUsername"] != null)
            {
                lblMessage.Text = "Only clients can book services.";
                pnlBookingForm.Visible = false;
                return;
            }

            if (!IsPostBack)
            {
                string serviceId = Request.QueryString["ServiceId"];
                if (!string.IsNullOrEmpty(serviceId))
                {
                    LoadServiceDetails(serviceId);
                }
                else
                {
                    Response.Redirect("ConstructionServicesPage.aspx");
                }
            }
        }

        private void LoadServiceDetails(string serviceId)
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                string query = "SELECT BusinessName FROM [Supplier.ServiceDetails] WHERE [Supplier.SD_Id] = @ServiceId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ServiceId", serviceId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblServiceName.Text = reader["BusinessName"].ToString();
                }
                else
                {
                    Response.Redirect("ConstructionServicesPage.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string clientUsername = Session["ClientUsername"].ToString();
            string serviceId = Request.QueryString["ServiceId"];
            DateTime bookingDate;
            TimeSpan bookingTime;

            // Validate booking date and time
            if (!DateTime.TryParse(txtBookingDate.Text, out bookingDate) || !TimeSpan.TryParse(txtBookingTime.Text, out bookingTime))
            {
                lblMessage.Text = "Invalid date or time.";
                lblMessage.ForeColor = System.Drawing.Color.Red; // Set the error message color to red
                return;
            }

            // Check if the booking date is in the future
            if (bookingDate <= DateTime.Today)
            {
                lblMessage.Text = "Booking date must be a future date.";
                lblMessage.ForeColor = System.Drawing.Color.Red; // Set the error message color to red
                return;
            }

            using (SqlConnection con = new SqlConnection(_conString))
            {
                string getClientIdQuery = "SELECT Client_Id, FirstName + ' ' + LastName AS ClientName FROM Client WHERE Username = @Username";
                SqlCommand getClientIdCmd = new SqlCommand(getClientIdQuery, con);
                getClientIdCmd.Parameters.AddWithValue("@Username", clientUsername);

                con.Open();
                SqlDataReader clientReader = getClientIdCmd.ExecuteReader();
                int clientId = 0;
                string clientName = "";
                if (clientReader.Read())
                {
                    clientId = (int)clientReader["Client_Id"];
                    clientName = clientReader["ClientName"].ToString();
                }
                clientReader.Close();

                // Check if a booking already exists for the same date
                string checkBookingQuery = @"
            SELECT COUNT(*) 
            FROM Bookings 
            WHERE Client_Id = @ClientId AND Service_Id = @ServiceId AND BookingDate = @BookingDate";
                SqlCommand checkBookingCmd = new SqlCommand(checkBookingQuery, con);
                checkBookingCmd.Parameters.AddWithValue("@ClientId", clientId);
                checkBookingCmd.Parameters.AddWithValue("@ServiceId", serviceId);
                checkBookingCmd.Parameters.AddWithValue("@BookingDate", bookingDate);

                int existingBookingCount = (int)checkBookingCmd.ExecuteScalar();

                if (existingBookingCount > 0)
                {
                    lblMessage.Text = "You have already booked this service on the selected date.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // Insert new booking
                string insertQuery = @"
            INSERT INTO Bookings (Client_Id, Service_Id, BookingDate, BookingTime, AdditionalNotes)
            VALUES (@ClientId, @ServiceId, @BookingDate, @BookingTime, @Notes)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@ClientId", clientId);
                insertCmd.Parameters.AddWithValue("@ServiceId", serviceId);
                insertCmd.Parameters.AddWithValue("@BookingDate", bookingDate);
                insertCmd.Parameters.AddWithValue("@BookingTime", bookingTime);
                insertCmd.Parameters.AddWithValue("@Notes", txtNotes.Text);

                insertCmd.ExecuteNonQuery();

                // Fetch supplier email
                string getSupplierEmailQuery = @"
            SELECT s.Email 
            FROM [Supplier.ServiceDetails] sd
            JOIN Supplier s ON sd.Supplier_Id = s.Supplier_Id
            WHERE sd.[Supplier.SD_Id] = @ServiceId";
                SqlCommand getSupplierEmailCmd = new SqlCommand(getSupplierEmailQuery, con);
                getSupplierEmailCmd.Parameters.AddWithValue("@ServiceId", serviceId);

                string supplierEmail = getSupplierEmailCmd.ExecuteScalar()?.ToString();

                // Send email to supplier
                if (!string.IsNullOrEmpty(supplierEmail))
                {
                    SendBookingEmailToSupplier(supplierEmail, clientName, bookingDate, bookingTime);
                }

                // Success message
                lblMessage.Text = "Booking submitted successfully! Redirecting to homepage...";
                lblMessage.ForeColor = System.Drawing.Color.Green; // Set the success message color to green
                pnlBookingForm.Visible = false;

                // Redirect to home page after 5 seconds
                string script = @"
            setTimeout(function() {
                window.location.href = 'HomePage.aspx';
            }, 5000);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "RedirectToHome", script, true);
            }
        }

        private void SendBookingEmailToSupplier(string supplierEmail, string clientName, DateTime bookingDate, TimeSpan bookingTime)
        {
            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage mail = new MailMessage(smtpSection.From, supplierEmail))
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = smtpSection.Network.Host,
                    EnableSsl = smtpSection.Network.EnableSsl,
                    Credentials = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password),
                    Port = smtpSection.Network.Port
                };

                try
                {
                    mail.Subject = "New Booking Request";
                    mail.IsBodyHtml = true;
                    StringBuilder msgBody = new StringBuilder();
                    msgBody.Append($"<p>A new booking has been made by <strong>{clientName}</strong>.</p>");
                    msgBody.Append($"<p>Scheduled for: <strong>{bookingDate:dddd, MMMM dd, yyyy}</strong> at <strong>{bookingTime}</strong>.</p>");
                    msgBody.Append("<p>Please review the details in your dashboard.</p>");
                    mail.Body = msgBody.ToString();

                    smtp.Send(mail);
                }
                catch (Exception ex)
                {
                    // Handle any errors related to email sending
                    Response.Write($"Error sending email: {ex.Message}");
                }
            }
        }





        protected void cvBookingDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime inputDate;
            args.IsValid = DateTime.TryParse(args.Value, out inputDate) && inputDate > DateTime.Today;
        }
    }
}
