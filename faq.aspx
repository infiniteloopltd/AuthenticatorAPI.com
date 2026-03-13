<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>FAQ - Frequently Asked Questions | AuthenticatorAPI.com</title>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Frequently asked questions about AuthenticatorAPI.com — the free hosted TOTP / Google Authenticator API for developers.">
    <meta name="author" content="Infinite Loop Development Ltd">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="Techie.css" rel="stylesheet">
    <style>
        body, html { overflow-x: hidden; }
        body { padding: 60px 20px 0; font-family: 'Lato', sans-serif; }
        footer { border-top: 1px solid #ddd; padding: 30px; margin-top: 50px; }

        /* ── Nav ── */
        .site-nav { background:#2c3e50; padding: 0; margin-bottom: 36px; }
        .site-nav ul { list-style:none; margin:0; padding:0; display:flex; flex-wrap:wrap; }
        .site-nav ul li a { display:block; padding:14px 18px; color:#cdd6e0; font-size:13px; font-weight:700; text-decoration:none; letter-spacing:.04em; text-transform:uppercase; transition:background .2s,color .2s; }
        .site-nav ul li a:hover, .site-nav ul li a.active { background:#1a252f; color:#fff; }
        .site-nav .dropdown { position:relative; }
        .site-nav .dropdown-menu { display:none; position:absolute; top:100%; left:0; background:#1a252f; min-width:200px; padding:6px 0; z-index:200; list-style:none; margin:0; border:none; border-radius:0 0 4px 4px; }
        .site-nav .dropdown-menu li a { padding:10px 18px; font-size:13px; }
        .site-nav .dropdown:hover .dropdown-menu { display:block; }

        /* ── Hero ── */
        .page-hero { background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%); color:#fff; padding: 52px 0 44px; margin-bottom: 40px; border-radius: 6px; }
        .page-hero h1 { font-size: 36px; font-weight: 900; margin:0 0 10px; }
        .page-hero p { font-size: 18px; opacity:.85; margin:0; font-weight:300; }

        /* ── FAQ accordion ── */
        .faq-section-title { font-size: 22px; font-weight: 700; color: #2c3e50; border-bottom: 3px solid #3498db; padding-bottom: 8px; margin: 40px 0 20px; }
        .panel-faq { border: 1px solid #e0e6ed; border-radius: 6px !important; margin-bottom: 10px; box-shadow: none; }
        .panel-faq .panel-heading { background: #f8fafc; border-radius: 6px 6px 0 0; padding:0; }
        .panel-faq .panel-title a { display:block; padding: 16px 20px; font-size: 15px; font-weight: 700; color: #2c3e50; text-decoration:none; position:relative; }
        .panel-faq .panel-title a::after { content:"▼"; position:absolute; right:20px; top:50%; transform:translateY(-50%); font-size:11px; color:#3498db; transition: transform .25s; }
        .panel-faq .panel-title a.collapsed::after { transform:translateY(-50%) rotate(-90deg); }
        .panel-faq .panel-body { font-size: 15px; color: #444; line-height: 1.75; padding: 18px 20px; border-top: 1px solid #e0e6ed; }
        .panel-faq .panel-body code { background:#f0f4f8; padding:2px 6px; border-radius:3px; font-size:13px; color:#c0392b; }
        .panel-faq .panel-body pre { background:#1e2d3d; color:#a8d8f0; padding:16px; border-radius:5px; font-size:13px; border:none; }

        /* ── Info boxes ── */
        .info-box { background:#eaf4fb; border-left: 4px solid #3498db; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#2c3e50; }
        .warn-box  { background:#fef9e7; border-left: 4px solid #f39c12; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#7d6608; }
    </style>
</head>
<body>

    <!-- Navigation -->
    <nav class="site-nav">
        <div class="container">
            <ul>
                <li><a href="/">&#127968; Home</a></li>
                <li class="dropdown">
                    <a href="#">Integration Guides &#9660;</a>
                    <ul class="dropdown-menu">
                        <li><a href="/integrate-2fa-php.aspx">PHP</a></li>
                        <li><a href="/integrate-2fa-python.aspx">Python</a></li>
                        <li><a href="/integrate-2fa-csharp.aspx">C#</a></li>
                        <li><a href="/integrate-2fa-javascript.aspx">JavaScript / Node.js</a></li>
                        <li><a href="/integrate-2fa-java.aspx">Java</a></li>
                    </ul>
                </li>
                <li><a href="/what-is-totp.aspx">What is TOTP?</a></li>
                <li><a href="/totp-vs-hotp.aspx">TOTP vs HOTP</a></li>
                <li><a href="/why-sms-2fa-is-insecure.aspx">Why SMS 2FA is Insecure</a></li>
                <li><a href="/faq.aspx" class="active">FAQ</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">

        <!-- Hero -->
        <div class="page-hero text-center">
            <h1>Frequently Asked Questions</h1>
            <p>Everything you need to know about AuthenticatorAPI.com and TOTP-based 2FA</p>
        </div>

        <!-- Section: About the API -->
        <div class="faq-section-title">About the API</div>
        <div class="panel-group" id="faq-general">

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-general" href="#q1">Is AuthenticatorAPI.com free to use?</a></div>
                </div>
                <div id="q1" class="panel-collapse collapse in">
                    <div class="panel-body">
                        Yes — completely free. There are no usage tiers, no API keys to request, and no credit card required. The service has been running free of charge since its launch and is supported by the open-source community and GitHub Sponsors. You can make as many requests as your application needs without paying anything.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-general" href="#q2" class="collapsed">Do I need to register or get an API key?</a></div>
                </div>
                <div id="q2" class="panel-collapse collapse">
                    <div class="panel-body">
                        No registration is required. There are no API keys, no accounts, and no sign-up process. You simply call the endpoints directly with HTTP GET requests. Your <code>SecretCode</code> is a value you generate and store yourself — it is never registered with our service.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-general" href="#q3" class="collapsed">Does the API store my secret codes?</a></div>
                </div>
                <div id="q3" class="panel-collapse collapse">
                    <div class="panel-body">
                        <strong>No.</strong> AuthenticatorAPI.com is entirely stateless. Your <code>SecretCode</code> is passed as a query parameter, used transiently to compute the expected TOTP value for that instant in time, and then discarded. Nothing is written to a database, logged to disk, or retained in any form. The source code is publicly available on GitHub if you wish to verify this behaviour for yourself.
                        <div class="info-box">&#128274; Your secret codes live only in your own database. We never see them twice.</div>
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-general" href="#q4" class="collapsed">Can I self-host this API?</a></div>
                </div>
                <div id="q4" class="panel-collapse collapse">
                    <div class="panel-body">
                        Yes. The full source code is available on <a href="https://github.com/infiniteloopltd/AuthenticatorAPI.com" target="_blank" rel="noopener">GitHub</a> under an open licence. You can clone the repository and deploy it to any server that supports ASP.NET. Self-hosting is a good option if your security policy requires that secret codes never leave your own infrastructure.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-general" href="#q5" class="collapsed">What is the uptime / SLA of the hosted service?</a></div>
                </div>
                <div id="q5" class="panel-collapse collapse">
                    <div class="panel-body">
                        The hosted service is provided on a best-effort basis with no formal SLA. For production applications where availability is critical, we recommend either self-hosting the API or implementing a local TOTP library as a fallback. The TOTP algorithm itself is an open standard (RFC 6238) and is straightforward to implement natively in any language.
                        <div class="warn-box">&#9888; For mission-critical production workloads, always plan for the possibility that any third-party API may be temporarily unavailable.</div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Section: Integration -->
        <div class="faq-section-title">Integration &amp; Usage</div>
        <div class="panel-group" id="faq-integration">

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-integration" href="#q6">What format should the SecretCode be in?</a></div>
                </div>
                <div id="q6" class="panel-collapse collapse in">
                    <div class="panel-body">
                        The <code>SecretCode</code> should be a <strong>Base32-encoded</strong> string. Base32 uses the characters A–Z and 2–7. A minimum of 16 Base32 characters (80 bits of entropy) is recommended; 32 characters (160 bits) is ideal for strong security. You should generate this value using a cryptographically secure random number generator and store it encrypted in your database, associated with the user's account.
                        <br><br>
                        Example of a valid secret: <code>JBSWY3DPEHPK3PXP</code>
                        <br><br>
                        Many languages have Base32 libraries available. You can also generate random bytes and Base32-encode them manually.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-integration" href="#q7" class="collapsed">Which programming languages can I use?</a></div>
                </div>
                <div id="q7" class="panel-collapse collapse">
                    <div class="panel-body">
                        Any language capable of making an HTTP GET request. This includes PHP, Python, JavaScript/Node.js, C#, Java, Ruby, Go, Rust, Swift, Kotlin, and many more. The API returns plain text responses (<code>true</code> or <code>false</code> for validation, and an image URL or QR data for pairing), making it trivial to consume from any environment.
                        <br><br>
                        See our integration guides for copy-paste examples in the most popular languages.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-integration" href="#q8" class="collapsed">What does the Pair endpoint return?</a></div>
                </div>
                <div id="q8" class="panel-collapse collapse">
                    <div class="panel-body">
                        The <code>/pair.aspx</code> endpoint returns an <code>&lt;img&gt;</code> tag containing a QR code image that you can embed directly in your HTML. Alternatively, you can call <code>/qr.aspx</code> directly to get the raw QR code image. The QR code encodes an <code>otpauth://</code> URI that Google Authenticator and compatible apps understand natively.
                        <pre>https://www.authenticatorApi.com/pair.aspx?AppName=MyApp&amp;AppInfo=john@example.com&amp;SecretCode=JBSWY3DPEHPK3PXP</pre>
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-integration" href="#q9" class="collapsed">What does the Validate endpoint return?</a></div>
                </div>
                <div id="q9" class="panel-collapse collapse">
                    <div class="panel-body">
                        The <code>/Validate.aspx</code> endpoint returns the plain text string <code>True</code> or <code>False</code> (case-insensitive). Your application should read this response, trim any whitespace, and compare it to determine whether to grant or deny access.
                        <pre>https://www.authenticatorApi.com/Validate.aspx?Pin=123456&amp;SecretCode=JBSWY3DPEHPK3PXP</pre>
                        Response: <code>True</code> or <code>False</code>
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-integration" href="#q10" class="collapsed">How do I handle clock drift?</a></div>
                </div>
                <div id="q10" class="panel-collapse collapse">
                    <div class="panel-body">
                        TOTP codes are time-based and valid for a 30-second window. To account for minor clock drift between the user's device and the server, the API accepts codes from one window either side of the current one — meaning a code can be valid for up to 90 seconds in practice. This is standard behaviour defined in RFC 6238. For most applications this window is sufficient. If your users frequently report invalid codes, ensure your server's system clock is synchronised via NTP.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-integration" href="#q11" class="collapsed">Should I URL-encode the SecretCode parameter?</a></div>
                </div>
                <div id="q11" class="panel-collapse collapse">
                    <div class="panel-body">
                        Yes — always URL-encode query parameter values, especially if your secret code contains characters that have special meaning in URLs. Base32 secrets (A–Z, 2–7) are safe without encoding, but it is good practice to URL-encode all parameters programmatically rather than constructing URLs by hand.
                    </div>
                </div>
            </div>

        </div>

        <!-- Section: Compatibility -->
        <div class="faq-section-title">Compatibility</div>
        <div class="panel-group" id="faq-compat">

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-compat" href="#q12">Does this work with Authy?</a></div>
                </div>
                <div id="q12" class="panel-collapse collapse in">
                    <div class="panel-body">
                        Yes. Authy is fully TOTP-compatible and will work seamlessly with codes generated by this API. The <code>otpauth://</code> URI format produced by the Pair endpoint is the same standard format used by Google Authenticator, Authy, Microsoft Authenticator, 1Password, Bitwarden, and all other major authenticator apps.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-compat" href="#q13" class="collapsed">Does this work with Microsoft Authenticator?</a></div>
                </div>
                <div id="q13" class="panel-collapse collapse">
                    <div class="panel-body">
                        Yes. Microsoft Authenticator supports the TOTP standard (RFC 6238) and will scan the QR code produced by this API just like any other authenticator app. The resulting codes are validated by the same <code>/Validate.aspx</code> endpoint regardless of which app the user chooses.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-compat" href="#q14" class="collapsed">Can users enter the secret manually instead of scanning a QR code?</a></div>
                </div>
                <div id="q14" class="panel-collapse collapse">
                    <div class="panel-body">
                        Yes. All authenticator apps allow manual entry of a secret as an alternative to QR scanning. You can display the raw <code>SecretCode</code> value to the user alongside the QR code and instruct them to tap "Enter a setup key" in their app. The secret should be displayed in its Base32 form (e.g. <code>JBSWY3DPEHPK3PXP</code>) grouped in blocks of 4 characters for readability.
                    </div>
                </div>
            </div>

        </div>

        <!-- Section: User Scenarios -->
        <div class="faq-section-title">User Scenarios</div>
        <div class="panel-group" id="faq-users">

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-users" href="#q15">What happens if a user loses their phone?</a></div>
                </div>
                <div id="q15" class="panel-collapse collapse in">
                    <div class="panel-body">
                        This is one of the most important edge cases to plan for. Best practices include:
                        <ul>
                            <li><strong>Backup codes:</strong> Generate a set of one-time recovery codes at enrolment time and prompt the user to save them somewhere safe. Each code can be used once to bypass 2FA and re-enrol a new device.</li>
                            <li><strong>Admin reset:</strong> Provide a support workflow where an authenticated admin can disable 2FA on a user's account after verifying their identity through another channel.</li>
                            <li><strong>Email recovery:</strong> Send a time-limited recovery link to the user's verified email address.</li>
                        </ul>
                        Whichever approach you choose, document it clearly for your users before they need it.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-users" href="#q16" class="collapsed">Can a user have 2FA on multiple devices?</a></div>
                </div>
                <div id="q16" class="panel-collapse collapse">
                    <div class="panel-body">
                        Yes — because TOTP is deterministic (the same secret + the same timestamp always produces the same code), a user can add the same QR code to multiple devices and all devices will generate identical valid codes simultaneously. To support this, simply show the QR code in a way that allows the user to scan it with more than one device during enrolment.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-users" href="#q17" class="collapsed">How do I let users disable 2FA?</a></div>
                </div>
                <div id="q17" class="panel-collapse collapse">
                    <div class="panel-body">
                        This is handled entirely within your own application. When a user disables 2FA, you simply delete or nullify the stored <code>SecretCode</code> for their account and stop calling the Validate endpoint during login. The API itself has no concept of enabled or disabled users — it is stateless and simply validates whatever PIN and secret you send it.
                    </div>
                </div>
            </div>

        </div>

        <!-- Section: Security -->
        <div class="faq-section-title">Security</div>
        <div class="panel-group" id="faq-security">

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-security" href="#q18">Is it safe to pass the secret code in a GET request?</a></div>
                </div>
                <div id="q18" class="panel-collapse collapse in">
                    <div class="panel-body">
                        As long as you always call the API over HTTPS (which you should), the query parameters — including the secret code — are encrypted in transit and cannot be intercepted by a third party. However, be aware that GET parameters may appear in server-side access logs. If your application server logs all outbound HTTP requests, consider whether log access control is adequate for your security requirements. An alternative is to self-host the API and call it on localhost, so the secret never leaves your server.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-security" href="#q19" class="collapsed">Should I rate-limit PIN attempts?</a></div>
                </div>
                <div id="q19" class="panel-collapse collapse">
                    <div class="panel-body">
                        Absolutely yes. A 6-digit TOTP code has 1,000,000 possible values, and each is only valid for 30 seconds, making brute-force attacks theoretically difficult. However, your application should still enforce a rate limit — for example, locking an account after 5 failed 2FA attempts within a short window. This prevents automated guessing attacks and is considered a security best practice regardless of the underlying 2FA mechanism.
                    </div>
                </div>
            </div>

            <div class="panel panel-faq">
                <div class="panel-heading">
                    <div class="panel-title"><a data-toggle="collapse" data-parent="#faq-security" href="#q20" class="collapsed">Can a TOTP code be reused?</a></div>
                </div>
                <div id="q20" class="panel-collapse collapse">
                    <div class="panel-body">
                        In principle, a TOTP code is valid for its 30-second window (plus any tolerance window), so it could theoretically be reused within that window. To prevent replay attacks, your application should maintain a short-lived record of recently used codes and reject any code that has already been accepted within its validity window. This is known as "code binding" and is a recommended hardening measure for high-security applications.
                    </div>
                </div>
            </div>

        </div>

        <br><br>

    </div><!-- /container -->

    <footer>
        <div class="container text-center">
            <a href="https://github.com/infiniteloopltd/AuthenticatorAPI.com" target="_blank" rel="noopener">Open Source</a> on GitHub |
            <a href="/Sponsors.aspx">With thanks to our GitHub Sponsors</a><br><br>
            &copy; 2026 <a href="http://www.infiniteloop.ie">Infinite Loop Development Ltd</a> &nbsp;|&nbsp;
            <a href="/contact.aspx">Contact Us</a> &nbsp;|&nbsp;
            <a href="/privacy.aspx">Privacy Policy</a>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
