<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Add Google Authenticator 2FA to PHP | AuthenticatorAPI.com</title>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Step-by-step guide to integrating Google Authenticator two-factor authentication (2FA) into a PHP application using AuthenticatorAPI.com.">
    <meta name="author" content="Infinite Loop Development Ltd">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="Techie.css" rel="stylesheet">
    <style>
        body, html { overflow-x: hidden; }
        body { padding: 60px 20px 0; font-family: 'Lato', sans-serif; }
        footer { border-top: 1px solid #ddd; padding: 30px; margin-top: 50px; }

        .site-nav { background:#2c3e50; padding: 0; margin-bottom: 36px; }
        .site-nav ul { list-style:none; margin:0; padding:0; display:flex; flex-wrap:wrap; }
        .site-nav ul li a { display:block; padding:14px 18px; color:#cdd6e0; font-size:13px; font-weight:700; text-decoration:none; letter-spacing:.04em; text-transform:uppercase; transition:background .2s,color .2s; }
        .site-nav ul li a:hover, .site-nav ul li a.active { background:#1a252f; color:#fff; }
        .site-nav .dropdown { position:relative; }
        .site-nav .dropdown-menu { display:none; position:absolute; top:100%; left:0; background:#1a252f; min-width:200px; padding:6px 0; z-index:200; list-style:none; margin:0; border:none; border-radius:0 0 4px 4px; }
        .site-nav .dropdown-menu li a { padding:10px 18px; font-size:13px; }
        .site-nav .dropdown:hover .dropdown-menu { display:block; }

        .page-hero { background: linear-gradient(135deg, #4f3ba9 0%, #7e57c2 100%); color:#fff; padding: 52px 0 44px; margin-bottom: 40px; border-radius: 6px; }
        .page-hero .lang-badge { display:inline-block; background:rgba(255,255,255,.2); border-radius:30px; padding:4px 16px; font-size:13px; font-weight:700; letter-spacing:.06em; margin-bottom:14px; }
        .page-hero h1 { font-size: 36px; font-weight: 900; margin:0 0 10px; }
        .page-hero p { font-size: 18px; opacity:.85; margin:0; font-weight:300; }

        .step-block { border-left: 4px solid #7e57c2; padding: 0 0 32px 28px; position:relative; margin-top:8px; }
        .step-block:last-child { border-left-color: transparent; }
        .step-num { position:absolute; left:-18px; top:0; width:32px; height:32px; border-radius:50%; background:#7e57c2; color:#fff; font-weight:900; font-size:14px; display:flex; align-items:center; justify-content:center; }
        .step-block h3 { font-size:19px; font-weight:700; color:#2c3e50; margin:0 0 12px; }
        .step-block p, .step-block ul { font-size:15px; color:#444; line-height:1.75; }

        pre.code-block { background:#1e2d3d; color:#a8d8f0; padding:20px 24px; border-radius:6px; font-size:13px; border:none; overflow-x:auto; line-height:1.7; }
        pre.code-block .cm  { color:#6a9955; }
        pre.code-block .kw  { color:#569cd6; }
        pre.code-block .st  { color:#ce9178; }
        pre.code-block .fn  { color:#dcdcaa; }
        pre.code-block .vr  { color:#9cdcfe; }

        .section-heading { font-size:24px; font-weight:700; color:#2c3e50; border-bottom:3px solid #7e57c2; padding-bottom:8px; margin:40px 0 24px; }
        .info-box { background:#f3eeff; border-left:4px solid #7e57c2; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#4a3580; }
        .warn-box { background:#fef9e7; border-left:4px solid #f39c12; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#7d6608; }
        .lang-nav { display:flex; gap:10px; flex-wrap:wrap; margin-bottom:36px; }
        .lang-nav a { display:inline-block; padding:8px 18px; border-radius:4px; border:2px solid #e0e0e0; font-size:13px; font-weight:700; text-decoration:none; color:#555; transition:all .2s; }
        .lang-nav a:hover { border-color:#7e57c2; color:#7e57c2; }
        .lang-nav a.active { border-color:#7e57c2; background:#7e57c2; color:#fff; }
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
            <div class="lang-badge">PHP</div>
            <h1>Add 2FA to Your PHP App</h1>
            <p>A complete guide to integrating Google Authenticator using AuthenticatorAPI.com</p>
        </div>

        <!-- Language switcher -->
        <div class="lang-nav">
            <span style="line-height:36px;font-size:13px;font-weight:700;color:#888;">Also available in:</span>
            <a href="/integrate-2fa-python.aspx">Python</a>
            <a href="/integrate-2fa-csharp.aspx">C#</a>
            <a href="/integrate-2fa-javascript.aspx">JavaScript</a>
            <a href="/integrate-2fa-java.aspx">Java</a>
        </div>

        <p class="lead text-muted">This guide walks through adding Google Authenticator-compatible two-factor authentication to any PHP application — from a simple login form to a full Laravel or Symfony project. No libraries to install. No Composer packages required. Just PHP and HTTP.</p>

        <div class="info-box">&#128073; <strong>Prerequisites:</strong> PHP 7.1 or later with the <code>curl</code> extension enabled (standard on most hosts). A MySQL or similar database to store user secret codes.</div>

        <!-- Steps -->
        <div class="section-heading">Step-by-Step Integration</div>

        <div class="step-block">
            <div class="step-num">1</div>
            <h3>Generate a Secret Code for Each User</h3>
            <p>When a user enables 2FA, generate a cryptographically random Base32-encoded secret and store it against their account in your database. The secret should be at least 16 characters of Base32 (A–Z and 2–7).</p>
            <pre class="code-block"><span class="cm">// Generate a random Base32 secret (160-bit)</span>
<span class="kw">function</span> <span class="fn">generate_2fa_secret</span>(): <span class="vr">string</span> {
    <span class="vr">$base32Chars</span> = <span class="st">'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'</span>;
    <span class="vr">$secret</span> = <span class="st">''</span>;
    <span class="kw">for</span> (<span class="vr">$i</span> = <span class="st">0</span>; <span class="vr">$i</span> &lt; <span class="st">32</span>; <span class="vr">$i</span>++) {
        <span class="vr">$secret</span> .= <span class="vr">$base32Chars</span>[<span class="fn">random_int</span>(<span class="st">0</span>, <span class="st">31</span>)];
    }
    <span class="kw">return</span> <span class="vr">$secret</span>;
}

<span class="vr">$secret</span> = <span class="fn">generate_2fa_secret</span>();
<span class="cm">// Example: 'JBSWY3DPEHPK3PXPJBSWY3DPEHPK3PXP'</span>

<span class="cm">// Store encrypted in your database</span>
<span class="vr">$encryptedSecret</span> = <span class="fn">openssl_encrypt</span>(<span class="vr">$secret</span>, <span class="st">'AES-256-CBC'</span>, <span class="vr">$_ENV</span>[<span class="st">'ENCRYPTION_KEY'</span>], <span class="st">0</span>, <span class="vr">$iv</span>);
<span class="cm">// Save $encryptedSecret and $iv to your users table</span></pre>
        </div>

        <div class="step-block">
            <div class="step-num">2</div>
            <h3>Display the QR Code to the User</h3>
            <p>Call the Pair endpoint and embed the returned QR code image in your 2FA setup page. The user will scan this with their Google Authenticator app.</p>
            <pre class="code-block"><span class="kw">function</span> <span class="fn">get_qr_code_html</span>(<span class="vr">string</span> <span class="vr">$appName</span>, <span class="vr">string</span> <span class="vr">$userEmail</span>, <span class="vr">string</span> <span class="vr">$secret</span>): <span class="vr">string</span> {
    <span class="vr">$url</span> = <span class="st">'https://www.authenticatorApi.com/pair.aspx?'</span> . <span class="fn">http_build_query</span>([
        <span class="st">'AppName'</span>    =&gt; <span class="vr">$appName</span>,
        <span class="st">'AppInfo'</span>    =&gt; <span class="vr">$userEmail</span>,
        <span class="st">'SecretCode'</span> =&gt; <span class="vr">$secret</span>,
    ]);

    <span class="vr">$ch</span> = <span class="fn">curl_init</span>(<span class="vr">$url</span>);
    <span class="fn">curl_setopt_array</span>(<span class="vr">$ch</span>, [
        CURLOPT_RETURNTRANSFER =&gt; <span class="kw">true</span>,
        CURLOPT_TIMEOUT        =&gt; <span class="st">10</span>,
        CURLOPT_SSL_VERIFYPEER =&gt; <span class="kw">true</span>,
    ]);
    <span class="vr">$html</span> = <span class="fn">curl_exec</span>(<span class="vr">$ch</span>);
    <span class="fn">curl_close</span>(<span class="vr">$ch</span>);

    <span class="kw">return</span> <span class="vr">$html</span>; <span class="cm">// Returns an &lt;img&gt; tag with the QR code</span>
}

<span class="cm">// In your setup page template:</span>
<span class="kw">echo</span> <span class="fn">get_qr_code_html</span>(<span class="st">'MyApp'</span>, <span class="vr">$_SESSION</span>[<span class="st">'user_email'</span>], <span class="vr">$secret</span>);</pre>
            <div class="info-box">&#128247; Display the QR code alongside the raw secret text so users who cannot scan a QR code can enter the key manually in their authenticator app.</div>
        </div>

        <div class="step-block">
            <div class="step-num">3</div>
            <h3>Verify the PIN During Login</h3>
            <p>After the user enters their password, prompt them for the 6-digit code from their app. Validate it against the stored secret using the Validate endpoint.</p>
            <pre class="code-block"><span class="kw">function</span> <span class="fn">validate_totp_pin</span>(<span class="vr">string</span> <span class="vr">$pin</span>, <span class="vr">string</span> <span class="vr">$secret</span>): <span class="vr">bool</span> {
    <span class="cm">// Basic input sanity check</span>
    <span class="kw">if</span> (!<span class="fn">ctype_digit</span>(<span class="vr">$pin</span>) || <span class="fn">strlen</span>(<span class="vr">$pin</span>) !== <span class="st">6</span>) {
        <span class="kw">return false</span>;
    }

    <span class="vr">$url</span> = <span class="st">'https://www.authenticatorApi.com/Validate.aspx?'</span> . <span class="fn">http_build_query</span>([
        <span class="st">'Pin'</span>        =&gt; <span class="vr">$pin</span>,
        <span class="st">'SecretCode'</span> =&gt; <span class="vr">$secret</span>,
    ]);

    <span class="vr">$ch</span> = <span class="fn">curl_init</span>(<span class="vr">$url</span>);
    <span class="fn">curl_setopt_array</span>(<span class="vr">$ch</span>, [
        CURLOPT_RETURNTRANSFER =&gt; <span class="kw">true</span>,
        CURLOPT_TIMEOUT        =&gt; <span class="st">10</span>,
        CURLOPT_SSL_VERIFYPEER =&gt; <span class="kw">true</span>,
    ]);
    <span class="vr">$response</span> = <span class="fn">trim</span>(<span class="fn">curl_exec</span>(<span class="vr">$ch</span>));
    <span class="fn">curl_close</span>(<span class="vr">$ch</span>);

    <span class="kw">return</span> <span class="fn">strcasecmp</span>(<span class="vr">$response</span>, <span class="st">'true'</span>) === <span class="st">0</span>;
}

<span class="cm">// In your login handler:</span>
<span class="vr">$pin</span>    = <span class="vr">$_POST</span>[<span class="st">'totp_pin'</span>] ?? <span class="st">''</span>;
<span class="vr">$secret</span> = <span class="fn">get_user_secret</span>(<span class="vr">$_SESSION</span>[<span class="st">'user_id'</span>]); <span class="cm">// fetch & decrypt from DB</span>

<span class="kw">if</span> (<span class="fn">validate_totp_pin</span>(<span class="vr">$pin</span>, <span class="vr">$secret</span>)) {
    <span class="vr">$_SESSION</span>[<span class="st">'2fa_verified'</span>] = <span class="kw">true</span>;
    <span class="fn">header</span>(<span class="st">'Location: /dashboard'</span>);
} <span class="kw">else</span> {
    <span class="vr">$error</span> = <span class="st">'Invalid code. Please try again.'</span>;
}</pre>
        </div>

        <div class="step-block">
            <div class="step-num">4</div>
            <h3>Protect Your Routes</h3>
            <p>Add a middleware-style check to all pages that require full authentication. A user must have passed both their password and their TOTP check.</p>
            <pre class="code-block"><span class="cm">// auth_check.php — include at the top of protected pages</span>
<span class="fn">session_start</span>();

<span class="kw">if</span> (empty(<span class="vr">$_SESSION</span>[<span class="st">'user_id'</span>])) {
    <span class="fn">header</span>(<span class="st">'Location: /login'</span>);
    <span class="kw">exit</span>;
}

<span class="kw">if</span> (<span class="fn">user_has_2fa_enabled</span>(<span class="vr">$_SESSION</span>[<span class="st">'user_id'</span>]) &amp;&amp; empty(<span class="vr">$_SESSION</span>[<span class="st">'2fa_verified'</span>])) {
    <span class="fn">header</span>(<span class="st">'Location: /login/verify'</span>);
    <span class="kw">exit</span>;
}</pre>
        </div>

        <!-- Full example -->
        <div class="section-heading">Complete Working Example</div>
        <p>The following is a minimal but complete single-file PHP example demonstrating the full enrolment and login flow.</p>

        <pre class="code-block"><span class="cm">&lt;?php
/**
 * minimal_2fa.php
 * A self-contained demo of 2FA enrolment and validation.
 * Not for production — no real session/DB persistence.
 */</span>
<span class="fn">session_start</span>();

<span class="kw">function</span> <span class="fn">http_get</span>(<span class="vr">string</span> <span class="vr">$url</span>): <span class="vr">string</span> {
    <span class="vr">$ch</span> = <span class="fn">curl_init</span>(<span class="vr">$url</span>);
    <span class="fn">curl_setopt_array</span>(<span class="vr">$ch</span>, [CURLOPT_RETURNTRANSFER=&gt;<span class="kw">true</span>, CURLOPT_TIMEOUT=&gt;<span class="st">10</span>]);
    <span class="vr">$r</span> = <span class="fn">curl_exec</span>(<span class="vr">$ch</span>);
    <span class="fn">curl_close</span>(<span class="vr">$ch</span>);
    <span class="kw">return</span> <span class="vr">$r</span>;
}

<span class="kw">function</span> <span class="fn">random_base32</span>(<span class="vr">int</span> <span class="vr">$len</span> = <span class="st">32</span>): <span class="vr">string</span> {
    <span class="vr">$chars</span> = <span class="st">'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'</span>;
    <span class="kw">return</span> <span class="fn">implode</span>(<span class="st">''</span>, <span class="fn">array_map</span>(<span class="kw">fn</span>() =&gt; <span class="vr">$chars</span>[<span class="fn">random_int</span>(<span class="st">0</span>,<span class="st">31</span>)], <span class="fn">range</span>(<span class="st">1</span>,<span class="vr">$len</span>)));
}

<span class="cm">// --- Enrol ---</span>
<span class="kw">if</span> ($_SERVER[<span class="st">'REQUEST_METHOD'</span>] === <span class="st">'GET'</span> &amp;&amp; !isset(<span class="vr">$_SESSION</span>[<span class="st">'secret'</span>])) {
    <span class="vr">$_SESSION</span>[<span class="st">'secret'</span>] = <span class="fn">random_base32</span>();
}
<span class="vr">$secret</span> = <span class="vr">$_SESSION</span>[<span class="st">'secret'</span>];

<span class="cm">// --- Validate ---</span>
<span class="vr">$message</span> = <span class="st">''</span>;
<span class="kw">if</span> ($_SERVER[<span class="st">'REQUEST_METHOD'</span>] === <span class="st">'POST'</span>) {
    <span class="vr">$pin</span>  = <span class="fn">preg_replace</span>(<span class="st">'/\D/'</span>, <span class="st">''</span>, <span class="vr">$_POST</span>[<span class="st">'pin'</span>] ?? <span class="st">''</span>);
    <span class="vr">$resp</span> = <span class="fn">trim</span>(<span class="fn">http_get</span>(<span class="st">"https://www.authenticatorApi.com/Validate.aspx?Pin=$pin&amp;SecretCode=$secret"</span>));
    <span class="vr">$message</span> = <span class="fn">strcasecmp</span>(<span class="vr">$resp</span>, <span class="st">'true'</span>) === <span class="st">0</span>
        ? <span class="st">'&lt;div class="alert alert-success"&gt;✓ Code accepted!&lt;/div&gt;'</span>
        : <span class="st">'&lt;div class="alert alert-danger"&gt;✗ Invalid code. Try again.&lt;/div&gt;'</span>;
}

<span class="vr">$qr</span> = <span class="fn">http_get</span>(<span class="st">"https://www.authenticatorApi.com/pair.aspx?AppName=Demo&amp;AppInfo=user@example.com&amp;SecretCode=$secret"</span>);
?&gt;</span>

<span class="cm">&lt;!-- HTML output --&gt;</span>
&lt;h2&gt;Scan this QR code with Google Authenticator&lt;/h2&gt;
&lt;?= <span class="vr">$qr</span> ?&gt;
&lt;p&gt;Or enter this secret manually: &lt;code&gt;&lt;?= <span class="fn">htmlspecialchars</span>(<span class="vr">$secret</span>) ?&gt;&lt;/code&gt;&lt;/p&gt;
&lt;form method="post"&gt;
    &lt;input type="text" name="pin" placeholder="6-digit code" maxlength="6"&gt;
    &lt;button type="submit"&gt;Verify&lt;/button&gt;
&lt;/form&gt;
&lt;?= <span class="vr">$message</span> ?&gt;</pre>

        <!-- Laravel section -->
        <div class="section-heading">Using with Laravel</div>
        <p>In a Laravel application the pattern is the same — generate, store, display, validate — but you use Laravel's HTTP client and session helpers instead of raw curl.</p>

        <pre class="code-block"><span class="cm">// In your TwoFactorController</span>
<span class="kw">use</span> Illuminate\Support\Facades\Http;

<span class="kw">public function</span> <span class="fn">enroll</span>(Request <span class="vr">$request</span>)
{
    <span class="vr">$secret</span> = <span class="fn">strtoupper</span>(<span class="fn">base_convert</span>(<span class="fn">bin2hex</span>(<span class="fn">random_bytes</span>(<span class="st">20</span>)), <span class="st">16</span>, <span class="st">32</span>));
    <span class="vr">$secret</span> = <span class="fn">substr</span>(<span class="vr">$secret</span>, <span class="st">0</span>, <span class="st">32</span>);

    <span class="vr">$request</span>-&gt;<span class="fn">user</span>()-&gt;<span class="fn">update</span>([<span class="st">'totp_secret'</span> =&gt; <span class="fn">encrypt</span>(<span class="vr">$secret</span>)]);

    <span class="vr">$qr</span> = Http::<span class="fn">get</span>(<span class="st">'https://www.authenticatorApi.com/pair.aspx'</span>, [
        <span class="st">'AppName'</span>    =&gt; <span class="fn">config</span>(<span class="st">'app.name'</span>),
        <span class="st">'AppInfo'</span>    =&gt; <span class="vr">$request</span>-&gt;<span class="fn">user</span>()-&gt;email,
        <span class="st">'SecretCode'</span> =&gt; <span class="vr">$secret</span>,
    ])-&gt;<span class="fn">body</span>();

    <span class="kw">return</span> <span class="fn">view</span>(<span class="st">'auth.2fa-setup'</span>, [<span class="st">'qr'</span> =&gt; <span class="vr">$qr</span>, <span class="st">'secret'</span> =&gt; <span class="vr">$secret</span>]);
}

<span class="kw">public function</span> <span class="fn">verify</span>(Request <span class="vr">$request</span>)
{
    <span class="vr">$secret</span> = <span class="fn">decrypt</span>(<span class="vr">$request</span>-&gt;<span class="fn">user</span>()-&gt;totp_secret);

    <span class="vr">$result</span> = Http::<span class="fn">get</span>(<span class="st">'https://www.authenticatorApi.com/Validate.aspx'</span>, [
        <span class="st">'Pin'</span>        =&gt; <span class="vr">$request</span>-&gt;<span class="fn">input</span>(<span class="st">'pin'</span>),
        <span class="st">'SecretCode'</span> =&gt; <span class="vr">$secret</span>,
    ])-&gt;<span class="fn">body</span>();

    <span class="kw">if</span> (<span class="fn">strtolower</span>(<span class="fn">trim</span>(<span class="vr">$result</span>)) === <span class="st">'true'</span>) {
        <span class="vr">$request</span>-&gt;<span class="fn">session</span>()-&gt;<span class="fn">put</span>(<span class="st">'2fa_verified'</span>, <span class="kw">true</span>);
        <span class="kw">return</span> <span class="fn">redirect</span>()-&gt;<span class="fn">intended</span>(<span class="st">'/dashboard'</span>);
    }

    <span class="kw">return</span> <span class="fn">back</span>()-&gt;<span class="fn">withErrors</span>([<span class="st">'pin'</span> =&gt; <span class="st">'Invalid code, please try again.'</span>]);
}</pre>

        <div class="section-heading">Security Checklist for PHP</div>
        <ul style="font-size:15px;line-height:2;color:#444;">
            <li>&#9989; Store secrets encrypted at rest (use <code>openssl_encrypt</code> or Laravel's <code>encrypt()</code>)</li>
            <li>&#9989; Always call the API over HTTPS</li>
            <li>&#9989; Rate-limit 2FA attempts (e.g. max 5 failures before lockout)</li>
            <li>&#9989; Regenerate the session ID after successful 2FA verification (<code>session_regenerate_id(true)</code>)</li>
            <li>&#9989; Generate unique secrets per user with <code>random_int()</code> or <code>random_bytes()</code></li>
            <li>&#9989; Provide recovery codes or an admin reset path for users who lose their device</li>
            <li>&#9989; Strip and validate the PIN input — it must be exactly 6 digits</li>
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
</body>
</html>
