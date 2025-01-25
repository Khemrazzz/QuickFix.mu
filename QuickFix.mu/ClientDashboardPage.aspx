<%@ Page Title="" Language="C#" MasterPageFile="~/ClientDashboardMasterPage.Master" AutoEventWireup="true" CodeBehind="ClientDashboardPage.aspx.cs" Inherits="QuickFix.mu.ClientDashboardPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
      <aside>
          <!-- Profile Picture Section -->
          <div class="profile-photo">
              <img src="./images/profile-1.jpg" alt="Profile Picture">
          </div>

          <!-- Welcome Info -->
          <div class="profile">
              <div class="info">
                  <p>Welcome, <b>John Doe</b></p>
                  <small class="text-muted">Client ID: 12345</small>
              </div>
              <div class="about">
                  <h5>Service Plan</h5>
                  <p>Premium Package</p>
                  <h5>Contact</h5>
                  <p>+1 9876543210</p>
                  <h5>Email</h5>
                  <p>john.doe@example.com</p>
                  <h5>Address</h5>
                  <p>123 Service Street, Cityville</p>
              </div>
          </div>
      </aside>

      <main>
          <div class="dashboard-box">
              <h1>Dashboard Overview</h1>
              <div class="updates">
                  <div class="widgets">
                      <div class="widget card">
                          <div class="icon">
                              <span class="material-icons-sharp">check_circle</span>
                          </div>
                          <div class="details">
                              <h3>Active Services</h3>
                              <h2>5</h2>
                              <small class="text-muted">Updated just now</small>
                          </div>
                      </div>
                      <div class="widget card">
                          <div class="icon">
                              <span class="material-icons-sharp">calendar_today</span>
                          </div>
                          <div class="details">
                              <h3>Upcoming Bookings</h3>
                              <h2>3</h2>
                              <small class="text-muted">Next: Tomorrow</small>
                          </div>
                      </div>
                      <div class="widget card">
                          <div class="icon">
                              <span class="material-icons-sharp">receipt_long</span>
                          </div>
                          <div class="details">
                              <h3>Outstanding Invoices</h3>
                              <h2>$450</h2>
                              <small class="text-muted">Due: Dec 20</small>
                          </div>
                      </div>
                      <div class="widget card">
                          <div class="icon">
                              <span class="material-icons-sharp">support_agent</span>
                          </div>
                          <div class="details">
                              <h3>Open Support Tickets</h3>
                              <h2>2</h2>
                              <small class="text-muted">Updated 2 hours ago</small>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </main>

      <div class="right">
          <div class="announcements">
              <h2>Latest Updates</h2>
              <div class="updates">
                  <div class="message">
                      <p><b>System Update:</b> Maintenance scheduled for Dec 22.</p>
                      <small class="text-muted">5 Minutes Ago</small>
                  </div>
                  <div class="message">
                      <p><b>Promotion:</b> Get 20% off on additional services.</p>
                      <small class="text-muted">1 Hour Ago</small>
                  </div>
                  <div class="message">
                      <p><b>Reminder:</b> Complete your profile for personalized offers.</p>
                      <small class="text-muted">Yesterday</small>
                  </div>
              </div>
          </div>
      </div>
  </div>

  <script src="DASHapp.js"></script>
</asp:Content>
