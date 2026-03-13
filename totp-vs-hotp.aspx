<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>TOTP vs HOTP — What's the Difference? | AuthenticatorAPI.com</title>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="An in-depth comparison of TOTP and HOTP — the two main one-time password algorithms. Learn the differences, use cases, and which one to choose for your application.">
    <meta name="author" content="Infinite Loop Development Ltd">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="Techie.css" rel="stylesheet">
    <style>
        body, html { overflow-x: hidden; }
        body { padding: 60px 20px 0; font-family: 'Lato', sans-serif; }
        footer { border-top: 1px solid #ddd; padding: 30px; margin-top: 50px; }

        .site-nav { background:#2c3e50; padding:0; margin-bottom:36px; }
        .site-nav ul { list-style:none; margin:0; padding:0; display:flex; flex-wrap:wrap; }
        .site-nav ul li a { display:block; padding:14px 18px; color:#cdd6e0; font-size:13px; font-weight:700; text-decoration:none; letter-spacing:.04em; text-transform:uppercase; transition:background .2s,color .2s; }
        .site-nav ul li a:hover, .site-nav ul li a.active { background:#1a252f; color:#fff; }
        .site-nav .dropdown { position:relative; }
        .site-nav .dropdown-menu { display:none; position:absolute; top:100%; left:0; background:#1a252f; min-width:200px; padding:6px 0; z-index:200; list-style:none; margin:0; border:none; border-radius:0 0 4px 4px; }
        .site-nav .dropdown-menu li a { padding:10px 18px; font-size:13px; }
        .site-nav .dropdown:hover .dropdown-menu { display:block; }

        .page-hero { background: linear-gradient(135deg, #4a235a 0%, #8e44ad 100%); color:#fff; padding:52px 0 44px; margin-bottom:40px; border-radius:6px; }
        .page-hero h1 { font-size:38px; font-weight:900; margin:0 0 12px; }
        .page-hero p { font-size:18px; opacity:.85; margin:0; font-weight:300; }

        h2.section { font-size:26px; font-weight:700; color:#2c3e50; border-bottom:3px solid #8e44ad; padding-bottom:8px; margin:44px 0 20px; }
        h3.sub { font-size:19px; font-weight:700; color:#2c3e50; margin:28px 0 12px; }
        p, li { font-size:15px; color:#444; line-height:1.8; }
        .lead { font-size:17px; color:#555; }

        .dual-col { display:flex; gap:24px; flex-wrap:wrap; margin:28px 0; }
        .col-card { flex:1; min-width:260px; border-radius:8px; overflow:hidden; box-shadow:0 2px 12px rgba(0,0,0,.08); }
        .col-card .card-header { padding:20px 24px 16px; color:#fff; }
        .col-card.totp .card-header { background: linear-gradient(135deg, #1565c0, #42a5f5); }
        .col-card.hotp .card-header { background: linear-gradient(135deg, #7b1a1a, #e53935); }
        .col-card .card-header h3 { margin:0 0 4px; font-size:22px; font-weight:900; }
        .col-card .card-header p  { margin:0; opacity:.85; font-size:14px; }
        .col-card .card-body { padding:20px 24px; background:#fff; border:1px solid #e0e6ed; border-top:none; border-radius:0 0 8px 8px; }
        .col-card .card-body ul { padding-left:18px; margin:0; }
        .col-card .card-body li { font-size:14px; line-height:1.8; color:#444; }

        .comparison-table { width:100%; border-collapse:collapse; margin:24px 0; font-size:14px; }
        .comparison-table th { padding:12px 16px; text-align:left; }
        .comparison-table th:first-child { background:#f8fafc; color:#2c3e50; }
        .comparison-table th.totp { background:#1565c0; color:#fff; }
        .comparison-table th.hotp { background:#7b1a1a; color:#fff; }
        .comparison-table td { padding:11px 16px; border-bottom:1px solid #e0e6ed; vertical-align:top; }
        .comparison-table tr:nth-child(even) td { background:#f8fafc; }
        .comparison-table td:not(:first-child) { text-align:center; }

        .win  { color:#1a6b3c; font-weight:700; }
        .lose { color:#7b1a1a; }
        .draw { color:#7d5200; }

        .info-box { background:#f5eef8; border-left:4px solid #8e44ad; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#4a235a; }
        .warn-box { background:#fef9e7; border-left:4px solid #f39c12; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#7d6608; }

        .counter-visual { display:flex; align-items:center; gap:12px; margin:20px 0; flex-wrap:wrap; }
        .counter-box { background:#1e2d3d; color:#a8d8f0; border-radius:6px; padding:12px 18px; font-family:monospace; font-size:13px; line-height:1.6; }
        .counter-arrow { font-size:22px; color:#8e44ad; }
    </style>
</head>
<body>

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
                <li><a href="/totp-vs-hotp.aspx" class="active">TOTP vs HOTP</a></li>
                <li><a href="/why-sms-2fa-is-insecure.aspx">Why SMS 2FA is Insecure</a></li>
                <li><a href="/faq.aspx">FAQ</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">

        <div class="page-hero text-center">
            <h1>TOTP vs HOTP</h1>
            <p>Understanding the two one-time password algorithms — and when to use each one</p>
        </div>

        <p class="lead">Both TOTP and HOTP generate short numeric codes that can be used as a second authentication factor. They share the same underlying HMAC construction and the same Base32 secret format. The crucial difference is what drives the code change: <strong>TOTP uses time</strong>, while <strong>HOTP uses a counter</strong>. This single design decision produces very different security and usability trade-offs.</p>

        <h2 class="section">At a Glance</h2>

        <div class="dual-col">
            <div class="col-card totp">
                <div class="card-header">
                    <h3>TOTP</h3>
                    <p>Time-based One-Time Password &mdash; RFC 6238</p>
                </div>
                <div class="card-body">
                    <ul>
                        <li>Code changes every <strong>30 seconds</strong></li>
                        <li>Both parties use the current timestamp as input</li>
                        <li>No state synchronisation needed</li>
                        <li>Requires roughly synchronised clocks</li>
                        <li>Used by Google Authenticator, Authy, Microsoft Authenticator</li>
                        <li>Best for: web logins, app authentication</li>
                    </ul>
                </div>
            </div>
            <div class="col-card hotp">
                <div class="card-header">
                    <h3>HOTP</h3>
                    <p>HMAC-based One-Time Password &mdash; RFC 4226</p>
                </div>
                <div class="card-body">
                    <ul>
                        <li>Code changes when the <strong>counter increments</strong></li>
                        <li>Both parties maintain a shared counter value</li>
                        <li>Counter drift can cause synchronisation issues</li>
                        <li>Works completely offline, no clock dependency</li>
                        <li>Used by hardware tokens (RSA SecurID, YubiKey OTP mode)</li>
                        <li>Best for: hardware tokens, offline environments</li>
                    </ul>
                </div>
            </div>
        </div>

        <h2 class="section">How HOTP Works</h2>
        <p>HOTP was defined first, in RFC 4226 (2005). It replaces the time counter used by TOTP with an integer counter that increments each time a code is generated. Both the client (authenticator device) and the server maintain their own copy of this counter.</p>

        <div class="counter-visual">
            <div class="counter-box">Client counter: <strong>42</strong> → generates code <strong>831047</strong></div>
            <div class="counter-arrow">&#8596;</div>
            <div class="counter-box">Server expects counter: <strong>42</strong> → expects code <strong>831047</strong></div>
        </div>

        <p>After each successful authentication, both sides increment the counter to 43. The next login will produce a completely different code based on counter value 43.</p>

        <h3 class="sub">The Counter Drift Problem</h3>
        <p>The critical weakness of HOTP in practice is <em>counter drift</em>. If the user generates a code on their device but doesn't use it (for example, they pressed the button by mistake), the client counter advances but the server's counter does not. After a few such events, the two counters are out of sync and authentication fails.</p>
        <p>To handle this, HOTP implementations typically allow a <em>look-ahead window</em> — the server will test the next N counter values to see if any match. This helps with occasional drift but creates a trade-off: the larger the window, the more susceptible the system is to brute-force attacks.</p>

        <div class="warn-box">&#9888; A stolen HOTP code remains valid until it is actually used — potentially indefinitely if the legitimate user never logs in again. TOTP codes expire automatically after 30–90 seconds regardless.</div>

        <h2 class="section">How TOTP Improves on HOTP</h2>
        <p>TOTP (RFC 6238, published 2011) replaces the counter with a time-derived value: the number of 30-second intervals elapsed since the Unix epoch. This solves the drift problem entirely — both parties independently derive the same counter from the clock without any state synchronisation, and codes expire automatically.</p>

        <div class="info-box">&#128161; <strong>Key insight:</strong> TOTP = HOTP where the counter is replaced by <code>floor(UnixTimestamp / 30)</code>. The rest of the algorithm is identical.</div>

        <h2 class="section">Head-to-Head Comparison</h2>

        <table class="comparison-table">
            <thead>
                <tr>
                    <th>Criteria</th>
                    <th class="totp">TOTP</th>
                    <th class="hotp">HOTP</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>Code validity period</strong></td>
                    <td class="win">~30–90 seconds</td>
                    <td class="lose">Until next use (potentially indefinite)</td>
                </tr>
                <tr>
                    <td><strong>Replay attack resistance</strong></td>
                    <td class="win">Strong — code expires quickly</td>
                    <td class="lose">Weaker — used code stays valid until consumed</td>
                </tr>
                <tr>
                    <td><strong>Phishing window</strong></td>
                    <td class="draw">Narrow (seconds)</td>
                    <td class="lose">Wide (indefinite until next use)</td>
                </tr>
                <tr>
                    <td><strong>State synchronisation</strong></td>
                    <td class="win">None required — stateless</td>
                    <td class="lose">Counter must be kept in sync</td>
                </tr>
                <tr>
                    <td><strong>Clock requirement</strong></td>
                    <td class="draw">Requires roughly synchronised clocks</td>
                    <td class="win">No clock needed — fully offline</td>
                </tr>
                <tr>
                    <td><strong>Lost code recovery</strong></td>
                    <td class="win">Automatic — wait for next window</td>
                    <td class="lose">Counter may need manual resync</td>
                </tr>
                <tr>
                    <td><strong>Mobile app support</strong></td>
                    <td class="win">Universal — all authenticator apps</td>
                    <td class="draw">Supported but less common in mobile apps</td>
                </tr>
                <tr>
                    <td><strong>Hardware token use</strong></td>
                    <td class="draw">Possible but uncommon</td>
                    <td class="win">Traditional hardware token standard</td>
                </tr>
                <tr>
                    <td><strong>Brute-force surface</strong></td>
                    <td class="win">Small — code expires in seconds</td>
                    <td class="lose">Larger — especially with wide look-ahead windows</td>
                </tr>
            </tbody>
        </table>

        <h2 class="section">The otpauth:// URI Format</h2>
        <p>Both TOTP and HOTP use the same <code>otpauth://</code> URI scheme for QR code enrolment. The only difference is the scheme type:</p>
        <pre style="background:#1e2d3d;color:#a8d8f0;padding:16px 20px;border-radius:6px;font-size:13px;border:none;">
<span style="color:#6a9955">// TOTP</span>
otpauth://<strong>totp</strong>/MyApp:user@example.com?secret=JBSWY3DPEHPK3PXP&issuer=MyApp

<span style="color:#6a9955">// HOTP (note: also requires counter parameter)</span>
otpauth://<strong>hotp</strong>/MyApp:user@example.com?secret=JBSWY3DPEHPK3PXP&issuer=MyApp&counter=0</pre>

        <h2 class="section">Which Should You Use?</h2>

        <p><strong>For the vast majority of web and mobile applications, TOTP is the right choice.</strong> It is simpler to implement correctly (no counter state to manage), more secure (short-lived codes), and universally supported by all major authenticator apps. AuthenticatorAPI.com implements TOTP.</p>

        <p>HOTP has its place in specific scenarios:</p>
        <ul>
            <li><strong>Hardware tokens in air-gapped environments</strong> where the device has no reliable clock source</li>
            <li><strong>Printed one-time code sheets</strong> — a list of HOTP codes can be generated in advance and used sequentially</li>
            <li><strong>Very low-power devices</strong> that cannot maintain a real-time clock</li>
        </ul>

        <p>If you are building a new 2FA system for a standard web or mobile application, TOTP is the industry standard recommendation. All major security frameworks and guidelines (NIST 800-63, OWASP ASVS) support TOTP as a valid second factor for software authenticators.</p>

        <div class="info-box">&#127919; <strong>Bottom line:</strong> Unless you have a specific requirement for hardware tokens or offline counter-based OTP, choose TOTP. It is more secure, simpler to implement, and what your users expect.</div>

        <br><br>
    </div>

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
