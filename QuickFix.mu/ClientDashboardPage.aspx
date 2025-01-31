<%@ Page Title="" Language="C#" MasterPageFile="~/ClientDashboardMasterPage.Master" AutoEventWireup="true" CodeBehind="ClientDashboardPage.aspx.cs" Inherits="QuickFix.mu.ClientDashboardPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
      <aside>
         <!-- Profile Picture Section -->
            <div class="profile-photo">
                <asp:Image ID="imgProfilePicture" runat="server" CssClass="profile-pic" Alt="Profile Picture" />
            </div>

            <!-- Welcome Info -->
            <div class="profile">
                <div class="info">
                    <p>
                        <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-label" />
                    </p>
                    <small class="text-muted">
                        Client ID: <asp:Label ID="lblClientID" runat="server" CssClass="client-id-label" />
                    </small>
                </div>
                <div class="about">
                    <h5>Service Plan</h5>
                    <p>
                        <asp:Label ID="lblServicePlan" runat="server" CssClass="service-plan-label" />
                    </p>
                    <h5>Contact</h5>
                    <p>
                        <asp:Label ID="lblContact" runat="server" CssClass="contact-label" />
                    </p>
                    <h5>Email</h5>
                    <p>
                        <asp:Label ID="lblEmail" runat="server" CssClass="email-label" />
                    </p>
                    <h5>Address</h5>
                    <p>
                        
                    </p>
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

  </div>

  <script src="DASHapp.js"></script>
</asp:Content>
