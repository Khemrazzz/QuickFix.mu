<%@ Page Title="" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="QuickFix.mu.Registration" %>
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
            <h1>Registration</h1>
            <p>Register as a Supplier or Client to get started</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
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
                            <h5>Registration Form</h5>
                            <p>Already have an account? <a href="LogInPage.aspx">Login here</a></p>
                        </div>

                        <asp:Label ID="lblMsg" runat="server" CssClass="message" />

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="ddlUserType">Registering as</asp:Label>
                            <asp:DropDownList runat="server" ID="ddlUserType" CssClass="common-input-new">
                                <asp:ListItem Text="Select User Type" Value="" />
                                <asp:ListItem Text="Supplier" Value="Supplier" />
                                <asp:ListItem Text="Client" Value="Client" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlUserType" InitialValue="" ErrorMessage="Please select a user type" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtFirstName">First Name</asp:Label>
                            <asp:TextBox runat="server" ID="txtFirstName" CssClass="common-input-new" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

<%--                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtMiddleName">Middle Name</asp:Label>
                            <asp:TextBox runat="server" ID="txtMiddleName" CssClass="common-input-new" />
                            
                        </div>--%>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtLastName">Last Name</asp:Label>
                            <asp:TextBox runat="server" ID="txtLastName" CssClass="common-input-new" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="ddlGender">Gender</asp:Label>
                            <asp:DropDownList runat="server" ID="ddlGender" CssClass="common-input-new">
                                <asp:ListItem Text="Select Gender" Value="" />
                                <asp:ListItem Text="Male" Value="Male" />
                                <asp:ListItem Text="Female" Value="Female" />
                                <asp:ListItem Text="Other" Value="Other" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlGender" InitialValue="" ErrorMessage="Please select a gender" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

<%--                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtGTag">GTag</asp:Label>
                            <asp:TextBox runat="server" ID="txtGTag" CssClass="common-input-new" MaxLength="10" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGTag" ErrorMessage="GTag is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>--%>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtDateOfBirth">Date of Birth</asp:Label>
                            <asp:TextBox runat="server" ID="txtDateOfBirth" CssClass="common-input-new" TextMode="Date" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="Date of Birth is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

<%--                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtProfilePicture">Profile Picture URL</asp:Label>
                            <asp:TextBox runat="server" ID="txtProfilePicture" CssClass="common-input-new" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtProfilePicture" ErrorMessage="Profile Picture URL is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>--%>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtBio">Bio</asp:Label>
                            <asp:TextBox runat="server" ID="txtBio" CssClass="common-input-new" MaxLength="256" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBio" ErrorMessage="Bio is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtEmail">Email</asp:Label>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="common-input-new" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic" CssClass="error-new" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtMobileNumber">Mobile Number</asp:Label>
                            <asp:TextBox runat="server" ID="txtMobileNumber" CssClass="common-input-new" TextMode="Number" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Mobile Number is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtCountry">Country</asp:Label>
                            <asp:TextBox runat="server" ID="txtCountry" CssClass="common-input-new" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCountry" ErrorMessage="Country is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtDistrict">District</asp:Label>
                            <asp:TextBox runat="server" ID="txtDistrict" CssClass="common-input-new" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDistrict" ErrorMessage="District is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtVillageTown">Village/Town</asp:Label>
                            <asp:TextBox runat="server" ID="txtVillageTown" CssClass="common-input-new" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtVillageTown" ErrorMessage="Village/Town is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtStrAddress">Street Address</asp:Label>
                            <asp:TextBox runat="server" ID="txtStrAddress" CssClass="common-input-new" TextMode="MultiLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStrAddress" ErrorMessage="Street Address is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtUsername">Username</asp:Label>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="common-input-new" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtPassword">Password</asp:Label>
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="common-input-new" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-form-new">
                            <asp:Label runat="server" CssClass="form-label-new" AssociatedControlID="txtConfirmPassword">Confirm Password</asp:Label>
                            <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="common-input-new" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirmation Password is required" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                            <asp:CompareValidator runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" ForeColor="Red" Display="Dynamic" CssClass="error-new" />
                        </div>

                        <div class="login-button-new">
                            <asp:Button runat="server" ID="btnRegister" CssClass="button" Text="Register"  OnClick="btnRegister_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


