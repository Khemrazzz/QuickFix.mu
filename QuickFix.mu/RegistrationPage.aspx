<%@ Page Title="Registration" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="QuickFix.mu.RegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* YOUR CSS STYLES */
        ::selection {
            background-color:;
        }

        .form-container {
            max-width: 600px;
            margin: 2rem auto;
            padding: 1.5rem;
            border-radius: 0.5rem;
            background: #333;
        }

        .title {
            color: #f5deb3;
            margin-bottom: 1rem;
            font-size: 1.8rem;
            text-align: center;
        }

        .nav-tabs {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-bottom: 2rem;
        }

            .nav-tabs a {
                color: #fff;
                text-decoration: none;
                background-color: #9f8054;
                padding: 0.5rem 1rem;
                border-radius: 0.5rem;
            }

                .nav-tabs a.active {
                    background-color: #f5f5dc;
                    color: #000;
                }

        .tab-content {
            display: none;
        }

            .tab-content.active {
                display: block;
            }

        .input {
            display: block;
            width: 100%;
            box-sizing: border-box;
            margin: 0.5rem 0;
            padding: 0.75rem;
            color: #f5deb3;
            background-color: inherit;
            border: 1px solid #f5deb3;
            border-radius: 0.25rem;
            transition: background 0.3s;
        }

            .input:focus {
                outline: none;
                background: #424242;
            }

            .input[type="file"] {
                padding: 0;
                color: #fff;
                border: none;
            }

        textarea.input {
            resize: vertical;
            min-height: 5rem;
        }

        .btn {
            display: block;
            width: 100%;
            margin: 1rem 0;
            padding: 0.75rem;
            background: #9f8054;
            color: #fff;
            border-radius: 0.5rem;
            border: none;
            font-size: 1.2rem;
            cursor: pointer;
            transition: background 0.3s, box-shadow 0.3s;
            box-shadow: 0 0 6px #f5deb3, 0 0 6px #f5deb3;
        }

            .btn:hover {
                background-color: #f5f5dc;
                color: #000;
                box-shadow: none;
            }

        @media (max-width: 600px) {
            .form-container {
                margin: 1rem;
                padding: 1rem;
            }
        }

        legend {
    color: white;
}


        h3{
    color: white;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <!-- Page Header -->
    <header class="page-header" data-background="images/r4.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>Registration</h1>
            <p>Register as a client or supplier</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Home</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Registration
                </li>
            </ol>
        </div>
    </header>

    <!-- Main form container -->
    <div class="form-container">
        <p class="title">Welcome To QuickFix</p>

        <!-- Tabs -->
        <div class="nav-tabs">
            <a href="#" id="tabLink1" class="active" onclick="showTab(event, 'tabClient')">Client</a>
            <a href="#" id="tabLink2" onclick="showTab(event, 'tabSupplier')">Supplier</a>
        </div>

        <!-- ------------------ CLIENT TAB ------------------ -->
        <div id="tabClient" class="tab-content active">
            <fieldset>
                <legend>Personal Details</legend>
                <!-- First Name -->
                <asp:TextBox
                    ID="txtClientFName"
                    runat="server"
                    CssClass="input"
                    Placeholder="First Name"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientFName"
                    runat="server"
                    ControlToValidate="txtClientFName"
                    ErrorMessage="First name is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lblFname" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Middle Name -->
                <asp:TextBox
                    ID="txtClientMName"
                    runat="server"
                    CssClass="input"
                    Placeholder="Middle Name"
                    ValidationGroup="ClientReg" />
                <br />

                <!-- Last Name -->
                <asp:TextBox
                    ID="txtClientLName"
                    runat="server"
                    CssClass="input"
                    Placeholder="Last Name"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientLName"
                    runat="server"
                    ControlToValidate="txtClientLName"
                    ErrorMessage="Last name is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lblLname" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Gender -->
                <asp:DropDownList
                    ID="ddlClientGender"
                    runat="server"
                    CssClass="input"
                    ValidationGroup="ClientReg">
                    <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                    <asp:ListItem Text="Prefer not to say" Value="Prefer not to say"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="rfvClientGender"
                    runat="server"
                    ControlToValidate="ddlClientGender"
                    InitialValue=""
                    ErrorMessage="Gender is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lblgender" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- GTag (title) -->
                <asp:DropDownList
                    ID="ddlClientGTag"
                    runat="server"
                    CssClass="input"
                    ValidationGroup="ClientReg">
                    <asp:ListItem Text="Select Title" Value=""></asp:ListItem>
                    <asp:ListItem Text="Mr" Value="Mr"></asp:ListItem>
                    <asp:ListItem Text="Mrs" Value="Mrs"></asp:ListItem>
                    <asp:ListItem Text="Miss" Value="Miss"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="rfvClientGTag"
                    runat="server"
                    ControlToValidate="ddlClientGTag"
                    InitialValue=""
                    ErrorMessage="Select a title (Mr, Mrs, Miss...)"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lbltitle" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Date of Birth -->
                <asp:TextBox
                    ID="txtClientDOB"
                    runat="server"
                    CssClass="input"
                    TextMode="Date"
                    Placeholder="Date of Birth"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientDOB"
                    runat="server"
                    ControlToValidate="txtClientDOB"
                    ErrorMessage="Date of Birth is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:RangeValidator
                    ID="rvClientDOB"
                    runat="server"
                    ControlToValidate="txtClientDOB"
                    Type="Date"
                    ErrorMessage="DOB must be valid and within allowed range"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lbldob" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Profile Picture -->
                <p>
                    <h3>Upload Profile Picture</h3>
                </p>
                <asp:FileUpload
                    ID="fuClientProfilePic"
                    runat="server"
                    CssClass="input"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientProfilePic"
                    runat="server"
                    ControlToValidate="fuClientProfilePic"
                    ErrorMessage="Profile Picture is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lblpp" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Bio -->
                <asp:TextBox
                    ID="txtClientBio"
                    runat="server"
                    CssClass="input"
                    TextMode="MultiLine"
                    Placeholder="Tell us about you"
                    ValidationGroup="ClientReg" />
                <br />

            </fieldset>
            <fieldset>
                <legend>Contact Details</legend>
                <!-- Email -->
                <asp:TextBox
                    ID="txtClientEmail"
                    runat="server"
                    CssClass="input"
                    TextMode="Email"
                    Placeholder="Email"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientEmail"
                    runat="server"
                    ControlToValidate="txtClientEmail"
                    ErrorMessage="Email is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lblemail" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Mobile -->
                <asp:TextBox
                    ID="txtClientMobile"
                    runat="server"
                    CssClass="input"
                    Placeholder="Mobile Number"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientMobile"
                    runat="server"
                    ControlToValidate="txtClientMobile"
                    ErrorMessage="Mobile number is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:RegularExpressionValidator
                    ID="revClientMobile"
                    runat="server"
                    ControlToValidate="txtClientMobile"
                    ValidationExpression="^\d{8}$"
                    ErrorMessage="Mobile number must be 8 digits"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lblmob" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- District + Village/Town -->
                <asp:UpdatePanel ID="updPanelClientDistrict" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DropDownList
                            ID="ddlClientDistrict"
                            runat="server"
                            CssClass="input"
                            AutoPostBack="True"
                            OnSelectedIndexChanged="ddlClientDistrict_SelectedIndexChanged"
                            ValidationGroup="ClientReg">
                            <asp:ListItem Text="Select District" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvClientDistrict"
                            runat="server"
                            ControlToValidate="ddlClientDistrict"
                            InitialValue="-1"
                            ErrorMessage="District is required"
                            Display="Dynamic"
                            ForeColor="Red"
                            ValidationGroup="ClientReg" />
                        <asp:Label ID="lbldistrict" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                        <asp:DropDownList
                            ID="ddlClientVillageTown"
                            runat="server"
                            CssClass="input"
                            ValidationGroup="ClientReg">
                            <asp:ListItem Text="Select Village/Town" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvClientVillageTown"
                            runat="server"
                            ControlToValidate="ddlClientVillageTown"
                            InitialValue="-1"
                            ErrorMessage="Village/Town is required"
                            Display="Dynamic"
                            ForeColor="Red"
                            ValidationGroup="ClientReg" />
                        <asp:Label ID="lblvt" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger
                            ControlID="ddlClientDistrict"
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>

                <!-- Street Address -->
                <asp:TextBox
                    ID="txtClientStreetAddress"
                    runat="server"
                    CssClass="input"
                    Placeholder="Street Address"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientStreetAddress"
                    runat="server"
                    ControlToValidate="txtClientStreetAddress"
                    ErrorMessage="Street Address is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lbladdress" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

            </fieldset>
            <fieldset>

                <legend>Login Details</legend>
                <!-- Username -->
                <asp:TextBox
                    ID="txtClientUsername"
                    runat="server"
                    CssClass="input"
                    Placeholder="Username"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientUsername"
                    runat="server"
                    ControlToValidate="txtClientUsername"
                    ErrorMessage="Username is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />


                <!-- **CustomValidator to check if username is taken** -->
                <asp:CustomValidator
                    ID="cvClientUsernameTaken"
                    runat="server"
                    ControlToValidate="txtClientUsername"
                    OnServerValidate="cvClientUsernameTaken_ServerValidate"
                    ErrorMessage="Username is already taken"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lbluname" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Password -->
                <asp:TextBox
                    ID="txtClientPass"
                    runat="server"
                    CssClass="input"
                    TextMode="Password"
                    Placeholder="Password"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientPass"
                    runat="server"
                    ControlToValidate="txtClientPass"
                    ErrorMessage="Password is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:CustomValidator
                    ID="cvClientPassLen"
                    runat="server"
                    ControlToValidate="txtClientPass"
                    ClientValidationFunction="validatePassLength"
                    OnServerValidate="cvClientPassLen_ServerValidate"
                    ErrorMessage="Password must be between 8 and 12 characters"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lblpass" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Confirm Password -->
                <asp:TextBox
                    ID="txtClientCPass"
                    runat="server"
                    CssClass="input"
                    TextMode="Password"
                    Placeholder="Confirm Password"
                    ValidationGroup="ClientReg" />
                <asp:RequiredFieldValidator
                    ID="rfvClientCPass"
                    runat="server"
                    ControlToValidate="txtClientCPass"
                    ErrorMessage="Confirm Password is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:CompareValidator
                    ID="cvClientPasswords"
                    runat="server"
                    ControlToValidate="txtClientCPass"
                    ControlToCompare="txtClientPass"
                    ErrorMessage="Passwords do not match"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="ClientReg" />
                <asp:Label ID="lblcpass" runat="server" ValidationGroup="ClientReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

            </fieldset>

            <!-- Register Button -->
            <asp:Button
                ID="btnClientRegister"
                runat="server"
                CssClass="btn"
                Text="Sign Up (Client)"
                OnClick="btnClientRegister_Click"
                OnClientClick="return validateClientFields();"
                ValidationGroup="ClientReg" />
        </div>
        <!-- END CLIENT TAB -->


        <!-- ------------------ SUPPLIER TAB ------------------ -->
        <div id="tabSupplier" class="tab-content">

            <fieldset>
                <legend>Personal Details</legend>
                <!-- First Name -->
                <asp:TextBox
                    ID="txtSupplierFName"
                    runat="server"
                    CssClass="input"
                    Placeholder="First Name"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierFName"
                    runat="server"
                    ControlToValidate="txtSupplierFName"
                    ErrorMessage="First name is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lblFname2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Middle Name -->
                <asp:TextBox
                    ID="txtSupplierMName"
                    runat="server"
                    CssClass="input"
                    Placeholder="Middle Name"
                    ValidationGroup="SupplierReg" />
                <br />

                <!-- Last Name -->
                <asp:TextBox
                    ID="txtSupplierLName"
                    runat="server"
                    CssClass="input"
                    Placeholder="Last Name"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierLName"
                    runat="server"
                    ControlToValidate="txtSupplierLName"
                    ErrorMessage="Last name is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lblLname2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />


                <!-- Gender -->
                <asp:DropDownList
                    ID="ddlSupplierGender"
                    runat="server"
                    CssClass="input"
                    ValidationGroup="SupplierReg">
                    <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="rfvSupplierGender"
                    runat="server"
                    ControlToValidate="ddlSupplierGender"
                    InitialValue=""
                    ErrorMessage="Gender is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lblgender2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- GTag (title) -->
                <asp:DropDownList
                    ID="ddlSupplierGTag"
                    runat="server"
                    CssClass="input"
                    ValidationGroup="SupplierReg">
                    <asp:ListItem Text="Select Title" Value=""></asp:ListItem>
                    <asp:ListItem Text="Mr" Value="Mr"></asp:ListItem>
                    <asp:ListItem Text="Mrs" Value="Mrs"></asp:ListItem>
                    <asp:ListItem Text="Miss" Value="Miss"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="rfvSupplierGTag"
                    runat="server"
                    ControlToValidate="ddlSupplierGTag"
                    InitialValue=""
                    ErrorMessage="Select a title (Mr, Mrs, Miss...)"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lbltitle2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Date of Birth -->
                <asp:TextBox
                    ID="txtSupplierDOB"
                    runat="server"
                    CssClass="input"
                    TextMode="Date"
                    Placeholder="Date of Birth"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierDOB"
                    runat="server"
                    ControlToValidate="txtSupplierDOB"
                    ErrorMessage="Date of Birth is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:RangeValidator
                    ID="rvSupplierDOB"
                    runat="server"
                    ControlToValidate="txtSupplierDOB"
                    Type="Date"
                    ErrorMessage="DOB must be valid and within allowed range"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lbldob2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Profile Picture -->
                <p>
                    <h3>Upload Profile Picture</h3>
                </p>
                <asp:FileUpload
                    ID="fuSupplierProfilePic"
                    runat="server"
                    CssClass="input"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierProfilePic"
                    runat="server"
                    ControlToValidate="fuSupplierProfilePic"
                    ErrorMessage="Profile Picture is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lblpp2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <asp:DropDownList
                    ID="ddlSupplierServices"
                    runat="server"
                    CssClass="input"
                    ValidationGroup="SupplierReg">
                    <asp:ListItem Text="Select Services" Value=""></asp:ListItem>
                    <asp:ListItem Text="Construction" Value="Construction"></asp:ListItem>
                    <asp:ListItem Text="Maintenance" Value="Maintenance"></asp:ListItem>
                    <asp:ListItem Text="Household" Value="Household"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="rfvddlservice"
                    runat="server"
                    ControlToValidate="ddlSupplierServices"
                    InitialValue=""
                    ErrorMessage="Select a service to provide"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lblservice" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Bio -->
                <asp:TextBox
                    ID="txtSupplierBio"
                    runat="server"
                    CssClass="input"
                    TextMode="MultiLine"
                    Placeholder="Tell us about you"
                    ValidationGroup="SupplierReg" />
                <br />

            </fieldset>
            <fieldset>

                <legend>Contact Details</legend>
                <!-- Email -->
                <asp:TextBox
                    ID="txtSupplierEmail"
                    runat="server"
                    CssClass="input"
                    TextMode="Email"
                    Placeholder="Email"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierEmail"
                    runat="server"
                    ControlToValidate="txtSupplierEmail"
                    ErrorMessage="Email is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lblemail2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />


                <!-- Mobile -->
                <asp:TextBox
                    ID="txtSupplierMobile"
                    runat="server"
                    CssClass="input"
                    Placeholder="Mobile Number"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierMobile"
                    runat="server"
                    ControlToValidate="txtSupplierMobile"
                    ErrorMessage="Mobile number is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:RegularExpressionValidator
                    ID="revSupplierMobile"
                    runat="server"
                    ControlToValidate="txtSupplierMobile"
                    ValidationExpression="^\d{8}$"
                    ErrorMessage="Mobile number must be 8 digits"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lblmob2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- District + Village/Town -->
                <asp:UpdatePanel ID="updPanelSupplierDistrict" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList
                            ID="ddlSupplierDistrict"
                            runat="server"
                            CssClass="input"
                            AutoPostBack="True"
                            OnSelectedIndexChanged="ddlSupplierDistrict_SelectedIndexChanged"
                            ValidationGroup="SupplierReg">
                            <asp:ListItem Text="Select District" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvSupplierDistrict"
                            runat="server"
                            ControlToValidate="ddlSupplierDistrict"
                            InitialValue="-1"
                            ErrorMessage="District is required"
                            Display="Dynamic"
                            ForeColor="Red"
                            ValidationGroup="SupplierReg" />
                        <asp:Label ID="lbldistrict2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                        <asp:DropDownList
                            ID="ddlSupplierVillageTown"
                            runat="server"
                            CssClass="input"
                            ValidationGroup="SupplierReg">
                            <asp:ListItem Text="Select Village/Town" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="rfvSupplierVillageTown"
                            runat="server"
                            ControlToValidate="ddlSupplierVillageTown"
                            InitialValue="-1"
                            ErrorMessage="Village/Town is required"
                            Display="Dynamic"
                            ForeColor="Red"
                            ValidationGroup="SupplierReg" />
                        <asp:Label ID="lblvt2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger
                            ControlID="ddlSupplierDistrict"
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>

                <!-- Street Address -->
                <asp:TextBox
                    ID="txtSupplierStreetAddress"
                    runat="server"
                    CssClass="input"
                    Placeholder="Street Address"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierStreetAddress"
                    runat="server"
                    ControlToValidate="txtSupplierStreetAddress"
                    ErrorMessage="Street Address is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lbladdress2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

            </fieldset>
            <fieldset>

                <legend>Login Details</legend>
                <!-- Username -->
                <asp:TextBox
                    ID="txtSupplierUsername"
                    runat="server"
                    CssClass="input"
                    Placeholder="Username"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierUsername"
                    runat="server"
                    ControlToValidate="txtSupplierUsername"
                    ErrorMessage="Username is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />

                <!-- **CustomValidator to check if username is taken** -->
                <asp:CustomValidator
                    ID="cvSupplierUsernameTaken"
                    runat="server"
                    ControlToValidate="txtSupplierUsername"
                    OnServerValidate="cvSupplierUsernameTaken_ServerValidate"
                    ErrorMessage="Username is already taken"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lbluname2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Password -->
                <asp:TextBox
                    ID="txtSupplierPass"
                    runat="server"
                    CssClass="input"
                    TextMode="Password"
                    Placeholder="Password"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierPass"
                    runat="server"
                    ControlToValidate="txtSupplierPass"
                    ErrorMessage="Password is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:CustomValidator
                    ID="cvSupplierPassLen"
                    runat="server"
                    ControlToValidate="txtSupplierPass"
                    ClientValidationFunction="validatePassLength"
                    OnServerValidate="cvSupplierPassLen_ServerValidate"
                    ErrorMessage="Password must be between 8 and 12 characters"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lblpass2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

                <!-- Confirm Password -->
                <asp:TextBox
                    ID="txtSupplierCPass"
                    runat="server"
                    CssClass="input"
                    TextMode="Password"
                    Placeholder="Confirm Password"
                    ValidationGroup="SupplierReg" />
                <asp:RequiredFieldValidator
                    ID="rfvSupplierCPass"
                    runat="server"
                    ControlToValidate="txtSupplierCPass"
                    ErrorMessage="Confirm Password is required"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:CompareValidator
                    ID="cvSupplierPasswords"
                    runat="server"
                    ControlToValidate="txtSupplierCPass"
                    ControlToCompare="txtSupplierPass"
                    ErrorMessage="Passwords do not match"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="SupplierReg" />
                <asp:Label ID="lblcpass2" runat="server" ValidationGroup="SupplierReg" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />
            </fieldset>

            <!-- Register Button -->
            <asp:Button
                ID="btnSupplierRegister"
                runat="server"
                CssClass="btn"
                Text="Sign Up (Supplier)"
                OnClick="btnSupplierRegister_Click"
                OnClientClick="return validateSupplierFields();"
                ValidationGroup="SupplierReg" />
        </div>
        <!-- END SUPPLIER TAB -->


        <!-- Shared success/error message label -->
        <div class="text-center" style="margin-top: 1rem;">
            <asp:Label ID="lblMsg" runat="server" ForeColor="LightGreen"></asp:Label>
            <br />
            <p style="color: white">
                Already have an account?
                <a href="LogInPage.aspx" class="text-primary">Log In</a>
            </p>
        </div>
    </div>
    <!-- End form container -->

    <!-- Tab switching script -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            // Client Labels
            const lblClientFName = document.getElementById('<%= lblFname.ClientID %>');
            const lblClientLName = document.getElementById('<%= lblLname.ClientID %>');
            const lblClientGender = document.getElementById('<%= lblgender.ClientID %>');
            const lblClientGTag = document.getElementById('<%= lbltitle.ClientID %>');
            const lblClientDOB = document.getElementById('<%= lbldob.ClientID %>');
            const lblClientProfilePic = document.getElementById('<%= lblpp.ClientID %>');
            const lblClientEmail = document.getElementById('<%= lblemail.ClientID %>');
            const lblClientMobile = document.getElementById('<%= lblmob.ClientID %>');
            const lblClientDistrict = document.getElementById('<%= lbldistrict.ClientID %>');
            const lblClientVillageTown = document.getElementById('<%= lblvt.ClientID %>');
            const lblClientStreetAddress = document.getElementById('<%= lbladdress.ClientID %>');
            const lblClientUsername = document.getElementById('<%= lbluname.ClientID %>');
            const lblClientPass = document.getElementById('<%= lblpass.ClientID %>');
            const lblClientCPass = document.getElementById('<%= lblcpass.ClientID %>');

            // Supplier Labels
            const lblSupplierFName = document.getElementById('<%= lblFname2.ClientID %>');
            const lblSupplierLName = document.getElementById('<%= lblLname2.ClientID %>');
            const lblSupplierGender = document.getElementById('<%= lblgender2.ClientID %>');
            const lblSupplierGTag = document.getElementById('<%= lbltitle2.ClientID %>');
            const lblSupplierDOB = document.getElementById('<%= lbldob2.ClientID %>');
            const lblSupplierProfilePic = document.getElementById('<%= lblpp2.ClientID %>');
            const lblSupplierService = document.getElementById('<%= lblservice.ClientID %>');
            const lblSupplierEmail = document.getElementById('<%= lblemail2.ClientID %>');
            const lblSupplierMobile = document.getElementById('<%= lblmob2.ClientID %>');
            const lblSupplierDistrict = document.getElementById('<%= lbldistrict2.ClientID %>');
            const lblSupplierVillageTown = document.getElementById('<%= lblvt2.ClientID %>');
            const lblSupplierStreetAddress = document.getElementById('<%= lbladdress2.ClientID %>');
            const lblSupplierUsername = document.getElementById('<%= lbluname2.ClientID %>');
            const lblSupplierPass = document.getElementById('<%= lblpass2.ClientID %>');
            const lblSupplierCPass = document.getElementById('<%= lblcpass2.ClientID %>');

            // **Client Validation**
            window.validateClientFields = function () {
                let isValid = true;

                // Reset messages
                lblClientFName.textContent = "";
                lblClientLName.textContent = "";
                lblClientGender.textContent = "";
                lblClientGTag.textContent = "";
                lblClientDOB.textContent = "";
                lblClientProfilePic.textContent = "";
                lblClientEmail.textContent = "";
                lblClientMobile.textContent = "";
                lblClientDistrict.textContent = "";
                lblClientVillageTown.textContent = "";
                lblClientStreetAddress.textContent = "";
                lblClientUsername.textContent = "";
                lblClientPass.textContent = "";
                lblClientCPass.textContent = "";

                // Get input values
                const clientFirstName = document.getElementById('<%= txtClientFName.ClientID %>').value.trim();
        const clientLastName = document.getElementById('<%= txtClientLName.ClientID %>').value.trim();
        const clientGender = document.getElementById('<%= ddlClientGender.ClientID %>').value.trim();
        const clientGTag = document.getElementById('<%= ddlClientGTag.ClientID %>').value.trim();
        const clientDOB = document.getElementById('<%= txtClientDOB.ClientID %>').value.trim();
        const clientProfilePic = document.getElementById('<%= fuClientProfilePic.ClientID %>').value.trim();
        const clientEmail = document.getElementById('<%= txtClientEmail.ClientID %>').value.trim();
        const clientMobile = document.getElementById('<%= txtClientMobile.ClientID %>').value.trim();
        const clientDistrict = document.getElementById('<%= ddlClientDistrict.ClientID %>').value.trim();
        const clientVillageTown = document.getElementById('<%= ddlClientVillageTown.ClientID %>').value.trim();
        const clientStreetAddress = document.getElementById('<%= txtClientStreetAddress.ClientID %>').value.trim();
        const clientUsername = document.getElementById('<%= txtClientUsername.ClientID %>').value.trim();
        const clientPass = document.getElementById('<%= txtClientPass.ClientID %>').value.trim();
        const clientCPass = document.getElementById('<%= txtClientCPass.ClientID %>').value.trim();

                if (!clientFirstName) {
                    lblClientFName.textContent = "First Name is required.";
                    isValid = false;
                }

                if (!clientLastName) {
                    lblClientLName.textContent = "Last Name is required.";
                    isValid = false;
                }

                if (!clientGender) {
                    lblClientGender.textContent = "Gender is required.";
                    isValid = false;
                }

                if (!clientGTag) {
                    lblClientGTag.textContent = "Title is required.";
                    isValid = false;
                }

                if (!clientDOB) {
                    lblClientDOB.textContent = "Date of Birth is required.";
                    isValid = false;
                }

                if (!clientProfilePic) {
                    lblClientProfilePic.textContent = "Profile Picture is required.";
                    isValid = false;
                }

                if (!clientEmail) {
                    lblClientEmail.textContent = "Email is required.";
                    isValid = false;
                }

                if (!clientMobile) {
                    lblClientMobile.textContent = "Mobile number is required.";
                    isValid = false;
                }

                if (clientDistrict == -1) {
                    lblClientDistrict.textContent = "District is required.";
                    isValid = false;
                }

                if (clientVillageTown == -1) {
                    lblClientVillageTown.textContent = "Village/Town is required.";
                    isValid = false;
                }

                if (clientStreetAddress == -1) {
                    lblClientStreetAddress.textContent = "Street Address is required.";
                    isValid = false;
                }

                if (!clientUsername) {
                    lblClientUsername.textContent = "Username is required.";
                    isValid = false;
                }

                if (!clientPass) {
                    lblClientPass.textContent = "Password is required.";
                    isValid = false;
                }

                if (!clientCPass) {
                    lblClientCPass.textContent = "Confirm Password is required.";
                    isValid = false;
                }

                return isValid;
            };

            // **Supplier Validation**
            window.validateSupplierFields = function () {
                let isValid = true;

                // Reset messages
                lblSupplierFName.textContent = "";
                lblSupplierLName.textContent = "";
                lblSupplierGender.textContent = "";
                lblSupplierGTag.textContent = "";
                lblSupplierDOB.textContent = "";
                lblSupplierProfilePic.textContent = "";
                lblSupplierService.textContent = "";
                lblSupplierEmail.textContent = "";
                lblSupplierMobile.textContent = "";
                lblSupplierDistrict.textContent = "";
                lblSupplierVillageTown.textContent = "";
                lblSupplierStreetAddress.textContent = "";
                lblSupplierUsername.textContent = "";
                lblSupplierPass.textContent = "";
                lblSupplierCPass.textContent = "";
                lblSupplierService.textContent = "";


                // Get input values
                const supplierFirstName = document.getElementById('<%= txtSupplierFName.ClientID %>').value.trim();
        const supplierLastName = document.getElementById('<%= txtSupplierLName.ClientID %>').value.trim();
        const supplierGender = document.getElementById('<%= ddlSupplierGender.ClientID %>').value.trim();
        const supplierGTag = document.getElementById('<%= ddlSupplierGTag.ClientID %>').value.trim();
        const supplierDOB = document.getElementById('<%= txtSupplierDOB.ClientID %>').value.trim();
        const supplierProfilePic = document.getElementById('<%= fuSupplierProfilePic.ClientID %>').value.trim();
        const supplierService = document.getElementById('<%= ddlSupplierServices.ClientID %>').value.trim();
        const supplierEmail = document.getElementById('<%= txtSupplierEmail.ClientID %>').value.trim();
        const supplierMobile = document.getElementById('<%= txtSupplierMobile.ClientID %>').value.trim();
        const supplierDistrict = document.getElementById('<%= ddlSupplierDistrict.ClientID %>').value.trim();
        const supplierVillageTown = document.getElementById('<%= ddlSupplierVillageTown.ClientID %>').value.trim();
        const supplierStreetAddress = document.getElementById('<%= txtSupplierStreetAddress.ClientID %>').value.trim();
        const supplierUsername = document.getElementById('<%= txtSupplierUsername.ClientID %>').value.trim();
        const supplierPass = document.getElementById('<%= txtSupplierPass.ClientID %>').value.trim();
        const supplierCPass = document.getElementById('<%= txtSupplierCPass.ClientID %>').value.trim();

                if (!supplierFirstName) {
                    lblSupplierFName.textContent = "First Name is required.";
                    isValid = false;
                }

                if (!supplierLastName) {
                    lblSupplierLName.textContent = "Last Name is required.";
                    isValid = false;
                }

                if (!supplierGender) {
                    lblSupplierGender.textContent = "Gender is required.";
                    isValid = false;
                }

                if (!supplierGTag) {
                    lblSupplierGTag.textContent = "Title is required.";
                    isValid = false;
                }

                if (!supplierDOB) {
                    lblSupplierDOB.textContent = "Date of Birth is required.";
                    isValid = false;
                }

                if (!supplierProfilePic) {
                    lblSupplierProfilePic.textContent = "Profile Picture is required.";
                    isValid = false;
                }

                if (!supplierService) {
                    lblSupplierService.textContent = "Service selection is required.";
                    isValid = false;
                }

                if (!supplierEmail) {
                    lblSupplierEmail.textContent = "Email is required.";
                    isValid = false;
                }

                if (!supplierMobile) {
                    lblSupplierMobile.textContent = "Mobile number is required.";
                    isValid = false;
                }

                if (supplierDistrict == -1) {
                    lblSupplierDistrict.textContent = "District is required.";
                    isValid = false;
                }

                if (supplierVillageTown == -1) {
                    lblSupplierVillageTown.textContent = "Village/Town is required.";
                    isValid = false;
                }

                if (!supplierStreetAddress) {
                    lblSupplierStreetAddress.textContent = "Street Address is required.";
                    isValid = false;
                }

                if (!supplierUsername) {
                    lblSupplierUsername.textContent = "Username is required.";
                    isValid = false;
                }

                if (!supplierPass) {
                    lblSupplierPass.textContent = "Password is required.";
                    isValid = false;
                }

                if (!supplierCPass) {
                    lblSupplierCPass.textContent = "Confirm Password is required.";
                    isValid = false;
                }

                return isValid;
            };
        });
        function showTab(event, tabId) {
            event.preventDefault();

            // Remove 'active' from all tabs
            document.querySelectorAll('.tab-content').forEach(tab => tab.classList.remove('active'));
            document.querySelectorAll('.nav-tabs a').forEach(link => link.classList.remove('active'));

            // Show the selected tab
            document.getElementById(tabId).classList.add('active');
            event.currentTarget.classList.add('active');
        }

        function validatePassLength(sender, args) {
            if (args.Value.length < 8 || args.Value.length > 12) {
                args.IsValid = false;
            } else {
                args.IsValid = true;
            }
        }
    </script>
</asp:Content>
