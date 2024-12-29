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
            background-color: wheat;
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
    <div class="form" action="">
        <p class="title">Welcome User</p>
        <br />
        <input placeholder="Username" id="txtUsername" runat="server" class="input" type="password" />
        <input placeholder="Password" id="txtPassword" runat="server" class="input" type="password" />
        <asp:Button CssClass="btn" runat="server" type="submit" ID="btnLogin2" OnClick="btnLogin2_Click"></asp:Button>
        <div class="text-center mt-3">
            <asp:Label ID="lblMsg" runat="server" ForeColor="red" CssClass="help-block text-danger" Text=""></asp:Label><br />
            <p>Don't have an account yet? <a href="RegistrationPage.aspx" class="text-primary">Sign Up</a></p>
        </div>
        <br />
    </div>
</asp:Content>
