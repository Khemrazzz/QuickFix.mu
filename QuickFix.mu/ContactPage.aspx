<%@ Page Title="" Language="C#" MasterPageFile="~/QuickFixMasterPage.Master" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="QuickFix.mu.ContactPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .orange {
            color: #ff7a01;
        }

        .form-container {
            max-width: 700px;
            margin: 30px;
            background-color: #9f8054;
            padding: 30px;
            border-left: 5px solid #ff7a01;
            clip-path: polygon(0 0, 100% 0, 100% calc(100% - 20px), calc(100% - 20px) 100%, 0 100%);
        }

        .heading {
            display: block;
            color: white;
            font-size: 1.5rem;
            font-weight: 800;
            margin-bottom: 20px;
        }

        .form-container .form .input {
            color: #87a4b6;
            width: 100%;
            background-color: #ebcfa7;
            border: none;
            outline: none;
            padding: 10px;
            margin-bottom: 20px;
            font-weight: bold;
            transition: all 0.2s ease-in-out;
            border-left: 1px solid transparent;
        }

            .form-container .form .input:focus {
                border-left: 5px solid #ff7a01;
            }

        .form-container .form .textarea {
            width: 100%;
            padding: 10px;
            border: none;
            outline: none;
            background-color: #ebcfa7;
            color: #ff7a01;
            font-weight: bold;
            resize: none;
            max-height: 150px;
            margin-bottom: 20px;
            border-left: 1px solid transparent;
            transition: all 0.2s ease-in-out;
        }

            .form-container .form .textarea:focus {
                border-left: 5px solid #ff7a01;
            }

        .form-container .form .button-container {
            display: flex;
            gap: 10px;
        }

            .form-container .form .button-container .send-button {
                flex-basis: 70%;
                background: #ff7a01;
                padding: 10px;
                color: #001925;
                text-align: center;
                font-weight: bold;
                border: 1px solid transparent;
                transition: all 0.2s ease-in-out;
            }

                .form-container .form .button-container .send-button:hover {
                    background: transparent;
                    border: 1px solid #ff7a01;
                    color: #ff7a01;
                }

            .form-container .form .button-container .reset-button-container {
                filter: drop-shadow(1px 1px 0px #ff7a01);
                flex-basis: 30%;
            }

                .form-container .form .button-container .reset-button-container .reset-button {
                    position: relative;
                    text-align: center;
                    width: 300px;
                    padding: 10px;
                    color: #ff7a01;
                    font-weight: bold;
                    background: #001925;
                    clip-path: polygon(0 0, 100% 0, 100% calc(100% - 10px), calc(100% - 10px) 100%, 0 100%);
                    transition: all 0.2s ease-in-out;
                }

                    .form-container .form .button-container .reset-button-container .reset-button:hover {
                        background: #ff7a01;
                        color: #001925;
                    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <header class="page-header" data-background="images/r3.jpg" data-stellar-background-ratio="1.15">
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
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3281.3808681836247!2d57.48784821485409!3d-20.223015480448503!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x217c5b92785b71f5%3A0xca85d4186d504b5!2sBAGATELLE%20Exclusives%20-%20BLAXAND!5e0!3m2!1sen!2smu!4v1671123456789!5m2!1sen!2smu" allowfullscreen></iframe>
                        </div>
                        <!-- end holder -->
                    </div>
                    <!-- end map -->
                </div>
                <!-- end col-6 -->
                <div class="col-lg-6">
                    <div class="form-container">
                        <div class="form">
                            <span class="heading">Get in touch</span>

                            <!-- First Name -->
                             <asp:Label ID="lblFirstNameMsg" runat="server" ForeColor="red" CssClass="help-block text-danger" Display="Dynamic" Text=""></asp:Label>
                            <asp:TextBox ID="txtfname" CssClass="input" Placeholder="First Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvFirstName"
                                runat="server"
                                ControlToValidate="txtfname"
                                ErrorMessage="First Name is required."
                                ForeColor="red"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                           

                            <!-- Last Name -->
                            <asp:Label ID="lblLastNameMsg" runat="server" ForeColor="red" CssClass="help-block text-danger" Text=""></asp:Label>
                            <asp:TextBox ID="txtlname" CssClass="input" Placeholder="Last Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvLastName"
                                runat="server"
                                ControlToValidate="txtlname"
                                ErrorMessage="Last Name is required."
                                ForeColor="red"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            

                            <!-- Email -->
                            <asp:Label ID="lblEmailMsg" runat="server" ForeColor="red" CssClass="help-block text-danger" Text=""></asp:Label>
                            <asp:TextBox ID="txtemail" CssClass="input" Placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvEmail"
                                runat="server"
                                ControlToValidate="txtemail"
                                ErrorMessage="Email is required."
                                ForeColor="red"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="revEmail"
                                runat="server"
                                ControlToValidate="txtemail"
                                ErrorMessage="Enter a valid email."
                                ValidationExpression="^\S+@\S+\.\S+$"
                                ForeColor="red"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                            

                            <!-- Subject -->
                            <asp:Label ID="lblSubjectMsg" runat="server" ForeColor="red" CssClass="help-block text-danger" Text=""></asp:Label>
                            <asp:TextBox ID="txtsubject" CssClass="input" Placeholder="Subject" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvSubject"
                                runat="server"
                                ControlToValidate="txtsubject"
                                ErrorMessage="Subject is required."
                                ForeColor="red"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            

                            <!-- Message -->
                            <asp:Label ID="lblMessageMsg" runat="server" ForeColor="red" CssClass="help-block text-danger" Text=""></asp:Label>
                            <asp:TextBox ID="txtmessage" CssClass="textarea" TextMode="MultiLine" Rows="4" Placeholder="Say Hello" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvMessage"
                                runat="server"
                                ControlToValidate="txtmessage"
                                ErrorMessage="Message is required."
                                ForeColor="red"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            

                            <!-- Submit Button -->
                            <div class="button-container">
                                <div class="reset-button-container">
                                    <asp:Button class="reset-button" runat="server" ID="btnSend" OnClick="sendMessageButton_Click" Text="Send" OnClientClick="return validateFields();" />
                                </div>
                            </div>
                        </div>

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

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            const firstNameField = document.getElementById('<%= txtfname.ClientID %>');
            const lastNameField = document.getElementById('<%= txtlname.ClientID %>');
            const emailField = document.getElementById('<%= txtemail.ClientID %>');
            const subjectField = document.getElementById('<%= txtsubject.ClientID %>');
            const messageField = document.getElementById('<%= txtmessage.ClientID %>');

            const lblFirstNameMsg = document.getElementById('<%= lblFirstNameMsg.ClientID %>');
            const lblLastNameMsg = document.getElementById('<%= lblLastNameMsg.ClientID %>');
            const lblEmailMsg = document.getElementById('<%= lblEmailMsg.ClientID %>');
            const lblSubjectMsg = document.getElementById('<%= lblSubjectMsg.ClientID %>');
            const lblMessageMsg = document.getElementById('<%= lblMessageMsg.ClientID %>');

            window.validateFields = function () {
                let isValid = true;

                lblFirstNameMsg.textContent = "";
                lblLastNameMsg.textContent = "";
                lblEmailMsg.textContent = "";
                lblSubjectMsg.textContent = "";
                lblMessageMsg.textContent = "";

                function showError(label, message) {
                    label.textContent = message;
                    isValid = false;
                }

                if (!firstNameField.value.trim()) {
                    showError(lblFirstNameMsg, "First Name is required.");
                }
                if (!lastNameField.value.trim()) {
                    showError(lblLastNameMsg, "Last Name is required.");
                }
                if (!emailField.value.trim() || !/^\S+@\S+\.\S+$/.test(emailField.value)) {
                    showError(lblEmailMsg, "Enter a valid Email.");
                }
                if (!subjectField.value.trim()) {
                    showError(lblSubjectMsg, "Subject is required.");
                }
                if (!messageField.value.trim()) {
                    showError(lblMessageMsg, "Message is required.");
                }

                return isValid;
            };
        });

    </script>
</asp:Content>
