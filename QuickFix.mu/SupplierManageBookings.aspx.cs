using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace QuickFix.mu
{
    public partial class SupplierManageBookings : System.Web.UI.Page
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
                LoadBookings();
            }
        }

        private void LoadBookings()
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                // Load Pending Bookings
                string pendingQuery = @"
                    SELECT 
                        b.Booking_Id, 
                        CONCAT(c.FirstName, ' ', c.LastName) AS ClientName, 
                        s.BusinessName AS ServiceName, 
                        b.BookingDate, 
                        CONVERT(VARCHAR(5), b.BookingTime, 108) AS BookingTime
                    FROM Bookings b
                    INNER JOIN Client c ON b.Client_Id = c.Client_Id
                    INNER JOIN [Supplier.ServiceDetails] s ON b.Service_Id = s.[Supplier.SD_Id]
                    WHERE b.Status = 'Pending' 
                      AND s.Supplier_Id = (SELECT Supplier_Id FROM Supplier WHERE Username = @SupplierUsername)";

                SqlDataAdapter daPending = new SqlDataAdapter(pendingQuery, con);
                daPending.SelectCommand.Parameters.AddWithValue("@SupplierUsername", Session["SupplierUsername"].ToString());
                DataTable dtPending = new DataTable();
                daPending.Fill(dtPending);
                gvPendingBookings.DataSource = dtPending;
                gvPendingBookings.DataBind();

                // Load Processed Bookings
                string processedQuery = @"
                    SELECT 
                        b.Booking_Id, 
                        CONCAT(c.FirstName, ' ', c.LastName) AS ClientName, 
                        s.BusinessName AS ServiceName, 
                        b.BookingDate, 
                        CONVERT(VARCHAR(5), b.BookingTime, 108) AS BookingTime,
                        b.Status
                    FROM Bookings b
                    INNER JOIN Client c ON b.Client_Id = c.Client_Id
                    INNER JOIN [Supplier.ServiceDetails] s ON b.Service_Id = s.[Supplier.SD_Id]
                    WHERE b.Status != 'Pending' 
                      AND s.Supplier_Id = (SELECT Supplier_Id FROM Supplier WHERE Username = @SupplierUsername)";

                SqlDataAdapter daProcessed = new SqlDataAdapter(processedQuery, con);
                daProcessed.SelectCommand.Parameters.AddWithValue("@SupplierUsername", Session["SupplierUsername"].ToString());
                DataTable dtProcessed = new DataTable();
                daProcessed.Fill(dtProcessed);
                gvProcessedBookings.DataSource = dtProcessed;
                gvProcessedBookings.DataBind();
            }
        }

        protected void gvPendingBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int bookingId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Accept")
            {
                UpdateBookingStatus(bookingId, "Accepted");
                NotifyClient(bookingId, "Accepted");
                LoadBookings();
            }
            else if (e.CommandName == "Reject")
            {
                UpdateBookingStatus(bookingId, "Rejected");
                NotifyClient(bookingId, "Rejected");
                LoadBookings();
            }
        }

        private void UpdateBookingStatus(int bookingId, string status)
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                string query = "UPDATE Bookings SET Status = @Status WHERE Booking_Id = @BookingId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void NotifyClient(int bookingId, string status)
        {
            using (SqlConnection con = new SqlConnection(_conString))
            {
                string query = @"
            SELECT 
                c.Email AS ClientEmail,
                CONCAT(c.FirstName, ' ', c.LastName) AS ClientName,
                s.BusinessName AS ServiceName,
                s.MobileNumber AS ServiceContact,
                b.BookingDate,
                b.BookingTime
            FROM Bookings b
            INNER JOIN Client c ON b.Client_Id = c.Client_Id
            INNER JOIN [Supplier.ServiceDetails] s ON b.Service_Id = s.[Supplier.SD_Id]
            WHERE b.Booking_Id = @BookingId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string clientEmail = reader["ClientEmail"].ToString();
                    string clientName = reader["ClientName"].ToString();
                    string serviceName = reader["ServiceName"].ToString();
                    string serviceContact = reader["ServiceContact"].ToString();
                    DateTime bookingDate = Convert.ToDateTime(reader["BookingDate"]);
                    TimeSpan bookingTime = TimeSpan.Parse(reader["BookingTime"].ToString());

                    string subject = $"Booking {status}";
                    string body = $@"
                <p>Dear {clientName},</p>
                <p>Your booking for the service <strong>{serviceName}</strong> on <strong>{bookingDate:yyyy-MM-dd}</strong> at <strong>{bookingTime}</strong> has been {status.ToLower()}.</p>
                <p>You can contact the service provider at <strong>{serviceContact}</strong> for further details.</p>
                <p>Thank you for using QuickFix!</p>";

                    SendEmail(clientEmail, subject, body);
                }
            }
        }


        private void SendEmail(string recipientEmail, string subject, string body)
        {
            string senderEmail = "s.quickfix.mu@gmail.com";
            string senderPassword = "dqimdxqykoyxopei";

            try
            {
                using (MailMessage mail = new MailMessage(senderEmail, recipientEmail))
                {
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.IsBodyHtml = true;

                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.Credentials = new System.Net.NetworkCredential(senderEmail, senderPassword);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or display the error as needed
                Response.Write($"Error sending email: {ex.Message}");
            }
        }

        protected void gvPendingBookings_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPendingBookings.PageIndex = e.NewPageIndex;
            LoadBookings();
        }

        protected void gvProcessedBookings_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProcessedBookings.PageIndex = e.NewPageIndex;
            LoadBookings();
        }
    }
}
