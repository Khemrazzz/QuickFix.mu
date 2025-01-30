<%@ Page Title="" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true"  
    CodeBehind="OurExperiencesPage.aspx.cs" Inherits="QuickFix.mu.OurExperiencesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Any head content here -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <header class="page-header" data-background="images/slide01.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>News</h1>
            <p>The smaller male cones release pollen, which fertilizes the female</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Start</a></li>
                <li class="breadcrumb-item active" aria-current="page">News</li>
            </ol>
        </div>
        <!-- end container -->
    </header>
    <!-- end page-header -->

    <section class="blog">
      <div class="container">
        <div class="row">
            <div class="col-lg-8">
                
                <!-- START OF REPEATER -->
                <asp:Repeater ID="rptReviews" runat="server">
                    <HeaderTemplate>
                        <!-- Optional header markup -->
                    </HeaderTemplate>

                    <ItemTemplate>
                        <div class="post">
                            <figure class="post-image">
                                <!-- Supplier image (from ServiceImages) -->
                                <img src='<%# ResolveUrl(Eval("ServiceImage").ToString()) %>' alt="Supplier Image" />
                            </figure>

                            <div class="post-content">
                                <!-- Display Supplier's Name + Services as the post title -->
                                <h2 class="post-title">
                                    <a href="NewsDetailPage.aspx">
                                        Service – <%# Eval("Services") %>
                                    </a>
                                </h2>

                                <!-- Display Supplier's profile/name -->
                                <div class="post-author">
                                   <img src='<%# ResolveUrl(Eval("SupplierProfilePicture").ToString()) %>'
                                        alt="Supplier Profile"
                                        style="width: 50px; height: 50px; object-fit: cover;" />
                                    <span>By</span>
                                    <a href="#"> <%# Eval("SupplierFullName") %></a>
                                </div>

                                <!-- Display the review text (no rating) -->
                                <p class="post-intro"><%# Eval("ReviewText") %></p>
                            </div>
                            <!-- end post-content -->
                        </div>
                        <!-- end post -->
                    </ItemTemplate>

                    <FooterTemplate>
                        <!-- Optional footer markup -->
                    </FooterTemplate>
                </asp:Repeater>
                <!-- END OF REPEATER -->

            </div>
            <!-- end col-8 -->

            <div class="col-12">
                <!-- Simple pagination UI (static, just for layout) -->
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">«</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active">
                        <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">»</a></li>
                </ul>
            </div>
            <!-- end col-12 -->
        </div>
        <!-- end row -->
      </div>
      <!-- end container --> 
    </section>
</asp:Content>
