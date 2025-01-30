<%@ Page Title="" Language="C#" MasterPageFile="~/SupplierDashboardMasterPage.Master" AutoEventWireup="true" CodeBehind="SupplierDashboardPage.aspx.cs" Inherits="QuickFix.mu.SupplierDashboardPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            padding: 20px;
        }

        aside {
            flex: 1;
            max-width: 400px; /* Increased max width */
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-photo {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .profile-pic {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .info, .about {
            text-align: center;
            margin-top: 10px;
        }

        .info .welcome-label {
            font-size: 22px;
            font-weight: bold;
            color: #333;
        }

        .about h5 {
            font-size: 16px;
            font-weight: bold;
            color: #555;
            margin-bottom: 5px;
        }

        .email-label, .number-label {
            font-size: 14px;
            color: #777;
            word-wrap: break-word;
        }

        main {
            flex: 2;
            background: #f7f7f7;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .dashboard-box h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .widgets {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .widget.card {
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .widget.card .icon {
            font-size: 36px;
            color: #333;
            margin-bottom: 10px;
        }

        .widget.card .details h3 {
            font-size: 18px;
            color: #555;
        }

        .widget.card .details h2 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <aside>
            <!-- Profile Picture Section -->
            <div class="profile-photo">
                <asp:Image ID="imgProfilePicture" runat="server" CssClass="profile-pic" />
            </div>
            <div class="info">
                <asp:Label ID="lblWelcome" runat="server" Text="Welcome, " CssClass="welcome-label"></asp:Label>
                <small class="text-muted">Service Provider</small>
            </div>
            <div class="about">
                <h5>Email</h5>
                <asp:Label ID="lblEmail" runat="server" Text="" CssClass="email-label"></asp:Label>
                <h5>Number</h5>
                <asp:Label ID="lblMobileNumber" runat="server" Text="" CssClass="number-label"></asp:Label>
                <h5>Address</h5>
                <asp:Label ID="lblladdress" runat="server" Text="" CssClass="number-label"></asp:Label>
            </div>
        </aside>

        <main>
            <div class="dashboard-box">
                <h1>Provider Dashboard Overview</h1>
                <div class="widgets">
                    <div class="widget card">
                        <div class="icon">
                            <span class="material-icons-sharp">hourglass_empty</span>
                        </div>
                        <div class="details">
                            <h3>Pending Services</h3>
                            <asp:Label ID="lblPendingServices" runat="server" CssClass="analytics-label"></asp:Label>
                        </div>
                    </div>
                    <div class="widget card">
                        <div class="icon">
                            <span class="material-icons-sharp">check_circle</span>
                        </div>
                        <div class="details">
                            <h3>Approved Services</h3>
                            <asp:Label ID="lblApprovedServices" runat="server" CssClass="analytics-label"></asp:Label>
                        </div>
                    </div>
                    <div class="widget card">
                        <div class="icon">
                            <span class="material-icons-sharp">cancel</span>
                        </div>
                        <div class="details">
                            <h3>Rejected Services</h3>
                            <asp:Label ID="lblRejectedServices" runat="server" CssClass="analytics-label"></asp:Label>
                        </div>
                    </div>
                    <div class="widget card">
                        <div class="icon">
                            <span class="material-icons-sharp">dashboard</span>
                        </div>
                        <div class="details">
                            <h3>Total Services</h3>
                            <asp:Label ID="lblTotalServices" runat="server" CssClass="analytics-label"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
