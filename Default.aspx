<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AuthenticatorAPI.Default" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <title>Authenticator API.com - An API for Google Authenticator</title>

    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="An easy and free way to implement two factor authentication (2FA) in your app.">
    <meta name="author" content="Infinite Loop Development Ltd">

    <!-- Bootstrap css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="Techie.css" rel="stylesheet">

    <!-- =======================================================
      Theme Name: Techie
      Theme URL: https://bootstrapmade.com/techie-free-skin-bootstrap-3/
      Author: BootstrapMade
      Author URL: https://bootstrapmade.com
    ======================================================= -->
    <!-- Docs Custom styles -->
    <style>
        body,
        html {
            overflow-x: hidden;
        }

        body {
            padding: 60px 20px 0;
        }

        footer {
            border-top: 1px solid #ddd;
            padding: 30px;
            margin-top: 50px;
        }

        .row > [class*=col-] {
            margin-bottom: 40px;
        }

        .navbar-container {
            position: relative;
            min-height: 100px;
        }

        .navbar.navbar-fixed-bottom,
        .navbar.navbar-fixed-top {
            position: absolute;
            top: 50px;
            z-index: 0;
        }

            .navbar.navbar-fixed-bottom .container,
            .navbar.navbar-fixed-top .container {
                max-width: 90%;
            }

        .btn-group {
            margin-bottom: 10px;
        }

        .form-inline input[type=password],
        .form-inline input[type=text],
        .form-inline select {
            width: 180px;
        }

        .input-group {
            margin-bottom: 10px;
        }

        .pagination {
            margin-top: 0;
        }

        .navbar-inverse {
            margin: 110px 0;
        }

       

    </style>

</head>

<body>

    <div class="container">

        <div class="jumbotron">
           
            <img src="auth.png" style="float: left;  margin-top:30px" width="50"/><h1 >Authenticator API.com</h1>
            <p>An API for Google Authenticator</p>
            <p><a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#pairModal" role="button">Pair</a>
               <a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#ValidateModal" role="button">Validate</a>
            </p>
          
        </div>


        <!-- COMPONENTS =========================================================== -->
        <!-- Navs -->

        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <h2>Demo code</h2>
                <div class="row">
                    <div class="col-sm-12 col-lg-12">
                        <p class="lead text-muted">To use Google Authenticator as a two-factor authentication method, you must first pair with the user's Google Authenticator App, by displaying a QR code to them. This QR code is generated using a secret code that only you know. When
                            the user logs in, they must enter the code displayed on their authenticator app, which you validate against the secret code used earlier. 
                        </p>
                        <div class="tabbable">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab11" data-toggle="tab">Pairing</a></li>
                                <li><a href="#tab12" data-toggle="tab">Validation</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab11">
                                    <p>You can use the <a href="/api.asmx?op=Pair">web service to pair</a>, or call "https://www.authenticatorApi.com/pair.aspx" with the following parameters:</p>
                                    <ul>
                                        <li><b>AppName</b> - Your application name, something brief, but recognizable</li>
                                        <li><b>AppInfo</b> - Typically the user's name</li>
                                        <li><b>SecretCode</b> - A secret code that only you know</li>
                                    </ul>
                                    <br/>
                                    <i>Example:</i>
 <pre>
<a href="https://www.authenticatorApi.com/pair.aspx?AppName=MyApp&AppInfo=John&SecretCode=12345678BXYT" target="_blank">https://www.authenticatorApi.com/pair.aspx?AppName=MyApp&AppInfo=John&SecretCode=12345678BXYT</a>
</pre>
                                </div>
                                <div class="tab-pane" id="tab12">
                                    <p>You can use the <a href="/api.asmx?op=ValidatePin">web service to validate a pin</a>, or call "https://www.authenticatorApi.com/Validate.aspx" with the following parameters:</p>
                                    <ul>
                                        <li><b>Pin</b> - The user's pin</li>
                                        <li><b>SecretCode</b> - The secret code used using Pairing</li>
                                    </ul>
                                    <br/>
                                    <i>Example:</i>
                                    <pre>
<a href="https://www.authenticatorApi.com/Validate.aspx?Pin=123456&SecretCode=12345678BXYT" target="_blank">https://www.authenticatorApi.com/Validate.aspx?Pin=123456&SecretCode=12345678BXYT</a>
</pre>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Navbar -->
        </div>


    </div>
    <!-- /container -->


<div class="container">

    <hr>

    <!-- What is 2FA -->
    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <h2>What is Two-Factor Authentication (2FA)?</h2>
            <p class="lead text-muted">
                Two-factor authentication (2FA) is a security mechanism that requires users to provide two separate
                forms of verification before gaining access to an account or system. The first factor is typically
                something the user knows &mdash; such as a password &mdash; while the second factor is something the
                user possesses, such as a time-sensitive code generated by an authenticator app.
            </p>
            <p>
                By requiring both factors, 2FA dramatically reduces the risk of unauthorised access, even if a
                user&rsquo;s password has been compromised. Authenticator app-based 2FA is considered significantly
                more secure than SMS-based alternatives, which are vulnerable to SIM-swapping and interception attacks.
            </p>
        </div>
    </div>

    <hr>

    <!-- What is TOTP -->
    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <h2>What is TOTP?</h2>
            <p class="lead text-muted">
                TOTP stands for <strong>Time-based One-Time Password</strong>, the open standard (defined in
                <a href="https://datatracker.ietf.org/doc/html/rfc6238" target="_blank" rel="noopener">RFC 6238</a>)
                that underpins Google Authenticator, Authy, Microsoft Authenticator, and most other authenticator apps.
            </p>
            <p>
                A TOTP code is derived from a shared secret key and the current Unix timestamp, producing a new 6-digit
                code every 30 seconds. Because codes expire rapidly and the shared secret never travels over the network
                during login, TOTP is highly resistant to phishing and replay attacks. The algorithm is an open standard,
                meaning any compliant implementation &mdash; including this API &mdash; is fully interoperable with
                Google Authenticator and other TOTP-compatible apps.
            </p>
        </div>
    </div>

    <hr>

    <!-- About the API -->
    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <h2>About This API</h2>
            <p class="lead text-muted">
                AuthenticatorAPI.com provides a simple, free, hosted REST API that allows developers to add
                Google Authenticator-compatible two-factor authentication to any application, regardless of
                programming language or platform.
            </p>
            <p>
                There are no SDKs to install and no libraries to manage &mdash; just standard HTTP GET requests.
                The API exposes two core operations:
            </p>
            <div class="row">
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading"><strong>Pairing</strong></div>
                        <div class="panel-body">
                            Generates a QR code that the user scans with their Google Authenticator app. The QR code
                            encodes your application name, a user identifier, and a shared secret that you supply.
                            Once scanned, the authenticator app begins generating TOTP codes tied to that secret.
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading"><strong>Validation</strong></div>
                        <div class="panel-body">
                            Verifies that a 6-digit PIN entered by a user matches the expected TOTP value for a given
                            secret at the current moment in time. The API handles the time-window logic, accepting
                            codes from a small interval around the current 30-second window to account for clock drift.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <hr>

    <!-- How it works -->
    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <h2>How It Works</h2>
            <p class="lead text-muted">Integrating Google Authenticator into your app takes just a few steps:</p>
            <ol>
                <li>When a user opts in to 2FA, your application calls the <strong>Pair</strong> endpoint with your
                    app name, a user identifier, and a secret code that you generate and store securely.</li>
                <li>The API returns a QR code image URL that you display to the user.</li>
                <li>The user opens their Google Authenticator app, taps the <strong>+</strong> button, and scans
                    the QR code.</li>
                <li>From that point on, whenever the user logs in, they enter the 6-digit code currently shown
                    in their authenticator app.</li>
                <li>Your application calls the <strong>Validate</strong> endpoint with the entered PIN and the
                    original secret code.</li>
                <li>The API returns <code>true</code> or <code>false</code> &mdash; and you grant or deny access
                    accordingly.</li>
            </ol>
        </div>
    </div>

    <hr>

    <!-- Use cases -->
    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <h2>Use Cases</h2>
            <p class="lead text-muted">
                AuthenticatorAPI.com is suitable for any scenario where you need to add a second layer of
                authentication without building TOTP logic from scratch.
            </p>
            <div class="row">
                <div class="col-sm-3">
                    <h4><span class="glyphicon glyphicon-globe"></span> Web Applications</h4>
                    <p>Protect admin panels, customer accounts, or sensitive data with a simple API call during login.</p>
                </div>
                <div class="col-sm-3">
                    <h4><span class="glyphicon glyphicon-lock"></span> Internal Tools</h4>
                    <p>Add 2FA to internal dashboards or employee portals without complex infrastructure or dependencies.</p>
                </div>
                <div class="col-sm-3">
                    <h4><span class="glyphicon glyphicon-wrench"></span> Legacy Systems</h4>
                    <p>Retrofit two-factor authentication onto existing systems that don&rsquo;t natively support it.</p>
                </div>
                <div class="col-sm-3">
                    <h4><span class="glyphicon glyphicon-flash"></span> Rapid Prototyping</h4>
                    <p>Add working 2FA to a prototype in minutes using any language that can make HTTP GET requests.</p>
                </div>
            </div>
        </div>
    </div>

    <hr>

    <!-- Security -->
    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <h2>Security Considerations</h2>
            <p class="lead text-muted">
                When implementing two-factor authentication, keep the following best practices in mind:
            </p>
            <ul>
                <li><strong>Keep your secret codes secure.</strong> The secret code used during pairing should be
                    stored in your database in encrypted form and never exposed to the client or included in
                    client-side code.</li>
                <li><strong>Use HTTPS.</strong> Always call the API over HTTPS to prevent the secret code from
                    being intercepted in transit.</li>
                <li><strong>Generate unique secrets per user.</strong> Each user should have their own randomly
                    generated secret code, so that a compromise of one account does not affect others.</li>
                <li><strong>The API is stateless.</strong> AuthenticatorAPI.com does not store your secret codes.
                    They are used transiently during each request to generate or validate a TOTP value and are
                    never logged or persisted.</li>
                <li><strong>Use a cryptographically random secret.</strong> Generate your secret codes using a
                    secure random number generator. A Base32-encoded string of at least 16 characters is recommended
                    for adequate entropy.</li>
            </ul>
        </div>
    </div>

    <hr>

    <!-- Open Source -->
    <div class="row">
        <div class="col-sm-12 col-lg-12">
            <h2>Open Source</h2>
            <p>
                The full source code for this API is available on
                <a href="https://github.com/infiniteloopltd/AuthenticatorAPI.com" target="_blank" rel="noopener">GitHub</a>.
                You are welcome to inspect the implementation, self-host it, or contribute improvements. The codebase
                serves as a useful reference for anyone wanting to understand how TOTP generation and validation works
                in practice, and is freely available under an open licence.
            </p>
        </div>
    </div>

</div>
<!-- /content container -->


<footer class="text-center">
    <p> <a href="https://github.com/infiniteloopltd/AuthenticatorAPI.com">Open Source</a> on GitHub </p>
    <p>&copy; <%=DateTime.Now.Year %> <a href="http://www.infiniteloop.ie">Infinite Loop Development Ltd</a>. </p>
</footer>

    <!-- Main Scripts-->
<script
    src="https://code.jquery.com/jquery-1.11.1.min.js"
    integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
    crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>
    <script src="app.js"></script>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-3658396-50"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-3658396-50');
    </script>
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <!-- TweetJS.com -->
    <ins class="adsbygoogle"
         style="display:block"
         data-ad-client="ca-pub-6435000594396515"
         data-ad-slot="8229950486"
         data-ad-format="auto"
         data-full-width-responsive="true"></ins>
    <script>
    (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
    

<!-- Modal -->
<div id="pairModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Pairing with secret code "1234"</h4>
            </div>
            <div class="modal-body">
                <center>
                    <%=PairingHtml %>
                </center>
                <p>Open your Google Authenticator App, and press the "+" icon in the top right, and then press "Scan Barcode"</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

    
<!-- Modal -->
<div id="ValidateModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Validating against secret code "1234"</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <fieldset>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="pin">6 digit Pin</label>  
                            <div class="col-md-4">
                                <input id="pin" name="pin" type="text" placeholder="6 digit Pin" class="form-control input-md">
    
                            </div>
                        </div>

                        <!-- Button -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="btnValidate"></label>
                            <div class="col-md-4">
                                <button id="btnValidate" name="btnValidate" class="btn btn-primary">Validate</button>
                            </div>
                        </div>

                    </fieldset>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>



</body>

</html>
