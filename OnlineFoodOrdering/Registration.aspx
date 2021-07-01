<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OnlineFoodOrdering.Registration" %>

<!doctype html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Online food ordering system">
    <meta name="author" content="Mahmud Sabuj">
    <title>Registration</title>

    <link rel="icon" type="image/png" href="img/favicon.png">

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vendor/fontawesome/css/all.min.css" rel="stylesheet">

    <link href="vendor/icofont/icofont.min.css" rel="stylesheet">

    <link href="vendor/select2/css/select2.min.css" rel="stylesheet">

    <link href="css/main.css" rel="stylesheet">
</head>
<body class="bg-white">
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image" style="background-image: url('../img/register.png');"></div>
            <div class="col-md-8 col-lg-6">
                <div class="login d-flex align-items-center py-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-9 col-lg-8 mx-auto pl-5 pr-5">
                                <h3 class="login-heading mb-0">New Buddy!</h3>
                                <p class="mt-0 mb-4">Please filup the form to complete your registration.</p>
                                <form runat="server">
                                    <div class="form-label-group">
                                        <asp:TextBox runat="server" ID="inputfName" CssClass="form-control" placeholder="Your First Name"></asp:TextBox>
                                        <label for="inputfName">First Name</label>
                                    </div>
                                     <div class="form-label-group">
                                        <asp:TextBox runat="server" ID="inputlName" CssClass="form-control" placeholder="Your Last Name"></asp:TextBox>
                                        <label for="inputlName">Last Name</label>
                                    </div>
                                    <div class="form-label-group">
                                        <asp:TextBox type="email" runat="server" ID="inputEmail" CssClass="form-control" placeholder="Your Email"></asp:TextBox>
                                        <label for="inputEmail">Email Address</label>
                                    </div>
                                    <div class="form-label-group">
                                        <asp:TextBox runat="server" type="password" ID="inputPassword" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                        <label for="inputPassword">Password</label>
                                    </div>
                                    <div class="form-label-group">
                                         <asp:TextBox type="password" runat="server" ID="inputPassword2" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
                                        <label for="inputPassword2">Confirm Password</label>
                                    </div>
                                    <asp:Button ID="btnRegister" runat="server" Text="REGISTER" CssClass="btn btn-lg btn-outline-primary btn-block btn-login text-uppercase font-weight-bold mb-2" OnClick="btnRegister_Click"/>
                                    <div class="text-center pt-3">
                                        Already have an Account? <a class="font-weight-bold" href="Login.aspx">Sign In</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="vendor/jquery/jquery-3.3.1.slim.min.js" type="ef1b236a0c2ea364d720cc32-text/javascript"></script>

    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js" type="ef1b236a0c2ea364d720cc32-text/javascript"></script>

    <script src="vendor/select2/js/select2.min.js" type="ef1b236a0c2ea364d720cc32-text/javascript"></script>

    <script src="js/main.js" type="ef1b236a0c2ea364d720cc32-text/javascript"></script>
    <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="ef1b236a0c2ea364d720cc32-|49" defer=""></script>
    <script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"662ab45418422ec8","version":"2021.5.2","r":1,"token":"dd471ab1978346bbb991feaa79e6ce5c","si":10}'></script>
</body>
</html>
