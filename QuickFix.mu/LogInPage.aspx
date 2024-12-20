<%@ Page Title="" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="QuickFix.mu.LogInPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-header-new {
            background: url('images/slide01.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
            text-align: center;
            padding: 50px 0;
        }
        .page-header-new h1 {
            color: var(--whiteColor);
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        .page-header-new p {
            color: var(--lightGrey3);
            font-size: 1rem;
        }
        .breadcrumb-new {
            display: inline-block;
            padding: 0;
            margin: 0;
            background: transparent;
        }
        .breadcrumb-new .breadcrumb-item {
            display: inline;
            font-size: 0.9rem;
        }
        .breadcrumb-new .breadcrumb-item a {
            color: var(--yellow);
        }
        .breadcrumb-new .breadcrumb-item.active {
            color: var(--whiteColor);
        }

        .login-area-new {
            padding: 100px 0;
        }
        .login-area-wrapper-new {
            background: var(--bodyBg);
            padding: 30px;
            border-radius: var(--borderRadius3);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 2px solid var(--borderColor2);
            margin-top: 20px;
        }
        .login-heading-new h5 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        .login-heading-new p {
            font-size: 0.9rem;
            color: var(--contentColor);
        }
        .form-label-new {
            font-weight: bold;
            color: var(--headingColor);
        }
        .common-input-new {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid var(--borderColor);
            border-radius: var(--borderRadius);
            font-size: 1rem;
            color: var(--contentColor);
            background: var(--whiteColor);
        }
        .form-check-new {
            display: flex;
            align-items: center;
        }
        .form-check-label-new {
            margin-left: 5px;
            color: var(--contentColor2);
        }
        .login-button-new {
            color:antiquewhite;
            text-align: center;
        }
        .error-new {
            color: var(--secondaryColor);
            font-size: 0.8rem;
        }
        .forgot-password-link-new {
            text-align: right;
        }
        .forgot-password-link-new a {
            color: var(--blue);
            text-decoration: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <header class="page-header" data-background="images/slide01.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>Log In</h1>
            <p>Login as a cleint or supplier</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Start</a></li>
                <li class="breadcrumb-item active" aria-current="page">Registration</li>
            </ol>
        </div>
    </header>

    <div class="login-area-new">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-md-8 offset-md-2" data-aos="fade-up">
                    <div class="login-area-wrapper-new">
                        <div class="login-heading-new">
                            <h5>Login</h5>
                            <p>Don't have an account yet? <a href="RegistrationPage.aspx">Sign up for free</a></p>
                        </div>

                        <asp:Label ID="lblMsg" runat="server" CssClass="message" />

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtEmail">Email</asp:Label>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="common-input-new" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic" CssClass="error-new" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
                        </div>
                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtPassword">Password</asp:Label>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="common-input-new" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>
                        <div class="login-form-new d-flex justify-content-between flex-wrap gap-2">
                            <div class="form-check-new">
                                <asp:CheckBox ID="chkRememberMe" runat="server" />
                                <asp:Label runat="server" CssClass="form-check-label-new" AssociatedControlID="chkRememberMe">Remember Me</asp:Label>
                            </div>
                            <div class="forgot-password-link-new">
                                <a href="ForgotPassword.aspx">Forgot your password?</a>
                            </div>
                        </div>
                        <div class="login-button-new">
                            <asp:Button runat="server" ID="btnLogin" CssClass="button" Text="Login"  OnClick="btnLogin_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
