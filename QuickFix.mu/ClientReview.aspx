<%@ Page Title="Client Review" Language="C#" 
    MasterPageFile="~/ClientDashboardMasterPage.Master" 
    AutoEventWireup="true" CodeBehind="ClientReview.aspx.cs" 
    Inherits="QuickFix.mu.ClientReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Centering the form container */
        .review-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            text-align: left;
        }

        .card {
            border-radius: 15px;
            padding: 30px;
            background: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-control {
            font-size: 1.2rem;
            padding: 12px;
            border-radius: 8px;
            width: 100%; /* Makes dropdowns and text boxes the same width */
        }

        .btn-custom {
            font-size: 1.2rem;
            padding: 12px;
            font-weight: bold;
            border-radius: 10px;
            width: 100%;
            transition: all 0.3s ease-in-out;
            background-color: #007bff;
            color: white;
            border: none;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Making validation text more readable and positioned below */
        .validation-text {
            color: #dc3545;
            font-weight: bold;
            font-size: 1rem;
            display: block;
            margin-top: 5px;
        }

        /* Changing label color to brown */
        .label-brown {
            color: #8B5E3C;
            font-weight: bold;
            font-size: 1.1rem;
            display: block; /* Ensures labels are on their own line */
            margin-bottom: 8px; /* Adds spacing below each label */
        }

        /* Increased spacing between elements */
        .form-group {
            margin-bottom: 20px; /* Adds space below each field */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <!-- Page Title Centered -->
        <h1>Leave a Review</h1>

        <!-- Centered Review Form -->
        <div class="review-container">
            <div class="card mx-auto">
                <div class="card-body">

                    <!-- Select Supplier -->
                    <div class="form-group">
                        <label for="<%= ddlSupplier.ClientID %>" class="label-brown">
                            Select Supplier:
                        </label>
                        <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator 
                            ID="rfvSupplier" runat="server" 
                            ControlToValidate="ddlSupplier" 
                            InitialValue="0"
                            ErrorMessage="Please select a supplier"
                            CssClass="validation-text" Display="Dynamic" />
                    </div>

                    <!-- Rating Dropdown -->
                    <div class="form-group">
                        <label for="<%= ddlStars.ClientID %>" class="label-brown">
                            Rating:
                        </label>
                        <asp:DropDownList ID="ddlStars" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0" Text="Select Rating" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="1">★☆☆☆☆</asp:ListItem>
                            <asp:ListItem Value="2">★★☆☆☆</asp:ListItem>
                            <asp:ListItem Value="3">★★★☆☆</asp:ListItem>
                            <asp:ListItem Value="4">★★★★☆</asp:ListItem>
                            <asp:ListItem Value="5">★★★★★</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator 
                            ID="rfvStars" runat="server"
                            ControlToValidate="ddlStars" InitialValue="0"
                            ErrorMessage="Please select a rating"
                            CssClass="validation-text" Display="Dynamic" />
                    </div>

                    <!-- Review Text -->
                    <div class="form-group">
                        <label for="<%= txtReview.ClientID %>" class="label-brown">
                            Your Review:
                        </label>
                        <asp:TextBox ID="txtReview" runat="server"
                                     CssClass="form-control"
                                     TextMode="MultiLine" Rows="4" />
                        <asp:RequiredFieldValidator 
                            ID="rfvReview" runat="server"
                            ControlToValidate="txtReview"
                            ErrorMessage="Please enter your review"
                            CssClass="validation-text"
                            Display="Dynamic" />
                    </div>

                    <!-- Submit Button -->
                    <asp:Button 
                        ID="btnSubmit" runat="server" 
                        Text="Submit Review" 
                        OnClick="btnSubmit_Click"
                        CssClass="btn btn-custom" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
