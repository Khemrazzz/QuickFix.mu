<%@ Page Title="Service Details" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="ServiceDetails.aspx.cs" Inherits="QuickFix.mu.ServiceDetails" %>

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

        .container3 {
            max-width: 1200px;
            margin: 20px auto;
            padding: 10px;
            background-color: #f6e5cd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .service-card {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .service-details {
            flex: 1;
            padding: 20px;
            text-align: left;
        }

            .service-details h2 {
                font-size: 28px;
                color: #333;
                margin-bottom: 15px;
            }

            .service-details p {
                font-size: 16px;
                color: #555;
                margin: 5px 0;
            }

            .service-details .btn {
                padding: 10px 15px;
                background-color: #9f8054;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                display: inline-block;
                margin-top: 15px;
            }

                .service-details .btn:hover {
                    background-color: #ffd599;
                }

        .service-image {
            flex: 0.5;
            display: flex;
            justify-content: center;
            align-items: center;
        }

            .service-image img {
                width: 100%;
                height: auto;
                border-radius: 10px;
            }
    </style>

    <header class="page-header" data-background="images/ser1.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>Service Details</h1>
            <p>Explore all details about the selected service.</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Service Details</li>
            </ol>
        </div>
    </header>

    <div class="container3">
        <asp:Panel ID="pnlServiceDetails" runat="server" Visible="false">
            <div class="service-card">
                <div class="service-details">
                    <h2>
                        <asp:Label ID="lblServiceName" runat="server" /></h2>
                    <p><strong>Category:</strong>
                        <asp:Label ID="lblCategory" runat="server" /></p>
                    <p><strong>About:</strong>
                        <asp:Label ID="lblBio" runat="server" /></p>
                    <p><strong>Location:</strong>
                        <asp:Label ID="lblLocation" runat="server" /></p>
                    <p><strong>Contact Number:</strong>
                        <asp:Label ID="lblContact" runat="server" /></p>
                    <p><strong>Email:</strong>
                        <asp:Label ID="lblEmail" runat="server" /></p>
                    <p><strong>Street Address:</strong>
                        <asp:Label ID="lblStreetAddress" runat="server" /></p>

                    <a href='BookService.aspx?ServiceId=<%# Request.QueryString["ServiceId"] %>' class="btn">Book This Service</a>
                </div>
                <div class="service-image">
                    <img id="imgService" runat="server" alt="Service Image" />
                </div>
            </div>
        </asp:Panel>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
