<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgetpassword.aspx.cs" Inherits="OnlineFoodOrdering.Forgetpassword" %>

<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Online food ordering system">
    <meta name="author" content="Mahmud Sabuj">
    <title>Password Reset</title>

    <link rel="icon" type="image/png" href="img/favicon.png">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/fontawesome/css/all.min.css" rel="stylesheet">
    <link href="vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="vendor/select2/css/select2.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <style type="text/css">
        .osahan-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 17px;
            color: #79797a;
            min-width: 40px;
        }

        .form-control:focus {
            box-shadow: none;
        }

        .form-control {
            border-bottom: 1px solid #80bdff !important;
            padding: 0 10px !important;
        }
    </style>
</head>
<body class="bg-white">
    <div runat="server" id="showMsg" class="text-center d-none"></div>
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image" style="background-image: url('../img/fp.jpg');"></div>
            <div class="col-md-8 col-lg-6">
                <div class="login d-flex align-items-center py-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-9 col-lg-8 mx-auto pl-5 pr-5">
                                <h3 class="login-heading mb-2">Trouble Logging In?</h3>
                                <p class="mb-4 font-weight-normal">Enter your email and we'll send you a link to get back into your account.</p>
                                <form runat="server">
                                    <div class="d-flex align-items-center mb-2">
                                        <div class="mr-3 mb-2 bg-light rounded p-2 osahan-icon"><i class="fa fa-envelope"></i></div>
                                        <div class="w-100">
                                            <p class="mb-0 small font-weight-bold text-dark">Email Address</p>
                                            <input runat="server" type="email" id="inputEmail" class="form-control form-control-sm p-0 border-input border-0 rounded-0" placeholder="Enter Your Email">
                                            <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="Email address is required!" ForeColor="Red" ControlToValidate="inputEmail" ValidationGroup="ValidateLoginData"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnLogin" runat="server" CausesValidation="true" ValidationGroup="ValidateLoginData" OnClick="btnLogin_Click" Text="Recover Password" CssClass="btn btn-lg btn-outline-primary btn-block btn-login text-uppercase font-weight-bold mb-2" />
                                    <div class="text-center pt-3">
                                        <a class="font-weight-bold" href="Registration.aspx">Register</a> | <a class="font-weight-bold" href="Login.aspx">Login</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="vendor/jquery/jquery-3.3.1.slim.min.js" type="text/javascript"></script>

    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>

    <script src="vendor/select2/js/select2.min.js" type="text/javascript"></script>

    <script src="js/main.js" type="text/javascript"></script>
    <script defer="" src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon="{&quot;rayId&quot;:&quot;662ab38d3ef82ec8&quot;,&quot;version&quot;:&quot;2021.5.2&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;dd471ab1978346bbb991feaa79e6ce5c&quot;,&quot;si&quot;:10}"></script>

</body>
</html>

