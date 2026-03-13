<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Add Google Authenticator 2FA to JavaScript / Node.js | AuthenticatorAPI.com</title>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Step-by-step guide to integrating Google Authenticator two-factor authentication into a Node.js or JavaScript application using AuthenticatorAPI.com.">
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

        .page-hero { background: linear-gradient(135deg, #b8520a 0%, #f0a500 100%); color:#fff; padding:52px 0 44px; margin-bottom:40px; border-radius:6px; }
        .page-hero .lang-badge { display:inline-block; background:rgba(255,255,255,.2); border-radius:30px; padding:4px 16px; font-size:13px; font-weight:700; letter-spacing:.06em; margin-bottom:14px; }
        .page-hero h1 { font-size:36px; font-weight:900; margin:0 0 10px; }
        .page-hero p { font-size:18px; opacity:.85; margin:0; font-weight:300; }

        .step-block { border-left:4px solid #f0a500; padding:0 0 32px 28px; position:relative; margin-top:8px; }
        .step-block:last-child { border-left-color:transparent; }
        .step-num { position:absolute; left:-18px; top:0; width:32px; height:32px; border-radius:50%; background:#b8520a; color:#fff; font-weight:900; font-size:14px; display:flex; align-items:center; justify-content:center; }
        .step-block h3 { font-size:19px; font-weight:700; color:#2c3e50; margin:0 0 12px; }
        .step-block p, .step-block ul { font-size:15px; color:#444; line-height:1.75; }

        pre.code-block { background:#1e2d3d; color:#a8d8f0; padding:20px 24px; border-radius:6px; font-size:13px; border:none; overflow-x:auto; line-height:1.7; }
        pre.code-block .cm  { color:#6a9955; }
        pre.code-block .kw  { color:#569cd6; }
        pre.code-block .st  { color:#ce9178; }
        pre.code-block .fn  { color:#dcdcaa; }
        pre.code-block .vr  { color:#9cdcfe; }
        pre.code-block .dc  { color:#4ec9b0; }

        .section-heading { font-size:24px; font-weight:700; color:#2c3e50; border-bottom:3px solid #f0a500; padding-bottom:8px; margin:40px 0 24px; }
        .info-box { background:#fff8e1; border-left:4px solid #f0a500; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#7d5200; }
        .warn-box { background:#fef9e7; border-left:4px solid #f39c12; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#7d6608; }
        .lang-nav { display:flex; gap:10px; flex-wrap:wrap; margin-bottom:36px; }
        .lang-nav a { display:inline-block; padding:8px 18px; border-radius:4px; border:2px solid #e0e0e0; font-size:13px; font-weight:700; text-decoration:none; color:#555; transition:all .2s; }
        .lang-nav a:hover { border-color:#b8520a; color:#b8520a; }
        .tab-switcher { display:flex; gap:0; margin-bottom:0; border-bottom:2px solid #e0e0e0; }
        .tab-switcher button { background:none; border:none; padding:10px 22px; font-size:14px; font-weight:700; color:#888; cursor:pointer; border-bottom:3px solid transparent; margin-bottom:-2px; }
        .tab-switcher button.active { color:#b8520a; border-bottom-color:#b8520a; }
        .tab-content-block { display:none; }
        .tab-content-block.active { display:block; }
    </style>
</head>
<body>

    <nav class="site-nav">
        <div class="container">
            <ul>
                <li><a href="/">&#127968; Home</a></li>
                <li class="dropdown">
                    <a href="#" class="active">Integration Guides &#9660;</a>
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
                <li><a href="/faq.aspx">FAQ</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">

        <div class="page-hero text-center">
            <div class="lang-badge">JavaScript / Node.js</div>
            <h1>Add 2FA to Your Node.js App</h1>
            <p>A complete guide to integrating Google Authenticator using AuthenticatorAPI.com</p>
        </div>

        <div class="lang-nav">
            <span style="line-height:36px;font-size:13px;font-weight:700;color:#888;">Also available in:</span>
            <a href="/integrate-2fa-php.aspx">PHP</a>
            <a href="/integrate-2fa-python.aspx">Python</a>
            <a href="/integrate-2fa-csharp.aspx">C#</a>
            <a href="/integrate-2fa-java.aspx">Java</a>
        </div>

        <p class="lead text-muted">This guide covers adding Google Authenticator TOTP two-factor authentication to Node.js applications — from a minimal Express server to a full Next.js or NestJS project. No npm packages required beyond Node's built-in <code>crypto</code> module and the standard <code>fetch</code> API (Node 18+).</p>

        <div class="info-box">&#128073; <strong>Prerequisites:</strong> Node.js 18+ (for native <code>fetch</code>). For older Node, use the <code>node-fetch</code> package. A database (PostgreSQL, MongoDB, etc.) to store per-user secrets.</div>

        <div class="tab-switcher" style="margin-top:30px;">
            <button class="active" onclick="switchTab('express', this)">Express.js</button>
            <button onclick="switchTab('nextjs', this)">Next.js (App Router)</button>
        </div>

        <div class="section-heading">Step-by-Step Integration</div>

        <div id="tab-express" class="tab-content-block active">

            <div class="step-block">
                <div class="step-num">1</div>
                <h3>Create a TOTP Utility Module</h3>
                <pre class="code-block"><span class="cm">// lib/totp.js</span>
<span class="st">'use strict'</span>;
<span class="kw">const</span> { randomBytes } = require(<span class="st">'crypto'</span>);

<span class="kw">const</span> BASE32_ALPHABET = <span class="st">'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'</span>;
<span class="kw">const</span> API_BASE = <span class="st">'https://www.authenticatorApi.com'</span>;

<span class="cm">/**
 * Generates a cryptographically random 32-character Base32 secret.
 */</span>
<span class="kw">function</span> <span class="fn">generateSecret</span>(length = <span class="st">32</span>) {
  <span class="kw">const</span> bytes = <span class="fn">randomBytes</span>(length);
  <span class="kw">return</span> Array.from(bytes, b => BASE32_ALPHABET[b % <span class="st">32</span>]).join(<span class="st">''</span>);
}

<span class="cm">/**
 * Returns the HTML img tag for the QR code setup page.
 */</span>
<span class="kw">async function</span> <span class="fn">getQrCodeHtml</span>(appName, userInfo, secret) {
  <span class="kw">const</span> params = <span class="kw">new</span> <span class="fn">URLSearchParams</span>({ AppName: appName, AppInfo: userInfo, SecretCode: secret });
  <span class="kw">const</span> res = <span class="kw">await</span> <span class="fn">fetch</span>(<span class="vr">`${API_BASE}/pair.aspx?${params}`</span>);
  <span class="kw">if</span> (!res.ok) <span class="kw">throw new</span> <span class="fn">Error</span>(<span class="vr">`Pair API error: ${res.status}`</span>);
  <span class="kw">return</span> res.<span class="fn">text</span>();
}

<span class="cm">/**
 * Returns true if the 6-digit pin is valid for the given secret.
 */</span>
<span class="kw">async function</span> <span class="fn">validatePin</span>(pin, secret) {
  <span class="kw">if</span> (!/^\d{6}$/.test(pin)) <span class="kw">return false</span>;
  <span class="kw">const</span> params = <span class="kw">new</span> <span class="fn">URLSearchParams</span>({ Pin: pin, SecretCode: secret });
  <span class="kw">const</span> res = <span class="kw">await</span> <span class="fn">fetch</span>(<span class="vr">`${API_BASE}/Validate.aspx?${params}`</span>);
  <span class="kw">if</span> (!res.ok) <span class="kw">throw new</span> <span class="fn">Error</span>(<span class="vr">`Validate API error: ${res.status}`</span>);
  <span class="kw">const</span> text = <span class="kw">await</span> res.<span class="fn">text</span>();
  <span class="kw">return</span> text.<span class="fn">trim</span>().<span class="fn">toLowerCase</span>() === <span class="st">'true'</span>;
}

module.exports = { generateSecret, getQrCodeHtml, validatePin };</pre>
            </div>

            <div class="step-block">
                <div class="step-num">2</div>
                <h3>Enrolment Route</h3>
                <pre class="code-block"><span class="cm">// routes/2fa.js</span>
<span class="kw">const</span> express = require(<span class="st">'express'</span>);
<span class="kw">const</span> router  = express.<span class="fn">Router</span>();
<span class="kw">const</span> totp    = require(<span class="st">'../lib/totp'</span>);
<span class="kw">const</span> db      = require(<span class="st">'../lib/db'</span>);

<span class="cm">// GET /2fa/setup — show the QR code</span>
router.<span class="fn">get</span>(<span class="st">'/setup'</span>, <span class="kw">async</span> (req, res) => {
  <span class="kw">const</span> secret = totp.<span class="fn">generateSecret</span>();
  req.session.pending2FASecret = secret;  <span class="cm">// store until confirmed</span>

  <span class="kw">const</span> qrHtml = <span class="kw">await</span> totp.<span class="fn">getQrCodeHtml</span>(<span class="st">'MyApp'</span>, req.user.email, secret);
  res.<span class="fn">render</span>(<span class="st">'2fa-setup'</span>, { qrHtml, secret });
});

<span class="cm">// POST /2fa/setup — confirm the user has scanned correctly</span>
router.<span class="fn">post</span>(<span class="st">'/setup'</span>, <span class="kw">async</span> (req, res) => {
  <span class="kw">const</span> { pin } = req.body;
  <span class="kw">const</span> secret  = req.session.pending2FASecret;

  <span class="kw">if</span> (<span class="kw">await</span> totp.<span class="fn">validatePin</span>(pin, secret)) {
    <span class="kw">await</span> db.<span class="fn">saveEncryptedSecret</span>(req.user.id, secret);
    <span class="kw">delete</span> req.session.pending2FASecret;
    res.<span class="fn">redirect</span>(<span class="st">'/dashboard'</span>);
  } <span class="kw">else</span> {
    res.<span class="fn">render</span>(<span class="st">'2fa-setup'</span>, { error: <span class="st">'Invalid code, please try again.'</span>, qrHtml: <span class="kw">await</span> totp.<span class="fn">getQrCodeHtml</span>(<span class="st">'MyApp'</span>, req.user.email, secret), secret });
  }
});

<span class="cm">// POST /2fa/verify — called at login time</span>
router.<span class="fn">post</span>(<span class="st">'/verify'</span>, <span class="kw">async</span> (req, res) => {
  <span class="kw">const</span> { pin } = req.body;
  <span class="kw">const</span> secret  = <span class="kw">await</span> db.<span class="fn">getDecryptedSecret</span>(req.user.id);

  <span class="kw">if</span> (<span class="kw">await</span> totp.<span class="fn">validatePin</span>(pin, secret)) {
    req.session.twoFactorVerified = <span class="kw">true</span>;
    res.<span class="fn">redirect</span>(<span class="st">'/dashboard'</span>);
  } <span class="kw">else</span> {
    res.<span class="fn">render</span>(<span class="st">'2fa-verify'</span>, { error: <span class="st">'Invalid code, please try again.'</span> });
  }
});

module.exports = router;</pre>
            </div>

            <div class="step-block">
                <div class="step-num">3</div>
                <h3>Middleware to Enforce 2FA</h3>
                <pre class="code-block"><span class="cm">// middleware/require2fa.js</span>
<span class="kw">module.exports = async function</span> <span class="fn">require2fa</span>(req, res, next) {
  <span class="kw">if</span> (!req.user) <span class="kw">return</span> res.<span class="fn">redirect</span>(<span class="st">'/login'</span>);

  <span class="kw">const</span> has2fa = <span class="kw">await</span> db.<span class="fn">userHas2FA</span>(req.user.id);
  <span class="kw">if</span> (has2fa &amp;&amp; !req.session.twoFactorVerified) {
    <span class="kw">return</span> res.<span class="fn">redirect</span>(<span class="st">'/2fa/verify'</span>);
  }
  <span class="fn">next</span>();
};

<span class="cm">// In your router:</span>
<span class="kw">const</span> require2fa = require(<span class="st">'./middleware/require2fa'</span>);
app.<span class="fn">use</span>(<span class="st">'/dashboard'</span>, require2fa, dashboardRouter);
app.<span class="fn">use</span>(<span class="st">'/settings'</span>,  require2fa, settingsRouter);</pre>
            </div>

        </div><!-- /tab-express -->

        <div id="tab-nextjs" class="tab-content-block">

            <div class="step-block">
                <div class="step-num">1</div>
                <h3>Server Action: Generate &amp; Fetch QR Code</h3>
                <pre class="code-block"><span class="cm">// app/actions/totp.ts</span>
<span class="st">'use server'</span>;
<span class="kw">import</span> { randomBytes } from <span class="st">'crypto'</span>;
<span class="kw">import</span> { cookies } from <span class="st">'next/headers'</span>;

<span class="kw">const</span> BASE32 = <span class="st">'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'</span>;

<span class="kw">export function</span> <span class="fn">generateSecret</span>(length = <span class="st">32</span>): <span class="dc">string</span> {
  <span class="kw">const</span> bytes = <span class="fn">randomBytes</span>(length);
  <span class="kw">return</span> Array.from(bytes, b => BASE32[b % <span class="st">32</span>]).join(<span class="st">''</span>);
}

<span class="kw">export async function</span> <span class="fn">fetchQrHtml</span>(appName: <span class="dc">string</span>, email: <span class="dc">string</span>, secret: <span class="dc">string</span>) {
  <span class="kw">const</span> params = <span class="kw">new</span> <span class="fn">URLSearchParams</span>({ AppName: appName, AppInfo: email, SecretCode: secret });
  <span class="kw">const</span> res = <span class="kw">await</span> <span class="fn">fetch</span>(<span class="vr">`https://www.authenticatorApi.com/pair.aspx?${params}`</span>, { cache: <span class="st">'no-store'</span> });
  <span class="kw">return</span> res.<span class="fn">text</span>();
}

<span class="kw">export async function</span> <span class="fn">verifyPin</span>(pin: <span class="dc">string</span>, secret: <span class="dc">string</span>): <span class="dc">Promise</span>&lt;<span class="dc">boolean</span>&gt; {
  <span class="kw">if</span> (!/^\d{6}$/.test(pin)) <span class="kw">return false</span>;
  <span class="kw">const</span> params = <span class="kw">new</span> <span class="fn">URLSearchParams</span>({ Pin: pin, SecretCode: secret });
  <span class="kw">const</span> res = <span class="kw">await</span> <span class="fn">fetch</span>(<span class="vr">`https://www.authenticatorApi.com/Validate.aspx?${params}`</span>, { cache: <span class="st">'no-store'</span> });
  <span class="kw">return</span> (await res.<span class="fn">text</span>()).<span class="fn">trim</span>().<span class="fn">toLowerCase</span>() === <span class="st">'true'</span>;
}</pre>
            </div>

            <div class="step-block">
                <div class="step-num">2</div>
                <h3>Setup Page Route Handler</h3>
                <pre class="code-block"><span class="cm">// app/settings/2fa/page.tsx</span>
<span class="kw">import</span> { generateSecret, fetchQrHtml } from <span class="st">'@/app/actions/totp'</span>;
<span class="kw">import</span> TwoFaSetupForm from <span class="st">'@/components/TwoFaSetupForm'</span>;

<span class="kw">export default async function</span> <span class="fn">TwoFaSetupPage</span>() {
  <span class="kw">const</span> secret = <span class="fn">generateSecret</span>();
  <span class="kw">const</span> qrHtml = <span class="kw">await</span> <span class="fn">fetchQrHtml</span>(<span class="st">'MyApp'</span>, <span class="st">'user@example.com'</span>, secret);

  <span class="kw">return</span> (
    &lt;div&gt;
      &lt;h1&gt;Set Up Two-Factor Authentication&lt;/h1&gt;
      &lt;div dangerouslySetInnerHTML={{ __html: qrHtml }} /&gt;
      &lt;p&gt;Manual key: &lt;code&gt;{secret}&lt;/code&gt;&lt;/p&gt;
      &lt;<span class="fn">TwoFaSetupForm</span> secret={secret} /&gt;
    &lt;/div&gt;
  );
}</pre>
            </div>

        </div><!-- /tab-nextjs -->

        <div class="section-heading">Security Checklist for Node.js</div>
        <ul style="font-size:15px;line-height:2;color:#444;">
            <li>&#9989; Use <code>crypto.randomBytes()</code> — never <code>Math.random()</code></li>
            <li>&#9989; Encrypt secrets at rest before storing in your database</li>
            <li>&#9989; Never call the TOTP API from client-side code — always server-side only</li>
            <li>&#9989; Rate-limit the <code>/2fa/verify</code> route with <code>express-rate-limit</code></li>
            <li>&#9989; Rotate the session after successful 2FA (<code>req.session.regenerate()</code>)</li>
            <li>&#9989; Use <code>helmet</code> and HTTPS in production</li>
            <li>&#9989; Provide backup recovery codes for users who lose their device</li>
        </ul>
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
    <script>
        function switchTab(tab, btn) {
            document.querySelectorAll('.tab-content-block').forEach(el => el.classList.remove('active'));
            document.querySelectorAll('.tab-switcher button').forEach(el => el.classList.remove('active'));
            document.getElementById('tab-' + tab).classList.add('active');
            btn.classList.add('active');
        }
    </script>
</body>
</html>
