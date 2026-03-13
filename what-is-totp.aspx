<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>What is TOTP? Time-based One-Time Passwords Explained | AuthenticatorAPI.com</title>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="A complete explanation of TOTP (Time-based One-Time Password) — how it works, the RFC 6238 algorithm, security properties, and how it compares to other 2FA methods.">
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

        .page-hero { background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%); color:#fff; padding:52px 0 44px; margin-bottom:40px; border-radius:6px; }
        .page-hero h1 { font-size:38px; font-weight:900; margin:0 0 12px; }
        .page-hero p { font-size:18px; opacity:.85; margin:0; font-weight:300; }

        h2.section { font-size:26px; font-weight:700; color:#2c3e50; border-bottom:3px solid #3498db; padding-bottom:8px; margin:44px 0 20px; }
        h3.sub { font-size:19px; font-weight:700; color:#2c3e50; margin:28px 0 12px; }
        p, li { font-size:15px; color:#444; line-height:1.8; }
        .lead { font-size:17px; color:#555; }

        .algorithm-box { background:#1e2d3d; color:#a8d8f0; border-radius:8px; padding:24px 28px; font-family:monospace; font-size:14px; line-height:1.9; margin:24px 0; }
        .algorithm-box .label { color:#6a9955; }
        .algorithm-box .val   { color:#ce9178; }
        .algorithm-box .op    { color:#569cd6; }

        .info-box { background:#eaf4fb; border-left:4px solid #3498db; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#1a5276; }
        .security-badge { display:inline-block; padding:3px 10px; border-radius:12px; font-size:12px; font-weight:700; margin-right:6px; }
        .badge-green { background:#d5f5e3; color:#1a6b3c; }
        .badge-red { background:#fdecea; color:#7b1a1a; }
        .badge-amber { background:#fef9e7; color:#7d5200; }

        .comparison-table { width:100%; border-collapse:collapse; margin:24px 0; font-size:14px; }
        .comparison-table th { background:#2c3e50; color:#fff; padding:12px 16px; text-align:left; }
        .comparison-table td { padding:11px 16px; border-bottom:1px solid #e0e6ed; vertical-align:top; }
        .comparison-table tr:nth-child(even) td { background:#f8fafc; }

        .totp-timeline { display:flex; align-items:stretch; gap:0; margin:24px 0; overflow-x:auto; }
        .totp-window { flex:1; min-width:80px; border:2px solid #3498db; text-align:center; padding:12px 6px; font-size:12px; font-weight:700; color:#2c3e50; position:relative; }
        .totp-window.current { background:#3498db; color:#fff; }
        .totp-window .win-label { font-size:10px; font-weight:400; opacity:.7; display:block; margin-top:4px; }

        .step-flow { display:flex; flex-wrap:wrap; gap:16px; margin:24px 0; }
        .flow-step { flex:1; min-width:140px; background:#f8fafc; border:1px solid #e0e6ed; border-radius:8px; padding:18px 16px; text-align:center; position:relative; }
        .flow-step .flow-num { width:28px; height:28px; border-radius:50%; background:#3498db; color:#fff; font-weight:900; font-size:13px; display:flex; align-items:center; justify-content:center; margin:0 auto 10px; }
        .flow-step p { font-size:13px; margin:0; color:#555; }
        .flow-arrow { display:flex; align-items:center; color:#3498db; font-size:22px; padding-top:18px; }
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
                <li><a href="/what-is-totp.aspx" class="active">What is TOTP?</a></li>
                <li><a href="/totp-vs-hotp.aspx">TOTP vs HOTP</a></li>
                <li><a href="/why-sms-2fa-is-insecure.aspx">Why SMS 2FA is Insecure</a></li>
                <li><a href="/faq.aspx">FAQ</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">

        <div class="page-hero text-center">
            <h1>What is TOTP?</h1>
            <p>A deep dive into Time-based One-Time Passwords — the algorithm behind Google Authenticator</p>
        </div>

        <p class="lead">TOTP stands for <strong>Time-based One-Time Password</strong>. It is an open standard — defined in <a href="https://datatracker.ietf.org/doc/html/rfc6238" target="_blank" rel="noopener">RFC 6238</a> — that generates short-lived numeric codes from a shared secret and the current time. It is the technology underpinning Google Authenticator, Authy, Microsoft Authenticator, 1Password, and virtually every other authenticator app in widespread use today.</p>

        <h2 class="section">The Core Idea</h2>
        <p>The fundamental insight of TOTP is elegant: if two parties share a secret and both have access to an accurate clock, they can independently compute the same value at the same moment in time — without any communication. This makes the code impossible to predict in advance and useless after its window expires.</p>

        <p>In practice, a user's phone and your server both know the same shared secret (established during setup by scanning a QR code). At login time, the phone and server both independently compute a 6-digit code from that secret and the current Unix timestamp. If the codes match, authentication succeeds — no network communication about the code itself is required, and an intercepted code is worthless within seconds.</p>

        <h2 class="section">How the Algorithm Works</h2>
        <p>The TOTP algorithm is built on top of <strong>HOTP</strong> (HMAC-based One-Time Password, <a href="https://datatracker.ietf.org/doc/html/rfc4226" target="_blank" rel="noopener">RFC 4226</a>), replacing a counter value with a time-derived counter. The steps are:</p>

        <div class="algorithm-box">
<span class="label">Step 1 — Derive a time counter (T):</span>
  <span class="val">T</span> = <span class="op">floor</span>( current_unix_timestamp / <span class="val">30</span> )
  <span class="label">// A new value every 30 seconds</span>

<span class="label">Step 2 — Compute an HMAC-SHA1 hash:</span>
  <span class="val">hmac</span> = <span class="op">HMAC-SHA1</span>( key=<span class="val">shared_secret</span>, message=<span class="op">int_to_8_bytes</span>(<span class="val">T</span>) )
  <span class="label">// 20-byte hash output</span>

<span class="label">Step 3 — Dynamic truncation:</span>
  <span class="val">offset</span> = <span class="val">hmac</span>[<span class="val">19</span>] &amp; <span class="val">0x0F</span>
  <span class="val">code</span>   = ( <span class="val">hmac</span>[<span class="val">offset</span>] &amp; <span class="val">0x7F</span> ) &lt;&lt; <span class="val">24</span>
           | <span class="val">hmac</span>[<span class="val">offset+1</span>] &lt;&lt; <span class="val">16</span>
           | <span class="val">hmac</span>[<span class="val">offset+2</span>] &lt;&lt; <span class="val">8</span>
           | <span class="val">hmac</span>[<span class="val">offset+3</span>]

<span class="label">Step 4 — Extract 6 digits:</span>
  <span class="val">totp</span> = <span class="val">code</span> % <span class="val">1_000_000</span>   <span class="label">→ zero-pad to 6 digits</span>
        </div>

        <div class="info-box">&#128161; The key point: <strong>both the phone and the server run exactly these steps independently</strong>. If the shared secret is the same and their clocks agree, they will produce the same 6-digit output — always.</div>

        <h2 class="section">The 30-Second Window</h2>
        <p>By dividing the Unix timestamp by 30, TOTP creates a rolling "window" — a slot of time during which a particular code is valid. Each window boundary generates a completely different code.</p>

        <div class="totp-timeline">
            <div class="totp-window"><strong>482610</strong><span class="win-label">T−2</span></div>
            <div class="totp-window"><strong>731905</strong><span class="win-label">T−1</span></div>
            <div class="totp-window current"><strong>294817</strong><span class="win-label">NOW ← valid</span></div>
            <div class="totp-window"><strong>563042</strong><span class="win-label">T+1</span></div>
            <div class="totp-window"><strong>018374</strong><span class="win-label">T+2</span></div>
        </div>

        <p>To tolerate minor clock drift between devices, implementations typically accept the code from one window either side of the current one — meaning a code is effectively valid for up to 90 seconds in practice. This behaviour is specified in RFC 6238 and is configurable.</p>

        <h2 class="section">The Enrolment Flow</h2>
        <p>Before TOTP can be used for authentication, the server and the user's device must share a secret. This happens during a one-time enrolment step:</p>

        <div class="step-flow">
            <div class="flow-step"><div class="flow-num">1</div><p>Server generates a random Base32 secret and stores it (encrypted) against the user's account</p></div>
            <div class="flow-arrow">&#8594;</div>
            <div class="flow-step"><div class="flow-num">2</div><p>Server encodes the secret in a QR code and displays it to the user</p></div>
            <div class="flow-arrow">&#8594;</div>
            <div class="flow-step"><div class="flow-num">3</div><p>User scans the QR code with their authenticator app — the secret is now stored on the device</p></div>
            <div class="flow-arrow">&#8594;</div>
            <div class="flow-step"><div class="flow-num">4</div><p>User enters the first code to confirm successful enrolment</p></div>
        </div>

        <p>From this point on, the secret lives in two places only: your encrypted database and the user's phone. It is never transmitted again during authentication — only the derived code is sent.</p>

        <h2 class="section">The QR Code Format</h2>
        <p>Authenticator apps read secrets via a standardised URI format called <code>otpauth://</code>. The QR code displayed during enrolment encodes a URI like this:</p>
        <pre style="background:#1e2d3d;color:#a8d8f0;padding:16px 20px;border-radius:6px;font-size:13px;border:none;">otpauth://totp/MyApp:user@example.com?secret=JBSWY3DPEHPK3PXP&issuer=MyApp</pre>
        <p>The components are:</p>
        <ul>
            <li><strong>totp</strong> — indicates this is a TOTP (time-based) credential, not HOTP (counter-based)</li>
            <li><strong>MyApp:user@example.com</strong> — the label shown in the authenticator app</li>
            <li><strong>secret=...</strong> — the Base32-encoded shared secret</li>
            <li><strong>issuer=...</strong> — the organisation or application name (shown in the app)</li>
        </ul>

        <h2 class="section">Security Properties</h2>
        <table class="comparison-table">
            <thead>
                <tr><th>Property</th><th>TOTP</th><th>Why it matters</th></tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>Short-lived codes</strong></td>
                    <td><span class="security-badge badge-green">&#10003; Strong</span></td>
                    <td>Each code expires in 30 seconds, rendering phished codes worthless almost immediately</td>
                </tr>
                <tr>
                    <td><strong>Replay resistance</strong></td>
                    <td><span class="security-badge badge-green">&#10003; Strong</span></td>
                    <td>A code intercepted in transit cannot be reused after its window expires</td>
                </tr>
                <tr>
                    <td><strong>Secret never transmitted at login</strong></td>
                    <td><span class="security-badge badge-green">&#10003; Strong</span></td>
                    <td>Only the derived code travels over the network — the underlying secret stays on device and server</td>
                </tr>
                <tr>
                    <td><strong>Works offline</strong></td>
                    <td><span class="security-badge badge-green">&#10003; Strong</span></td>
                    <td>The device generates codes without any network connectivity</td>
                </tr>
                <tr>
                    <td><strong>Open standard</strong></td>
                    <td><span class="security-badge badge-green">&#10003; Strong</span></td>
                    <td>RFC 6238 is publicly audited; no proprietary black boxes</td>
                </tr>
                <tr>
                    <td><strong>Phishing resistance</strong></td>
                    <td><span class="security-badge badge-amber">&#9888; Moderate</span></td>
                    <td>Better than SMS but not as strong as hardware keys (FIDO2/WebAuthn) — a real-time phishing proxy can relay a valid code within its window</td>
                </tr>
                <tr>
                    <td><strong>Device loss</strong></td>
                    <td><span class="security-badge badge-amber">&#9888; Plan required</span></td>
                    <td>If the user loses their phone, recovery codes or an admin reset process are needed</td>
                </tr>
            </tbody>
        </table>

        <h2 class="section">TOTP vs SMS One-Time Codes</h2>
        <p>SMS-based one-time codes work on a similar principle but are fundamentally less secure because:</p>
        <ul>
            <li><strong>SIM swapping:</strong> Attackers can socially engineer mobile carriers into transferring a victim's number to an attacker-controlled SIM, receiving all future SMS messages.</li>
            <li><strong>SS7 attacks:</strong> The global phone network's Signalling System 7 protocol has known vulnerabilities that allow sophisticated actors to intercept SMS messages in transit.</li>
            <li><strong>Malware interception:</strong> SMS messages delivered to an infected phone can be read by malware before the legitimate user sees them.</li>
            <li><strong>No offline operation:</strong> SMS requires a live mobile signal; authenticator apps work anywhere including underground or in airplane mode.</li>
        </ul>
        <p>For all these reasons, security guidelines from NIST, the UK NCSC, and major cloud providers now recommend app-based TOTP over SMS wherever possible.</p>

        <h2 class="section">TOTP vs Hardware Keys (FIDO2/WebAuthn)</h2>
        <p>Hardware security keys such as YubiKeys use the FIDO2/WebAuthn standard and provide stronger phishing resistance than TOTP, because the cryptographic challenge is bound to the specific origin (domain) of the site being logged into. A phishing site on a different domain cannot extract a valid credential even if the user is fooled into entering their password there.</p>
        <p>However, TOTP remains the most practical second factor for most applications: it requires no hardware purchase, works across all devices, and is universally supported by end users who already have a smartphone.</p>

        <h2 class="section">Implementing TOTP Without a Library</h2>
        <p>Because TOTP is built on standard cryptographic primitives (HMAC-SHA1) and simple integer arithmetic, it is straightforward to implement natively in any programming language. You don't need a dedicated TOTP library — you just need:</p>
        <ul>
            <li>A Base32 decoder (to decode the shared secret from QR format)</li>
            <li>An HMAC-SHA1 implementation (available in every language's standard library)</li>
            <li>Access to the current Unix timestamp</li>
            <li>Basic integer bit operations</li>
        </ul>
        <p>Alternatively, <a href="/">AuthenticatorAPI.com</a> handles all of this for you — just call the Validate endpoint with the PIN and your secret, and receive a simple <code>true</code> or <code>false</code> response.</p>

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
