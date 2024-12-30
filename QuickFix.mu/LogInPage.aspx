<%@ Page Title="" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="QuickFix.mu.LogInPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        ::selection {
            background-color: lightgray;
        }


        .form {
            width: auto;
            height: auto;
            background-image: linear-gradient(to bottom, #424242, #212121);
            display: flex;
            align-items: center;
            flex-direction: column;
            border-radius: 0.5rem;
        }

        .title {
            color: wheat;
            margin: 3rem 0;
            font-size: 2rem;
        }

        .input {
            margin: 0.5rem 0;
            padding: 1rem 0.5rem;
            width: 20rem;
            background-color: inherit;
            color: wheat;
            border: none;
            outline: none;
            border-bottom: 1px solid wheat;
            transition: all 400ms;
        }

            .input:hover {
                background-color: #424242;
                border: none;
                border-radius: 0.5rem;
            }

        .btn {
            height: 3rem;
            width: 20rem;
            margin-top: 3rem;
            background: #9f8054;
            color: #fff;
            border-radius: 0.5rem;
            border: none;
            font-size: 1.2rem;
            transition: all 400ms;
            cursor: pointer;
            box-shadow: 0 0 10px antiquewhite, 0 0 10px antiquewhite;
        }

            .btn:hover {
                background-color: antiquewhite;
                box-shadow: none;
            }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <header class="page-header" data-background="images/slide01.jpg" data-stellar-background-ratio="1.15">
        <div class="container">
            <h1>Log In</h1>
            <p>Log In as a client or supplier</p>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Start</a></li>
                <li class="breadcrumb-item active" aria-current="page">Log In</li>
            </ol>
        </div>
    </header>
    <div class="form">
    <p class="title">Welcome To QuickFix</p>
    <asp:TextBox placeholder="Username" ID="txtUsername" runat="server" CssClass="input" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" ForeColor="red" Display="Dynamic" CssClass="help-block"></asp:RequiredFieldValidator>
    <asp:Label ID="lblUsernameMsg" runat="server" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

    <asp:TextBox placeholder="Password" ID="txtPassword" runat="server" CssClass="input" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="red" Display="Dynamic" CssClass="help-block"></asp:RequiredFieldValidator>
    <asp:Label ID="lblPasswordMsg" runat="server" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label><br />

    <asp:Button class="btn" runat="server" ID="btnLogin2" OnClick="btnLogin2_Click" Text="Log In" OnClientClick="return validateFields();" />
    
    <div class="text-center mt-3">
        <asp:Label ID="lblMsg" runat="server" ForeColor="red" CssClass="help-block text-danger" Text=""></asp:Label><br />
        <p style="color:white">Don't have an account yet? <a href="RegistrationPage.aspx" class="text-primary">Sign Up</a></p>
    </div>
    <br />
</div>0079

<script type="text/javascript">
    function validateFields() {
        const username = document.getElementById("txtUsername").value.trim();
        const password = document.getElementById("txtPassword").value.trim();

        const lblUsernameMsg = document.getElementById('<%= lblUsernameMsg.ClientID %>');
        const lblPasswordMsg = document.getElementById('<%= lblPasswordMsg.ClientID %>');

        lblUsernameMsg.textContent = '';
        lblPasswordMsg.textContent = '';

        let isValid = true;

        if (!username) {
            lblUsernameMsg.textContent = "Username is required.";
            isValid = false;
        }

        if (!password) {
            lblPasswordMsg.textContent = "Password is required.";
            isValid = false;
        }

        return isValid;
    }
</script>
</asp:Content>
