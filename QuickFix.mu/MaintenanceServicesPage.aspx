<%@ Page Title="Maintenance Services" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="MaintenanceServicesPage.aspx.cs" Inherits="QuickFix.mu.MaintenanceServicesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <style>
        .breadcrumb {
            background: none;
            padding: 0;
            margin: 10px 0 0;
        }

        .breadcrumb-item a {
            color: #fff;
            text-decoration: underline;
        }

        .breadcrumb-item.active {
            color: #ddd;
        }

        .container {
            max-width: 1500px;
            margin: 10px auto;
            padding: 20px;
        }

        .service-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); /* Creates a flexible grid layout */
            gap: 20px; /* Space between items */
            justify-content: center;
        }

        .service-item {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            padding: 15px;
        }



            .service-item img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

            .service-item h3 {
                font-size: 18px;
                margin: 10px 0;
                color: #333;
            }

            .service-item p {
                font-size: 14px;
                color: #777;
                margin: 5px 0;
            }

        .btn {
            padding: 10px 15px;
            margin: 10px 0;
            display: inline-block;
            background-color: #9f8054;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn2 {
            padding: 10px 15px;
            margin: 10px 0;
            display: inline-block;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

            .btn2:hover {
                background-color: #ffd599;
            }

        .btn:hover {
            background-color: #ffd599;
        }
    </style>


    <header class="page-header" data-background="images/x5.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>Maintenance Services</h1>
            <p>Find professional maintenance services for your needs.</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Start</a></li>
                <li class="breadcrumb-item active" aria-current="page">Maintenance Services</li>
            </ol>
        </div>
    </header>

    <div class="container">
        <!-- Filters -->
        <asp:UpdatePanel ID="UpdatePanelFilters" runat="server">
            <ContentTemplate>
                <div class="row mb-4">

                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                            <asp:ListItem Text="All Categories" Value="" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                            <asp:ListItem Text="All Districts" Value="" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlSortBy" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged">
                            <asp:ListItem Text="Sort by Name (A-Z)" Value="NameAsc" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Sort by Name (Z-A)" Value="NameDesc"></asp:ListItem>
                            <asp:ListItem Text="Sort by Category" Value="Category"></asp:ListItem>
                            <asp:ListItem Text="Sort by District" Value="District"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Services" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

        <!-- Service List -->


        <asp:UpdatePanel ID="UpdatePanelServices" runat="server">
            <ContentTemplate>
                <div class="service-list">
                    <asp:ListView ID="lvServices" runat="server">
                        <ItemTemplate>
                            <div class="service-item">
                                <img src='<%# ResolveUrl(Eval("ProfilePicture").ToString()) %>' alt="Profile Image" />
                                <h3><%# Eval("BusinessName") %></h3>
                                <p>Category: <%# Eval("BusinessCategory") %></p>
                                <p>Location: <%# Eval("District") %>, <%# Eval("VillageTown") %></p>
                                <p>Phone: <strong><%# Eval("MobileNumber") %></strong></p>
                                <a href='ServiceDetails.aspx?ServiceId=<%# Eval("ServiceId") %>' class="btn">View Details</a>
                                <asp:Button ID="btnBookNow" runat="server" CssClass="btn2" Text="Book Now" CommandArgument='<%# Eval("ServiceId") %>' OnClick="BookNow_Click" />
                            </div>
                        </ItemTemplate>


                    </asp:ListView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>


    </div>
</asp:Content>