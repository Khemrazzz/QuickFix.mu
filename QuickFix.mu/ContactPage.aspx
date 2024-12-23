<%@ Page Title="" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="QuickFix.mu.ContactPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <header class="page-header" data-background="images/slide01.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>Contact</h1>
            <p>The smaller male cones release pollen, which fertilizes the female</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Start</a></li>
                <li class="breadcrumb-item active" aria-current="page">Contact</li>
            </ol>
        </div>
        <!-- end container -->
    </header>
    <!-- end page-header -->
    <section class="contact">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 wow fadeInUp">
                    <b>07</b>
                    <h4><span>Homepark</span> Living Spaces</h4>
                    <small>Smaller male cones </small>
                </div>
                <!-- end col-6 -->
                <div class="col-lg-3 col-md-6 wow fadeInUp">
                    <address>
                        <strong>Visit Us</strong>
                        <p>
                            Kristiatik 15th Street, Floot 17<br>
                            Kiev, Ukraine 78692
                        </p>
                    </address>
                </div>
                <!-- end col-3 -->
                <div class="col-lg-3 col-md-6 wow fadeInUp">
                    <address>
                        <strong>Say Hello</strong>
                        <p>
                            <a href="#">hello@homepark.com.ua</a>
                            +380(98)298-59-73
                        </p>
                    </address>
                </div>
                <!-- end col-3 -->
            </div>
            <!-- end row -->
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="map">
                        <div class="pattern-bg" data-stellar-ratio="1.03"></div>
                        <!-- end pattern-bg -->
                        <div class="holder" data-stellar-ratio="1.07">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3025.2378765886474!2d-73.97644805915624!3d40.69075842971381!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25bb6c6fe52c7%3A0x2b3bb16e97b13c01!2sFort+Greene+Tennis+Courts!5e0!3m2!1sen!2str!4v1559831164025!5m2!1sen!2str" allowfullscreen></iframe>
                        </div>
                        <!-- end holder -->
                    </div>
                    <!-- end map -->
                </div>
                <!-- end col-6 -->
                <div class="col-lg-6">
                    <div class="contact-form">
                        
                            <div class="form-group">
                                <input type="text" name="name" id="name" autocomplete="off" >
                                <span>Your name</span>
                            </div>
                            <!-- end form-group -->
                            <div class="form-group">
                                <input type="text" name="email" id="email" autocomplete="off" >
                                <span>Your e-mail</span>
                            </div>
                            <!-- end form-group -->
                            <div class="form-group">
                                <input type="text" name="subject" id="subject" autocomplete="off" >
                                <span>Subject</span>
                            </div>
                            <!-- end form-group -->
                            <div class="form-group">
                                <textarea name="message" id="message" autocomplete="off" ></textarea>
                                <span>Your message</span>
                            </div>
                            <!-- end form-group -->
                            <div class="form-group">
                                <button id="submit" type="submit" name="submit">
                                    Submit
                                </button>
                            </div>
                            <!-- end form-group -->
                        
                        <!-- end form -->
                        <div class="form-group">
                            <div id="success" class="alert alert-success wow fadeInUp" role="alert">Your message was sent successfully! We will be in touch as soon as we can. </div>
                            <!-- end success -->
                            <div id="error" class="alert alert-danger wow fadeInUp" role="alert">Something went wrong, try refreshing and submitting the form again. </div>
                            <!-- end error -->
                        </div>
                        <!-- end form-group -->
                    </div>
                    <!-- end contact-form -->
                </div>
                <!-- end col-6 -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </section>
    <!-- end contact -->
</asp:Content>
