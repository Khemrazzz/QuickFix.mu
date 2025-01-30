<%@ Page Title="Manage Bookings" Language="C#" MasterPageFile="~/SupplierDashboardMasterPage.Master" AutoEventWireup="true" CodeBehind="SupplierManageBookings.aspx.cs" Inherits="QuickFix.mu.SupplierManageBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .container1 {
            max-width: 1200px;
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

        .table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
            text-align: center;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
        }

        .table th {
            background-color: #4d403a;
            color: #fff;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn-accept {
            background-color: #28a745;
            color: white;
            padding: 5px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-reject {
            background-color: #dc3545;
            color: white;
            padding: 5px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>

    <div class="container1">
        <h2 class="page-title">Manage Bookings</h2>

        <!-- Pending Bookings -->
        <h3>Pending Bookings</h3>
        <asp:GridView ID="gvPendingBookings" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover"
            OnRowCommand="gvPendingBookings_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvPendingBookings_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="ClientName" HeaderText="Client Name" />
                <asp:BoundField DataField="ServiceName" HeaderText="Service Name" />
                <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="BookingTime" HeaderText="Booking Time" DataFormatString="{0:hh\\:mm}" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnAccept" runat="server" CommandName="Accept" Text="Accept" CommandArgument='<%# Eval("Booking_Id") %>' CssClass="btn-accept" />
                        <asp:Button ID="btnReject" runat="server" CommandName="Reject" Text="Reject" CommandArgument='<%# Eval("Booking_Id") %>' CssClass="btn-reject" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <!-- Processed Bookings -->
        <h3>Processed Bookings</h3>
        <asp:GridView ID="gvProcessedBookings" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover"
            AllowPaging="True" PageSize="5" OnPageIndexChanging="gvProcessedBookings_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="ClientName" HeaderText="Client Name" />
                <asp:BoundField DataField="ServiceName" HeaderText="Service Name" />
                <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="BookingTime" HeaderText="Booking Time" DataFormatString="{0:hh\\:mm}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
