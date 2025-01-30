<%@ Page Title="Add Service" Language="C#" MasterPageFile="~/SupplierDashboardMasterPage.Master" AutoEventWireup="true" CodeBehind="SupplierAddService.aspx.cs" Inherits="QuickFix.mu.SupplierAddService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .container1 {
            max-width: 700px;
            margin: 2% auto;
            padding: 30px 20px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .page-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .service-form {
            text-align: left;
        }
/*        .form-group {
            margin-bottom: 20px;
        }*/
        .form-label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #555;
        }
        .form-input, .form-dropdown, .form-textarea {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: 0.3s ease;
        }
        .form-input:focus, .form-dropdown:focus, .form-textarea:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .form-textarea {
            resize: vertical;
            height: 100px;
        }
        .form-actions {
            margin-top: 30px;
        }
        .submit-button {
            padding: 12px 30px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #9f8054;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.3s ease;
            width: 100%;
        }
        .submit-button:hover {
            background-color: #e5b97b;
        }
        .message {
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }
        .message.success {
            color: #28a745;
        }
        .message.error {
            color: #dc3545;
        }
    </style>

    <div class="container1">
        <!-- Page Title -->


        <!-- Service Form -->
        <div class="service-form">
                    <h2 class="page-title">Add a New Service</h2>
            <asp:Label ID="lblMsg" runat="server" CssClass="message" />

            <div class="form-group">
                <asp:Label AssociatedControlID="txtBusinessName" runat="server" CssClass="form-label">Business Name</asp:Label>
                <asp:TextBox ID="txtBusinessName" runat="server" CssClass="form-input" placeholder="Enter Business Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="ddlBusinessCategory" runat="server" CssClass="form-label">Business Category</asp:Label>
                <asp:DropDownList ID="ddlBusinessCategory" runat="server" CssClass="form-dropdown"></asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="fileUploadImage" runat="server" CssClass="form-label">Upload Profile Picture</asp:Label>
                <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-input"></asp:FileUpload>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtBio" runat="server" CssClass="form-label">Bio</asp:Label>
                <asp:TextBox ID="txtBio" runat="server" CssClass="form-textarea" TextMode="MultiLine" placeholder="Enter a short bio about your service"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtEmail" runat="server" CssClass="form-label">Email</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="Enter your email"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtMobileNumber" runat="server" CssClass="form-label">Mobile Number</asp:Label>
                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-input" placeholder="Enter mobile number"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="ddlDistrict" runat="server" CssClass="form-label">District</asp:Label>
                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-dropdown"></asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="ddlVillageTown" runat="server" CssClass="form-label">Village/Town</asp:Label>
                <asp:DropDownList ID="ddlVillageTown" runat="server" CssClass="form-dropdown"></asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtStrAddress" runat="server" CssClass="form-label">Street Address</asp:Label>
                <asp:TextBox ID="txtStrAddress" runat="server" CssClass="form-textarea" TextMode="MultiLine" placeholder="Enter full street address"></asp:TextBox>
            </div>

            <div class="form-actions">
                <asp:Button ID="btnSubmitService" runat="server" CssClass="submit-button" Text="Add Service" OnClick="btnSubmitService_Click" />
            </div>
        </div>
    </div>
</asp:Content>
