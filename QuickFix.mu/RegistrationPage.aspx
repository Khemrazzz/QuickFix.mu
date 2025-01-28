<%@ Page Title="Registration" Language="C#" 
    MasterPageFile="~/QuickFixMasterPage.Master" 
    AutoEventWireup="true"
    CodeBehind="RegistrationPage.aspx.cs" 
    Inherits="QuickFix.mu.RegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* YOUR CSS STYLES */
        ::selection {
            background-color: ;
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <!-- Page Header -->
    <header class="page-header" data-background="images/slide01.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>Registration</h1>
            <p>Register as a client or supplier</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Home</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                    Registration
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

            <!-- Middle Name -->
            <asp:TextBox 
                ID="txtClientMName" 
                runat="server" 
                CssClass="input" 
                Placeholder="Middle Name"
                ValidationGroup="ClientReg" />

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

            <!-- Profile Picture -->
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

            <!-- Bio -->
            <asp:TextBox 
                ID="txtClientBio" 
                runat="server" 
                CssClass="input" 
                TextMode="MultiLine"
                Placeholder="Tell us about you"
                ValidationGroup="ClientReg" />

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

            <!-- District + Village/Town -->
            <asp:UpdatePanel ID="updPanelClientDistrict" runat="server">
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

            <!-- Register Button -->
            <asp:Button 
                ID="btnClientRegister" 
                runat="server" 
                CssClass="btn"
                Text="Sign Up (Client)" 
                OnClick="btnClientRegister_Click"
                ValidationGroup="ClientReg" />
        </div>
        <!-- END CLIENT TAB -->


        <!-- ------------------ SUPPLIER TAB ------------------ -->
        <div id="tabSupplier" class="tab-content">

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

            <!-- Middle Name -->
            <asp:TextBox 
                ID="txtSupplierMName" 
                runat="server" 
                CssClass="input" 
                Placeholder="Middle Name"
                ValidationGroup="SupplierReg" />

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

            <!-- Profile Picture -->
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

            <!-- Bio -->
            <asp:TextBox 
                ID="txtSupplierBio" 
                runat="server" 
                CssClass="input" 
                TextMode="MultiLine"
                Placeholder="Tell us about you"
                ValidationGroup="SupplierReg" />

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

            <!-- Register Button -->
            <asp:Button 
                ID="btnSupplierRegister" 
                runat="server" 
                CssClass="btn"
                Text="Sign Up (Supplier)" 
                OnClick="btnSupplierRegister_Click"
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
        function showTab(event, tabId) {
            event.preventDefault();

            // Remove 'active' from tab links
            document.getElementById("tabLink1").classList.remove("active");
            document.getElementById("tabLink2").classList.remove("active");

            // Hide all tab contents
            document.getElementById("tabClient").classList.remove("active");
            document.getElementById("tabSupplier").classList.remove("active");

            // Show the clicked tab
            document.getElementById(tabId).classList.add("active");
            event.currentTarget.classList.add("active");
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
