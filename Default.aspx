<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AuthenticatorAPI.Default" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <title>Authenticator API.com - An API for Google Authenticator</title>

    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Techie Bootstrap 3 skin">
    <meta name="keywords" content="bootstrap 3, skin, flat">
    <meta name="author" content="bootstraptaste">

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
