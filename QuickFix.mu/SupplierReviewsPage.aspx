<%@ Page Title="Supplier Reviews" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" 
    AutoEventWireup="true" CodeBehind="SupplierReviewsPage.aspx.cs" 
    Inherits="QuickFix.mu.SupplierReviewsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <header class="page-header" data-background="images/slide01.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>Supplier Reviews</h1>
            <p>Discover what clients are saying about our suppliers.</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Supplier Reviews</li>
            </ol>
        </div>
    </header>

    <section class="sales-team">
        <div class="container">
            <div class="row">
                <!-- Outer Repeater: Clients who have at least one review -->
                <asp:Repeater ID="rptClients" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6">
                            <figure>
                                <!-- Client's Profile Picture -->
                                <img src='<%# ResolveUrl(Eval("ProfilePicture").ToString()) %>' 
                                     alt="Client Image" />

                                <figcaption>
                                    <!-- Client's Name -->
                                    <p><strong>Reviews by this client:</strong></p>
                                    <h4>
                                        
                                        <span><%# Eval("FirstName") %></span> 
                                        <%# Eval("LastName") %>
                                    </h4>

                                    <!-- Nested Repeater: Reviews for each client -->
                                   
                                    <asp:Repeater ID="rptReviews" runat="server" 
                                                  DataSource='<%# Eval("Reviews") %>'>
                                        <ItemTemplate>
                                            <div class="review-box">
                                                <!-- Display the Supplier that was reviewed + services -->
                                                <p>
                                                    <strong>Supplier:</strong> 
                                                    <%# Eval("SupplierFirstName") %> 
                                                    <%# Eval("SupplierLastName") %> 
                                                    (<em><%# Eval("SupplierServices") %></em>)
                                                </p>
                                                <!-- Star rating -->
                                                <p><strong>Rating:</strong> <%# Eval("Stars") %> / 5</p>

                                                <!-- Review Text -->
                                                <p>"<%# Eval("ReviewText") %>"</p>

                                                <!-- Review Date -->
                                                <small>- <%# Eval("ReviewDate", "{0:dd MMM yyyy}") %></small>
                                            </div>
                                            <hr />
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </figcaption>
                            </figure>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
