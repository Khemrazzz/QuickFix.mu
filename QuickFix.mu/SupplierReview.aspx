<%@ Page Title="Supplier Review" Language="C#"  
    MasterPageFile="~/SupplierDashboardMasterPage.Master"
    AutoEventWireup="true" CodeBehind="SupplierReview.aspx.cs"
    Inherits="QuickFix.mu.SupplierReview" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style>
        /* Centering the form container */
        .review-container {
            max-width: 400px; /* Adjusted for better centering */
            margin: 0 auto;   /* Centers the container horizontally */
            padding: 20px;
            text-align: center;
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

        /* Making validation text more readable */
        .validation-text {
            color: #dc3545;
            font-weight: bold;
            font-size: 1rem;
            display: block;
            margin-top: 5px; /* Spacing under validation text */
        }

        /* Changing text color of specific labels to brown */
        .label-brown {
            color: #8B5E3C; /* Adjusted brown color */
            font-weight: bold;
            font-size: 1.1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container">
        <!-- Page Title Centered -->
        <h1>Leave a Review</h1>
        
        <!-- Centered Review Form -->
        <div class="review-container">
            <div class="card mx-auto">
                <div class="card-body">

                    <!-- Supplier and Service Info -->
                    <div class="row mb-4 text-center">
                        <div class="col mb-3">
                            <p class="label-brown">Supplier Name:</p>
                            <asp:Label ID="lblSupplierName" runat="server" CssClass="text-secondary" />
                        </div>
                        <div class="col mb-3">
                            <p class="label-brown">Service:</p>
                            <asp:Label ID="lblService" runat="server" CssClass="text-secondary" />
                        </div>
                    </div>

                    <!-- Review Text -->
                    <div class="mb-4 text-start">
                        <label for="<%= txtMessage.ClientID %>" class="form-label label-brown mb-2">
                            Your Review:
                        </label>
                        <asp:TextBox ID="txtMessage" runat="server"
                                     CssClass="form-control mb-2"
                                     Rows="6" TextMode="MultiLine" />
                        <asp:RequiredFieldValidator 
                            ID="rfvMessage"
                            runat="server"
                            ControlToValidate="txtMessage"
                            ErrorMessage="Please enter your review"
                            CssClass="validation-text"
                            Display="Dynamic" />
                    </div>

                    <!-- Submit Button -->
                    <asp:Button 
                        ID="btnSubmit" 
                        runat="server" 
                        Text="Submit Review"
                        OnClick="btnSubmit_Click"
                        CssClass="btn btn-custom" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
