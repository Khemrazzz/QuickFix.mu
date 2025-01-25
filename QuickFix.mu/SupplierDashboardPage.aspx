<%@ Page Title="" Language="C#" MasterPageFile="~/SupplierDashboardMasterPage.Master" AutoEventWireup="true" CodeBehind="SupplierDashboardPage.aspx.cs" Inherits="QuickFix.mu.SupplierDashboardPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="container">
        <aside>
            <!-- Profile Picture Section -->
            <div class="profile-photo">
                <img src="./images/provider-profile.jpg" alt="Profile Picture">
            </div>

            <!-- Welcome Info -->
            <div class="profile">
                <div class="info">
                    <p>Welcome, <b>Provider Name</b></p>
                    <small class="text-muted">Service Provider</small>
                </div>
                <div class="about">
                    <h5>Total Posts</h5>
                    <p>25</p>
                    <h5>Total Inquiries</h5>
                    <p>120</p>
                    <h5>Total Earnings</h5>
                    <p>$15,000</p>
                </div>
            </div>
        </aside>

        <main>
            <div class="dashboard-box">
                <h1>Provider Dashboard Overview</h1>
                <div class="widgets">
                    <div class="widget card">
                        <div class="icon">
                            <span class="material-icons-sharp">visibility</span>
                        </div>
                        <div class="details">
                            <h3>Total Views</h3>
                            <h2>8,500</h2>
                            <small class="text-muted">Updated just now</small>
                        </div>
                    </div>
                    <div class="widget card">
                        <div class="icon">
                            <span class="material-icons-sharp">post_add</span>
                        </div>
                        <div class="details">
                            <h3>Active Posts</h3>
                            <h2>10</h2>
                            <small class="text-muted">Updated just now</small>
                        </div>
                    </div>
                    <div class="widget card">
                        <div class="icon">
                            <span class="material-icons-sharp">message</span>
                        </div>
                        <div class="details">
                            <h3>New Messages</h3>
                            <h2>5</h2>
                            <small class="text-muted">Last: 10 mins ago</small>
                        </div>
                    </div>
                    <div class="widget card">
                        <div class="icon">
                            <span class="material-icons-sharp">attach_money</span>
                        </div>
                        <div class="details">
                            <h3>Pending Earnings</h3>
                            <h2>$1,200</h2>
                            <small class="text-muted">Next Payout: Dec 30</small>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <div class="right">
            <div class="announcements">
                <h2>Notifications</h2>
                <div class="updates">
                    <div class="message">
                        <p><b>New Inquiry:</b> Client "John Doe" wants more details on "Service A".</p>
                        <small class="text-muted">5 Minutes Ago</small>
                    </div>
                    <div class="message">
                        <p><b>Post Alert:</b> Your post "Service B" received 200 views today.</p>
                        <small class="text-muted">1 Hour Ago</small>
                    </div>
                    <div class="message">
                        <p><b>Payment Reminder:</b> Payout of $500 scheduled for Dec 20.</p>
                        <small class="text-muted">Yesterday</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="DASHapp.js"></script>


</asp:Content>
