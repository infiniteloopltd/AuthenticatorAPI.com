<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AuthenticatorAPI.Contact" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Contact Us - AuthenticatorAPI.com</title>

    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Contact Infinite Loop Development Ltd, makers of AuthenticatorAPI.com">
    <meta name="author" content="Infinite Loop Development Ltd">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="Techie.css" rel="stylesheet">

    <style>
        body, html { overflow-x: hidden; }
        body { padding: 60px 20px 0; }
        footer {
            border-top: 1px solid #ddd;
            padding: 30px;
            margin-top: 50px;
            text-align: center;
            font-size: 0.9em;
            color: #666;
        }
    </style>
</head>

<body>

    <div class="container">

        <div class="jumbotron">
            <img src="auth.png" style="float: left; margin-top:30px" width="50" />
            <h1>Authenticator API.com</h1>
            <p>An API for Google Authenticator</p>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">

                <h2>Contact Us</h2>
                <hr>

                <h3>Company Profile</h3>
                <p><strong>Infinite Loop Development Ltd</strong> &mdash; Established 2004</p>
                <p>
                    We are an Irish registered software development company, previously named Open Merchant Account Ltd.
                    Our core competencies are in B2B software services and App development.
                </p>
                <p>To contact us, we invite you to select the Email or Call options below.</p>

                <h3>Contact Information</h3>
                <p>
                    <a href="mailto:info@infiniteloop.ie" class="btn btn-primary">
                        <span class="glyphicon glyphicon-envelope"></span> Email Us
                    </a>
                    &nbsp;
                    <a href="tel:00442871226151" class="btn btn-default">
                        <span class="glyphicon glyphicon-earphone"></span> +44 287 122 6151
                    </a>
                </p>

                <h3>Registered Address</h3>
                <address>
                    <strong>Infinite Loop Development Ltd</strong><br />
                    Ballyliffen<br />
                    Clonmany<br />
                    Co. Donegal<br />
                    Ireland<br />
                    F93 V56N
                </address>

                <h3>Company Registration</h3>
                <table class="table table-bordered" style="max-width: 400px;">
                    <tr>
                        <td><strong>Company Reg. Number</strong></td>
                        <td>389820</td>
                    </tr>
                    <tr>
                        <td><strong>VAT Reg. Number (IE)</strong></td>
                        <td>6409 820U</td>
                    </tr>
                </table>

                <p>
                    You can also open an issue on our
                    <a href="https://github.com/infiniteloopltd/AuthenticatorAPI.com">GitHub repository</a>.
                </p>

            </div>
        </div>

    </div>

    <footer>
        <p>
            &copy; 2026 <a href="http://www.infiniteloop.ie">Infinite Loop Development Ltd</a> &nbsp;|&nbsp;
            <a href="/contact.aspx">Contact Us</a> &nbsp;|&nbsp;
            <a href="/privacy.aspx">Privacy Policy</a>
        </p>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>