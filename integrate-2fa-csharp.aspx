<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Add Google Authenticator 2FA to C# | AuthenticatorAPI.com</title>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Step-by-step guide to integrating Google Authenticator two-factor authentication into a C# .NET application using AuthenticatorAPI.com.">
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

        .page-hero { background: linear-gradient(135deg, #1565c0 0%, #42a5f5 100%); color:#fff; padding:52px 0 44px; margin-bottom:40px; border-radius:6px; }
        .page-hero .lang-badge { display:inline-block; background:rgba(255,255,255,.2); border-radius:30px; padding:4px 16px; font-size:13px; font-weight:700; letter-spacing:.06em; margin-bottom:14px; }
        .page-hero h1 { font-size:36px; font-weight:900; margin:0 0 10px; }
        .page-hero p { font-size:18px; opacity:.85; margin:0; font-weight:300; }

        .step-block { border-left:4px solid #42a5f5; padding:0 0 32px 28px; position:relative; margin-top:8px; }
        .step-block:last-child { border-left-color:transparent; }
        .step-num { position:absolute; left:-18px; top:0; width:32px; height:32px; border-radius:50%; background:#1565c0; color:#fff; font-weight:900; font-size:14px; display:flex; align-items:center; justify-content:center; }
        .step-block h3 { font-size:19px; font-weight:700; color:#2c3e50; margin:0 0 12px; }
        .step-block p, .step-block ul { font-size:15px; color:#444; line-height:1.75; }

        pre.code-block { background:#1e2d3d; color:#a8d8f0; padding:20px 24px; border-radius:6px; font-size:13px; border:none; overflow-x:auto; line-height:1.7; }
        pre.code-block .cm  { color:#6a9955; }
        pre.code-block .kw  { color:#569cd6; }
        pre.code-block .st  { color:#ce9178; }
        pre.code-block .fn  { color:#dcdcaa; }
        pre.code-block .vr  { color:#9cdcfe; }
        pre.code-block .dc  { color:#4ec9b0; }

        .section-heading { font-size:24px; font-weight:700; color:#2c3e50; border-bottom:3px solid #42a5f5; padding-bottom:8px; margin:40px 0 24px; }
        .info-box { background:#e8f4fd; border-left:4px solid #42a5f5; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#1565c0; }
        .warn-box { background:#fef9e7; border-left:4px solid #f39c12; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#7d6608; }
        .lang-nav { display:flex; gap:10px; flex-wrap:wrap; margin-bottom:36px; }
        .lang-nav a { display:inline-block; padding:8px 18px; border-radius:4px; border:2px solid #e0e0e0; font-size:13px; font-weight:700; text-decoration:none; color:#555; transition:all .2s; }
        .lang-nav a:hover { border-color:#1565c0; color:#1565c0; }
        .tab-switcher { display:flex; gap:0; margin-bottom:0; border-bottom:2px solid #e0e0e0; }
        .tab-switcher button { background:none; border:none; padding:10px 22px; font-size:14px; font-weight:700; color:#888; cursor:pointer; border-bottom:3px solid transparent; margin-bottom:-2px; }
        .tab-switcher button.active { color:#1565c0; border-bottom-color:#1565c0; }
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
            <div class="lang-badge">C# / .NET</div>
            <h1>Add 2FA to Your C# Application</h1>
            <p>A complete guide to integrating Google Authenticator using AuthenticatorAPI.com</p>
        </div>

        <div class="lang-nav">
            <span style="line-height:36px;font-size:13px;font-weight:700;color:#888;">Also available in:</span>
            <a href="/integrate-2fa-php.aspx">PHP</a>
            <a href="/integrate-2fa-python.aspx">Python</a>
            <a href="/integrate-2fa-javascript.aspx">JavaScript</a>
            <a href="/integrate-2fa-java.aspx">Java</a>
        </div>

        <p class="lead text-muted">This guide shows how to integrate Google Authenticator-compatible 2FA into C# applications — covering ASP.NET Core MVC, ASP.NET Web Forms, and standalone console/service applications. Uses only <code>HttpClient</code> from the BCL, with no NuGet packages required.</p>

        <div class="info-box">&#128073; <strong>Compatibility:</strong> .NET 6, 7, 8 (modern), and .NET Framework 4.6.1+ (legacy). All examples use <code>HttpClient</code> with async/await.</div>

        <!-- Tabs for .NET vs Framework -->
        <div class="tab-switcher" style="margin-top:30px;">
            <button class="active" onclick="switchTab('modern', this)">.NET 6/7/8 (Modern)</button>
            <button onclick="switchTab('legacy', this)">.NET Framework 4.x</button>
        </div>

        <div class="section-heading">Step-by-Step Integration</div>

        <div id="tab-modern" class="tab-content-block active">

            <div class="step-block">
                <div class="step-num">1</div>
                <h3>Create a TotpService Helper Class</h3>
                <p>Encapsulate all calls to the API in a single service class. Register it with the DI container as a singleton (sharing a single <code>HttpClient</code> instance is the .NET best practice).</p>
                <pre class="code-block"><span class="kw">using</span> System.Net.Http;
<span class="kw">using</span> System.Security.Cryptography;
<span class="kw">using</span> System.Web;

<span class="kw">public class</span> <span class="dc">TotpService</span>
{
    <span class="kw">private const string</span> Base32Alphabet = <span class="st">"ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"</span>;
    <span class="kw">private const string</span> ApiBase = <span class="st">"https://www.authenticatorApi.com"</span>;

    <span class="kw">private readonly</span> HttpClient _http;

    <span class="kw">public</span> <span class="fn">TotpService</span>(HttpClient http) => _http = http;

    <span class="cm">/// &lt;summary&gt;Generates a cryptographically random 32-character Base32 secret.&lt;/summary&gt;</span>
    <span class="kw">public string</span> <span class="fn">GenerateSecret</span>(<span class="kw">int</span> length = <span class="st">32</span>)
    {
        <span class="kw">var</span> bytes = RandomNumberGenerator.<span class="fn">GetBytes</span>(length);
        <span class="kw">return new string</span>(bytes.<span class="fn">Select</span>(b => Base32Alphabet[b % <span class="st">32</span>]).<span class="fn">ToArray</span>());
    }

    <span class="cm">/// &lt;summary&gt;Returns the HTML img tag QR code for the setup page.&lt;/summary&gt;</span>
    <span class="kw">public async</span> Task&lt;<span class="kw">string</span>&gt; <span class="fn">GetQrCodeHtmlAsync</span>(<span class="kw">string</span> appName, <span class="kw">string</span> userInfo, <span class="kw">string</span> secret)
    {
        <span class="kw">var</span> url = <span class="vr">$"{ApiBase}/pair.aspx"</span>
            + <span class="vr">$"?AppName={HttpUtility.UrlEncode(appName)}"</span>
            + <span class="vr">$"&AppInfo={HttpUtility.UrlEncode(userInfo)}"</span>
            + <span class="vr">$"&SecretCode={HttpUtility.UrlEncode(secret)}"</span>;

        <span class="kw">return await</span> _http.<span class="fn">GetStringAsync</span>(url);
    }

    <span class="cm">/// &lt;summary&gt;Returns true if the PIN is valid for the given secret.&lt;/summary&gt;</span>
    <span class="kw">public async</span> Task&lt;<span class="kw">bool</span>&gt; <span class="fn">ValidatePinAsync</span>(<span class="kw">string</span> pin, <span class="kw">string</span> secret)
    {
        <span class="kw">if</span> (!pin.<span class="fn">All</span>(char.IsDigit) || pin.Length != <span class="st">6</span>) <span class="kw">return false</span>;

        <span class="kw">var</span> url = <span class="vr">$"{ApiBase}/Validate.aspx"</span>
            + <span class="vr">$"?Pin={pin}"</span>
            + <span class="vr">$"&SecretCode={HttpUtility.UrlEncode(secret)}"</span>;

        <span class="kw">var</span> response = <span class="kw">await</span> _http.<span class="fn">GetStringAsync</span>(url);
        <span class="kw">return string</span>.<span class="fn">Equals</span>(response.<span class="fn">Trim</span>(), <span class="st">"True"</span>, StringComparison.OrdinalIgnoreCase);
    }
}</pre>
            </div>

            <div class="step-block">
                <div class="step-num">2</div>
                <h3>Register with Dependency Injection</h3>
                <pre class="code-block"><span class="cm">// Program.cs</span>
builder.Services.<span class="fn">AddHttpClient</span>&lt;<span class="dc">TotpService</span>&gt;(client =>
{
    client.Timeout = TimeSpan.<span class="fn">FromSeconds</span>(<span class="st">10</span>);
});

<span class="cm">// Or as a plain singleton if not using typed HttpClient:</span>
builder.Services.<span class="fn">AddSingleton</span>&lt;<span class="dc">TotpService</span>&gt;(sp =>
    <span class="kw">new</span> <span class="fn">TotpService</span>(sp.<span class="fn">GetRequiredService</span>&lt;IHttpClientFactory&gt;().<span class="fn">CreateClient</span>()));</pre>
            </div>

            <div class="step-block">
                <div class="step-num">3</div>
                <h3>Enrolment Controller (ASP.NET Core MVC)</h3>
                <pre class="code-block"><span class="kw">public class</span> <span class="dc">TwoFactorController</span> : Controller
{
    <span class="kw">private readonly</span> TotpService _totp;
    <span class="kw">private readonly</span> IUserRepository _users;

    <span class="kw">public</span> <span class="fn">TwoFactorController</span>(TotpService totp, IUserRepository users)
    {
        _totp  = totp;
        _users = users;
    }

    [HttpGet]
    <span class="kw">public async</span> Task&lt;IActionResult&gt; <span class="fn">Setup</span>()
    {
        <span class="kw">var</span> secret = _totp.<span class="fn">GenerateSecret</span>();
        HttpContext.Session.<span class="fn">SetString</span>(<span class="st">"Pending2FASecret"</span>, secret);

        <span class="kw">var</span> qrHtml = <span class="kw">await</span> _totp.<span class="fn">GetQrCodeHtmlAsync</span>(
            <span class="st">"MyApp"</span>,
            User.Identity!.Name!,
            secret);

        ViewBag.QrHtml = qrHtml;
        ViewBag.Secret  = secret;
        <span class="kw">return</span> <span class="fn">View</span>();
    }

    [HttpPost]
    <span class="kw">public async</span> Task&lt;IActionResult&gt; <span class="fn">ConfirmSetup</span>(<span class="kw">string</span> pin)
    {
        <span class="kw">var</span> secret = HttpContext.Session.<span class="fn">GetString</span>(<span class="st">"Pending2FASecret"</span>);
        <span class="kw">if</span> (<span class="kw">await</span> _totp.<span class="fn">ValidatePinAsync</span>(pin, secret!))
        {
            <span class="kw">await</span> _users.<span class="fn">SaveTotpSecretAsync</span>(User.Identity!.Name!, secret!);
            <span class="kw">return</span> <span class="fn">RedirectToAction</span>(<span class="st">"Index"</span>, <span class="st">"Home"</span>);
        }
        ModelState.<span class="fn">AddModelError</span>(<span class="st">""</span>, <span class="st">"Invalid code — please try again."</span>);
        <span class="kw">return</span> <span class="fn">View</span>(<span class="st">"Setup"</span>);
    }

    [HttpPost]
    <span class="kw">public async</span> Task&lt;IActionResult&gt; <span class="fn">Verify</span>(<span class="kw">string</span> pin)
    {
        <span class="kw">var</span> secret = <span class="kw">await</span> _users.<span class="fn">GetTotpSecretAsync</span>(User.Identity!.Name!);
        <span class="kw">if</span> (<span class="kw">await</span> _totp.<span class="fn">ValidatePinAsync</span>(pin, secret))
        {
            HttpContext.Session.<span class="fn">SetString</span>(<span class="st">"2FAVerified"</span>, <span class="st">"true"</span>);
            <span class="kw">return</span> <span class="fn">RedirectToAction</span>(<span class="st">"Dashboard"</span>);
        }
        ModelState.<span class="fn">AddModelError</span>(<span class="st">""</span>, <span class="st">"Invalid code — please try again."</span>);
        <span class="kw">return</span> <span class="fn">View</span>();
    }
}</pre>
            </div>

        </div><!-- /tab-modern -->

        <div id="tab-legacy" class="tab-content-block">

            <div class="step-block">
                <div class="step-num">1</div>
                <h3>.NET Framework 4.x — Helper Class</h3>
                <pre class="code-block"><span class="kw">using</span> System;
<span class="kw">using</span> System.Net.Http;
<span class="kw">using</span> System.Security.Cryptography;
<span class="kw">using</span> System.Web;

<span class="kw">public static class</span> <span class="dc">TotpHelper</span>
{
    <span class="kw">private static readonly</span> HttpClient _http = <span class="kw">new</span> <span class="fn">HttpClient</span>();
    <span class="kw">private const string</span> Base32Alphabet = <span class="st">"ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"</span>;

    <span class="kw">public static string</span> <span class="fn">GenerateSecret</span>()
    {
        <span class="kw">var</span> rng   = <span class="kw">new</span> <span class="fn">RNGCryptoServiceProvider</span>();
        <span class="kw">var</span> bytes = <span class="kw">new byte</span>[<span class="st">32</span>];
        rng.<span class="fn">GetBytes</span>(bytes);
        <span class="kw">var</span> sb = <span class="kw">new</span> System.Text.<span class="fn">StringBuilder</span>();
        <span class="kw">foreach</span> (<span class="kw">var</span> b <span class="kw">in</span> bytes) sb.<span class="fn">Append</span>(Base32Alphabet[b % <span class="st">32</span>]);
        <span class="kw">return</span> sb.<span class="fn">ToString</span>();
    }

    <span class="kw">public static string</span> <span class="fn">GetQrCodeHtml</span>(<span class="kw">string</span> appName, <span class="kw">string</span> userInfo, <span class="kw">string</span> secret)
    {
        <span class="kw">var</span> url = <span class="vr">$"https://www.authenticatorApi.com/pair.aspx"</span>
            + <span class="vr">$"?AppName={HttpUtility.UrlEncode(appName)}"</span>
            + <span class="vr">$"&AppInfo={HttpUtility.UrlEncode(userInfo)}"</span>
            + <span class="vr">$"&SecretCode={HttpUtility.UrlEncode(secret)}"</span>;
        <span class="kw">return</span> _http.<span class="fn">GetStringAsync</span>(url).<span class="fn">Result</span>;
    }

    <span class="kw">public static bool</span> <span class="fn">ValidatePin</span>(<span class="kw">string</span> pin, <span class="kw">string</span> secret)
    {
        <span class="kw">var</span> url = <span class="vr">$"https://www.authenticatorApi.com/Validate.aspx?Pin={pin}&SecretCode={HttpUtility.UrlEncode(secret)}"</span>;
        <span class="kw">var</span> result = _http.<span class="fn">GetStringAsync</span>(url).<span class="fn">Result</span>.<span class="fn">Trim</span>();
        <span class="kw">return string</span>.<span class="fn">Equals</span>(result, <span class="st">"True"</span>, StringComparison.OrdinalIgnoreCase);
    }
}</pre>
            </div>

            <div class="step-block">
                <div class="step-num">2</div>
                <h3>ASP.NET Web Forms Usage</h3>
                <pre class="code-block"><span class="cm">// Setup.aspx.cs</span>
<span class="kw">protected void</span> <span class="fn">Page_Load</span>(<span class="kw">object</span> sender, EventArgs e)
{
    <span class="kw">if</span> (!IsPostBack)
    {
        <span class="kw">var</span> secret = TotpHelper.<span class="fn">GenerateSecret</span>();
        Session[<span class="st">"Pending2FASecret"</span>] = secret;
        QrCodeLiteral.Text = TotpHelper.<span class="fn">GetQrCodeHtml</span>(<span class="st">"MyApp"</span>, User.Identity.Name, secret);
        SecretLabel.Text = secret;
    }
}

<span class="kw">protected void</span> <span class="fn">btnVerify_Click</span>(<span class="kw">object</span> sender, EventArgs e)
{
    <span class="kw">var</span> secret = Session[<span class="st">"Pending2FASecret"</span>] <span class="kw">as string</span>;
    <span class="kw">if</span> (TotpHelper.<span class="fn">ValidatePin</span>(PinTextBox.Text.<span class="fn">Trim</span>(), secret))
    {
        <span class="cm">// Save secret to user's profile and redirect</span>
        SaveSecretToProfile(secret);
        Response.<span class="fn">Redirect</span>(<span class="st">"~/Default.aspx"</span>);
    }
    <span class="kw">else</span>
    {
        ErrorLabel.Text = <span class="st">"Invalid code — please try again."</span>;
        ErrorLabel.Visible = <span class="kw">true</span>;
    }
}</pre>
            </div>

        </div><!-- /tab-legacy -->

        <div class="section-heading">Security Checklist for C#</div>
        <ul style="font-size:15px;line-height:2;color:#444;">
            <li>&#9989; Use <code>RandomNumberGenerator.GetBytes()</code> (.NET 6+) or <code>RNGCryptoServiceProvider</code> (.NET Framework)</li>
            <li>&#9989; Use the <code>IHttpClientFactory</code> pattern — never instantiate <code>HttpClient</code> directly in a loop</li>
            <li>&#9989; Store secrets encrypted with <code>IDataProtector</code> (ASP.NET Core) or AES-256</li>
            <li>&#9989; Always call the API over HTTPS</li>
            <li>&#9989; Apply rate limiting to the verification endpoint (<code>AspNetCoreRateLimit</code> NuGet)</li>
            <li>&#9989; Regenerate the authentication cookie/session after successful 2FA</li>
            <li>&#9989; Provide recovery codes and a documented admin reset path</li>
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
