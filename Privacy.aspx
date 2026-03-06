<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Privacy.aspx.cs" Inherits="AuthenticatorAPI.Privacy" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Privacy Policy - AuthenticatorAPI.com</title>

    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Privacy Policy for AuthenticatorAPI.com - a service by Infinite Loop Development Ltd">
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

                <h2>Privacy Policy</h2>
                <hr>
                <p><em>Last updated: March 2026</em></p>

                <h3>Data We Do Not Collect</h3>
                <p>
                    AuthenticatorAPI.com is a stateless API. We do <strong>not</strong> store, log, or retain
                    any secret codes, PINs, app names, or user identifiers passed to the API.
                    Each request is processed in memory and discarded immediately.
                </p>

                <h3>Server Logs</h3>
                <p>
                    Our web server may retain standard HTTP access logs (IP address, timestamp, URL path)
                    for a limited period for operational and security purposes. These logs do not contain
                    secret codes or PIN values.
                </p>

                <h3>Cookies</h3>
                <p>
                    This website does not use tracking cookies or third-party analytics cookies.
                </p>

                <h3>Google Analytics</h3>
                <p>
                    This website uses Google Analytics to collect anonymous usage statistics such as
                    page views and visitor counts. No personally identifiable information is collected.
                    You can opt out using the
                    <a href="https://tools.google.com/dlpage/gaoptout" target="_blank">Google Analytics opt-out browser add-on</a>.
                </p>

                <h3>Third Parties</h3>
                <p>
                    We do not sell or share any personal data with third parties.
                </p>

                <h3>Your Rights</h3>
                <p>
                    If you are located in the European Union, you have rights under the General Data Protection
                    Regulation (GDPR), including the right to access, correct, or request deletion of any
                    personal data we hold about you. As we collect no personal data through use of the API,
                    there is typically nothing to access or delete.
                </p>

                <h3>Data Controller</h3>
                <table class="table table-bordered" style="max-width: 500px;">
                    <tr>
                        <td><strong>Company</strong></td>
                        <td>Infinite Loop Development Ltd</td>
                    </tr>
                    <tr>
                        <td><strong>Registered in</strong></td>
                        <td>Ireland</td>
                    </tr>
                    <tr>
                        <td><strong>Company Reg.</strong></td>
                        <td>389820</td>
                    </tr>
                    <tr>
                        <td><strong>VAT Reg. (IE)</strong></td>
                        <td>6409 820U</td>
                    </tr>
                </table>

                <h3>Contact</h3>
                <p>
                    If you have any questions about this privacy policy, please
                    <a href="/contact.aspx">contact us</a>.
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