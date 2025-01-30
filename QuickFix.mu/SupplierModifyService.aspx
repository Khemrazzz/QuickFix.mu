<%@ Page Title="Modify Service" Language="C#" MasterPageFile="~/SupplierDashboardMasterPage.Master" AutoEventWireup="true" CodeBehind="SupplierModifyService.aspx.cs" Inherits="QuickFix.mu.SupplierModifyService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .container1 {
            max-width: 700px;
            margin: 2% auto;
            padding: 30px 20px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .page-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }

        .form-input, .form-dropdown, .form-textarea {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .form-textarea {
            resize: vertical;
            height: 100px;
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

        .validation-error {
            color: #dc3545;
            font-size: 12px;
        }
    </style>

    <div class="container1">
        <h2 class="page-title">Modify Service</h2>

        <!-- Success/Error Message -->
        <asp:Label ID="lblMsg" runat="server" CssClass="message" />

        <!-- Service Selection -->
        <div class="form-group">
            <asp:Label AssociatedControlID="ddlServices" runat="server" CssClass="form-label">Select Service</asp:Label>
            <asp:DropDownList ID="ddlServices" runat="server" CssClass="form-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlServices_SelectedIndexChanged"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvServices" runat="server" ControlToValidate="ddlServices" InitialValue="-1" ErrorMessage="Please select a service." CssClass="validation-error"></asp:RequiredFieldValidator>
        </div>

        <!-- Modify Service Form -->
        <asp:Panel ID="pnlModifyService" runat="server" Visible="false">
            <div class="form-group">
                <asp:Label AssociatedControlID="txtBusinessName" runat="server" CssClass="form-label">Business Name</asp:Label>
                <asp:TextBox ID="txtBusinessName" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBusinessName" runat="server" ControlToValidate="txtBusinessName" ErrorMessage="Business name is required." CssClass="validation-error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="ddlBusinessCategory" runat="server" CssClass="form-label">Business Category</asp:Label>
                <asp:DropDownList ID="ddlBusinessCategory" runat="server" CssClass="form-dropdown"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvBusinessCategory" runat="server" ControlToValidate="ddlBusinessCategory" InitialValue="-1" ErrorMessage="Please select a business category." CssClass="validation-error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtBio" runat="server" CssClass="form-label">Bio</asp:Label>
                <asp:TextBox ID="txtBio" runat="server" CssClass="form-textarea" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtEmail" runat="server" CssClass="form-label">Email</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." CssClass="validation-error"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format." CssClass="validation-error" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtMobileNumber" runat="server" CssClass="form-label">Mobile Number</asp:Label>
                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Mobile number is required." CssClass="validation-error"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revMobileNumber" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Invalid mobile number format." CssClass="validation-error" ValidationExpression="^\d{8,15}$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="ddlDistrict" runat="server" CssClass="form-label">District</asp:Label>
                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-dropdown"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="ddlDistrict" InitialValue="-1" ErrorMessage="Please select a district." CssClass="validation-error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="ddlVillageTown" runat="server" CssClass="form-label">Village/Town</asp:Label>
                <asp:DropDownList ID="ddlVillageTown" runat="server" CssClass="form-dropdown"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvVillageTown" runat="server" ControlToValidate="ddlVillageTown" InitialValue="-1" ErrorMessage="Please select a village/town." CssClass="validation-error"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="chkIsDeleted" runat="server" CssClass="form-label">Archive</asp:Label>
                <asp:CheckBox ID="chkIsDeleted" runat="server" />
            </div>
            <asp:Button ID="btnUpdateService" runat="server" CssClass="submit-button" Text="Update Service" OnClick="btnUpdateService_Click" />
        </asp:Panel>
    </div>
</asp:Content>
