<%@ Page Title="Book Service" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="BookService.aspx.cs" Inherits="QuickFix.mu.BookService" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <style>
        .btn {
            padding: 10px 15px;
            margin: 10px 0;
            display: inline-block;
            background-color: #9f8054;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #ffd599;
        }
    </style>

    <header class="page-header" data-background="images/book.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>Book Service</h1>
            <p>Secure trusted professionals for your construction needs today. Fast, reliable, and hassle-free service bookings at your fingertips.</p>
        </div>
    </header>

    <div class="container">
        <h2>Book Service</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <asp:Panel ID="pnlBookingForm" runat="server">
            <asp:Label Text="Service Name:" AssociatedControlID="lblServiceName" runat="server"></asp:Label>
            <asp:Label ID="lblServiceName" runat="server"></asp:Label><br />
            <asp:Label Text="Booking Date:" AssociatedControlID="txtBookingDate" runat="server"></asp:Label>
            <asp:TextBox ID="txtBookingDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:CustomValidator ID="cvBookingDate" runat="server" ControlToValidate="txtBookingDate"
                ErrorMessage="Booking date must be a future date." ForeColor="Red" OnServerValidate="cvBookingDate_ServerValidate">
            </asp:CustomValidator>
            <br />
            <asp:Label Text="Booking Time:" AssociatedControlID="txtBookingTime" runat="server"></asp:Label>
            <asp:TextBox ID="txtBookingTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox><br />
            <asp:Label Text="Additional Notes:" AssociatedControlID="txtNotes" runat="server"></asp:Label>
            <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox><br />
            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit Booking" OnClick="btnSubmit_Click" />
        </asp:Panel>
    </div>
</asp:Content>
