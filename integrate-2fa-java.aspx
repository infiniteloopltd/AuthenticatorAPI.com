<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Add Google Authenticator 2FA to Java | AuthenticatorAPI.com</title>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Step-by-step guide to integrating Google Authenticator two-factor authentication into a Java application (Spring Boot or plain Java) using AuthenticatorAPI.com.">
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

        .page-hero { background: linear-gradient(135deg, #7b1a1a 0%, #e53935 100%); color:#fff; padding:52px 0 44px; margin-bottom:40px; border-radius:6px; }
        .page-hero .lang-badge { display:inline-block; background:rgba(255,255,255,.2); border-radius:30px; padding:4px 16px; font-size:13px; font-weight:700; letter-spacing:.06em; margin-bottom:14px; }
        .page-hero h1 { font-size:36px; font-weight:900; margin:0 0 10px; }
        .page-hero p { font-size:18px; opacity:.85; margin:0; font-weight:300; }

        .step-block { border-left:4px solid #e53935; padding:0 0 32px 28px; position:relative; margin-top:8px; }
        .step-block:last-child { border-left-color:transparent; }
        .step-num { position:absolute; left:-18px; top:0; width:32px; height:32px; border-radius:50%; background:#7b1a1a; color:#fff; font-weight:900; font-size:14px; display:flex; align-items:center; justify-content:center; }
        .step-block h3 { font-size:19px; font-weight:700; color:#2c3e50; margin:0 0 12px; }
        .step-block p, .step-block ul { font-size:15px; color:#444; line-height:1.75; }

        pre.code-block { background:#1e2d3d; color:#a8d8f0; padding:20px 24px; border-radius:6px; font-size:13px; border:none; overflow-x:auto; line-height:1.7; }
        pre.code-block .cm  { color:#6a9955; }
        pre.code-block .kw  { color:#569cd6; }
        pre.code-block .st  { color:#ce9178; }
        pre.code-block .fn  { color:#dcdcaa; }
        pre.code-block .vr  { color:#9cdcfe; }
        pre.code-block .dc  { color:#4ec9b0; }

        .section-heading { font-size:24px; font-weight:700; color:#2c3e50; border-bottom:3px solid #e53935; padding-bottom:8px; margin:40px 0 24px; }
        .info-box { background:#fdecea; border-left:4px solid #e53935; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#7b1a1a; }
        .warn-box { background:#fef9e7; border-left:4px solid #f39c12; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#7d6608; }
        .lang-nav { display:flex; gap:10px; flex-wrap:wrap; margin-bottom:36px; }
        .lang-nav a { display:inline-block; padding:8px 18px; border-radius:4px; border:2px solid #e0e0e0; font-size:13px; font-weight:700; text-decoration:none; color:#555; transition:all .2s; }
        .lang-nav a:hover { border-color:#7b1a1a; color:#7b1a1a; }
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
            <div class="lang-badge">Java</div>
            <h1>Add 2FA to Your Java Application</h1>
            <p>A complete guide to integrating Google Authenticator using AuthenticatorAPI.com</p>
        </div>

        <div class="lang-nav">
            <span style="line-height:36px;font-size:13px;font-weight:700;color:#888;">Also available in:</span>
            <a href="/integrate-2fa-php.aspx">PHP</a>
            <a href="/integrate-2fa-python.aspx">Python</a>
            <a href="/integrate-2fa-csharp.aspx">C#</a>
            <a href="/integrate-2fa-javascript.aspx">JavaScript</a>
        </div>

        <p class="lead text-muted">This guide shows how to add Google Authenticator-compatible two-factor authentication to Java applications. We cover both a plain Java utility class and a full Spring Boot integration with Spring Security. No third-party TOTP libraries are required — just Java's standard HTTP client.</p>

        <div class="info-box">&#128073; <strong>Prerequisites:</strong> Java 11+ (for the built-in <code>HttpClient</code>). For Spring Boot, version 3.x is used in examples. A JPA-compatible database for storing user secrets.</div>

        <div class="section-heading">Core Utility Class (Plain Java)</div>

        <div class="step-block">
            <div class="step-num">1</div>
            <h3>TotpService.java</h3>
            <p>A self-contained service class that wraps all calls to the AuthenticatorAPI. This works in any Java application — Spring, Jakarta EE, or plain Java.</p>
            <pre class="code-block"><span class="kw">import</span> java.net.URI;
<span class="kw">import</span> java.net.URLEncoder;
<span class="kw">import</span> java.net.http.HttpClient;
<span class="kw">import</span> java.net.http.HttpRequest;
<span class="kw">import</span> java.net.http.HttpResponse;
<span class="kw">import</span> java.nio.charset.StandardCharsets;
<span class="kw">import</span> java.security.SecureRandom;
<span class="kw">import</span> java.time.Duration;

<span class="kw">public class</span> <span class="dc">TotpService</span> {

    <span class="kw">private static final</span> <span class="dc">String</span> BASE32_ALPHABET = <span class="st">"ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"</span>;
    <span class="kw">private static final</span> <span class="dc">String</span> API_BASE = <span class="st">"https://www.authenticatorApi.com"</span>;
    <span class="kw">private static final</span> <span class="dc">SecureRandom</span> RNG = <span class="kw">new</span> <span class="fn">SecureRandom</span>();

    <span class="kw">private final</span> <span class="dc">HttpClient</span> httpClient;

    <span class="kw">public</span> <span class="fn">TotpService</span>() {
        <span class="kw">this</span>.httpClient = HttpClient.newBuilder()
            .connectTimeout(<span class="fn">Duration.ofSeconds</span>(<span class="st">10</span>))
            .build();
    }

    <span class="cm">/** Generates a cryptographically random 32-character Base32 secret. */</span>
    <span class="kw">public</span> <span class="dc">String</span> <span class="fn">generateSecret</span>() {
        <span class="kw">return</span> <span class="fn">generateSecret</span>(<span class="st">32</span>);
    }

    <span class="kw">public</span> <span class="dc">String</span> <span class="fn">generateSecret</span>(<span class="kw">int</span> length) {
        <span class="dc">StringBuilder</span> sb = <span class="kw">new</span> <span class="fn">StringBuilder</span>(length);
        <span class="kw">byte</span>[] bytes = <span class="kw">new byte</span>[length];
        RNG.<span class="fn">nextBytes</span>(bytes);
        <span class="kw">for</span> (<span class="kw">byte</span> b : bytes) {
            sb.<span class="fn">append</span>(BASE32_ALPHABET.charAt((b &amp; <span class="st">0xFF</span>) % <span class="st">32</span>));
        }
        <span class="kw">return</span> sb.<span class="fn">toString</span>();
    }

    <span class="cm">/** Returns the HTML img tag for the QR code setup page. */</span>
    <span class="kw">public</span> <span class="dc">String</span> <span class="fn">getQrCodeHtml</span>(<span class="dc">String</span> appName, <span class="dc">String</span> userInfo, <span class="dc">String</span> secret)
            <span class="kw">throws</span> Exception {
        <span class="dc">String</span> url = API_BASE + <span class="st">"/pair.aspx"</span>
            + <span class="st">"?AppName="</span> + <span class="fn">encode</span>(appName)
            + <span class="st">"&AppInfo="</span> + <span class="fn">encode</span>(userInfo)
            + <span class="st">"&SecretCode="</span> + <span class="fn">encode</span>(secret);

        <span class="kw">return</span> <span class="fn">get</span>(url);
    }

    <span class="cm">/** Returns true if the 6-digit pin is valid for the given secret. */</span>
    <span class="kw">public boolean</span> <span class="fn">validatePin</span>(<span class="dc">String</span> pin, <span class="dc">String</span> secret) <span class="kw">throws</span> Exception {
        <span class="kw">if</span> (!pin.<span class="fn">matches</span>(<span class="st">"\\d{6}"</span>)) <span class="kw">return false</span>;

        <span class="dc">String</span> url = API_BASE + <span class="st">"/Validate.aspx"</span>
            + <span class="st">"?Pin="</span> + pin
            + <span class="st">"&SecretCode="</span> + <span class="fn">encode</span>(secret);

        <span class="dc">String</span> response = <span class="fn">get</span>(url).<span class="fn">trim</span>();
        <span class="kw">return</span> response.<span class="fn">equalsIgnoreCase</span>(<span class="st">"true"</span>);
    }

    <span class="kw">private</span> <span class="dc">String</span> <span class="fn">get</span>(<span class="dc">String</span> url) <span class="kw">throws</span> Exception {
        <span class="dc">HttpRequest</span> request = HttpRequest.newBuilder()
            .<span class="fn">uri</span>(<span class="fn">URI.create</span>(url))
            .timeout(<span class="fn">Duration.ofSeconds</span>(<span class="st">10</span>))
            .<span class="fn">GET</span>()
            .build();
        <span class="kw">return</span> httpClient
            .<span class="fn">send</span>(request, HttpResponse.BodyHandlers.<span class="fn">ofString</span>())
            .body();
    }

    <span class="kw">private</span> <span class="dc">String</span> <span class="fn">encode</span>(<span class="dc">String</span> value) {
        <span class="kw">return</span> URLEncoder.<span class="fn">encode</span>(value, StandardCharsets.UTF_8);
    }
}</pre>
        </div>

        <div class="section-heading">Spring Boot Integration</div>

        <div class="step-block">
            <div class="step-num">2</div>
            <h3>Register as a Spring Bean</h3>
            <pre class="code-block"><span class="cm">// TotpConfig.java</span>
<span class="kw">import</span> org.springframework.context.annotation.Bean;
<span class="kw">import</span> org.springframework.context.annotation.Configuration;

<span class="dc">@Configuration</span>
<span class="kw">public class</span> <span class="dc">TotpConfig</span> {

    <span class="dc">@Bean</span>
    <span class="kw">public</span> <span class="dc">TotpService</span> <span class="fn">totpService</span>() {
        <span class="kw">return new</span> <span class="fn">TotpService</span>();
    }
}</pre>
        </div>

        <div class="step-block">
            <div class="step-num">3</div>
            <h3>Spring MVC Controller</h3>
            <pre class="code-block"><span class="cm">// TwoFactorController.java</span>
<span class="kw">import</span> org.springframework.stereotype.Controller;
<span class="kw">import</span> org.springframework.ui.Model;
<span class="kw">import</span> org.springframework.web.bind.annotation.*;
<span class="kw">import</span> jakarta.servlet.http.HttpSession;

<span class="dc">@Controller</span>
<span class="dc">@RequestMapping</span>(<span class="st">"/2fa"</span>)
<span class="kw">public class</span> <span class="dc">TwoFactorController</span> {

    <span class="kw">private final</span> <span class="dc">TotpService</span> totpService;
    <span class="kw">private final</span> <span class="dc">UserService</span> userService;

    <span class="kw">public</span> <span class="fn">TwoFactorController</span>(<span class="dc">TotpService</span> totpService, <span class="dc">UserService</span> userService) {
        <span class="kw">this</span>.totpService = totpService;
        <span class="kw">this</span>.userService  = userService;
    }

    <span class="cm">// GET /2fa/setup — show the QR code</span>
    <span class="dc">@GetMapping</span>(<span class="st">"/setup"</span>)
    <span class="kw">public</span> <span class="dc">String</span> <span class="fn">setup</span>(<span class="dc">HttpSession</span> session, <span class="dc">Model</span> model) <span class="kw">throws</span> Exception {
        <span class="dc">String</span> secret = totpService.<span class="fn">generateSecret</span>();
        session.<span class="fn">setAttribute</span>(<span class="st">"pending2faSecret"</span>, secret);

        <span class="dc">String</span> username = <span class="cm">/* current principal */</span> <span class="st">""</span>;
        model.<span class="fn">addAttribute</span>(<span class="st">"qrHtml"</span>, totpService.<span class="fn">getQrCodeHtml</span>(<span class="st">"MyApp"</span>, username, secret));
        model.<span class="fn">addAttribute</span>(<span class="st">"secret"</span>, secret);
        <span class="kw">return</span> <span class="st">"2fa/setup"</span>;
    }

    <span class="cm">// POST /2fa/setup — confirm the user scanned correctly</span>
    <span class="dc">@PostMapping</span>(<span class="st">"/setup"</span>)
    <span class="kw">public</span> <span class="dc">String</span> <span class="fn">confirmSetup</span>(<span class="dc">@RequestParam</span> <span class="dc">String</span> pin, <span class="dc">HttpSession</span> session, <span class="dc">Model</span> model) <span class="kw">throws</span> Exception {
        <span class="dc">String</span> secret = (<span class="dc">String</span>) session.<span class="fn">getAttribute</span>(<span class="st">"pending2faSecret"</span>);
        <span class="kw">if</span> (totpService.<span class="fn">validatePin</span>(pin, secret)) {
            userService.<span class="fn">saveTotpSecret</span>(<span class="cm">/* userId */</span>, secret);
            session.<span class="fn">removeAttribute</span>(<span class="st">"pending2faSecret"</span>);
            <span class="kw">return</span> <span class="st">"redirect:/dashboard"</span>;
        }
        model.<span class="fn">addAttribute</span>(<span class="st">"error"</span>, <span class="st">"Invalid code — please try again."</span>);
        <span class="kw">return</span> <span class="st">"2fa/setup"</span>;
    }

    <span class="cm">// POST /2fa/verify — called during login</span>
    <span class="dc">@PostMapping</span>(<span class="st">"/verify"</span>)
    <span class="kw">public</span> <span class="dc">String</span> <span class="fn">verify</span>(<span class="dc">@RequestParam</span> <span class="dc">String</span> pin, <span class="dc">HttpSession</span> session, <span class="dc">Model</span> model) <span class="kw">throws</span> Exception {
        <span class="dc">String</span> secret = userService.<span class="fn">getDecryptedTotpSecret</span>(<span class="cm">/* userId */</span>);
        <span class="kw">if</span> (totpService.<span class="fn">validatePin</span>(pin, secret)) {
            session.<span class="fn">setAttribute</span>(<span class="st">"2faVerified"</span>, <span class="kw">true</span>);
            <span class="kw">return</span> <span class="st">"redirect:/dashboard"</span>;
        }
        model.<span class="fn">addAttribute</span>(<span class="st">"error"</span>, <span class="st">"Invalid code — please try again."</span>);
        <span class="kw">return</span> <span class="st">"2fa/verify"</span>;
    }
}</pre>
        </div>

        <div class="step-block">
            <div class="step-num">4</div>
            <h3>Spring Security Filter</h3>
            <p>Add a filter that intercepts requests after password authentication and redirects users who haven't yet completed their TOTP check.</p>
            <pre class="code-block"><span class="cm">// TwoFactorFilter.java</span>
<span class="kw">import</span> jakarta.servlet.*;
<span class="kw">import</span> jakarta.servlet.http.*;
<span class="kw">import</span> org.springframework.web.filter.OncePerRequestFilter;

<span class="kw">public class</span> <span class="dc">TwoFactorFilter</span> <span class="kw">extends</span> <span class="dc">OncePerRequestFilter</span> {

    <span class="kw">private static final</span> <span class="dc">String</span>[] EXEMPT = {<span class="st">"/2fa/"</span>, <span class="st">"/login"</span>, <span class="st">"/logout"</span>, <span class="st">"/css/"</span>, <span class="st">"/js/"</span>};

    <span class="dc">@Override</span>
    <span class="kw">protected void</span> <span class="fn">doFilterInternal</span>(<span class="dc">HttpServletRequest</span> req, <span class="dc">HttpServletResponse</span> res, <span class="dc">FilterChain</span> chain)
            <span class="kw">throws</span> ServletException, IOException {

        <span class="dc">HttpSession</span> session = req.<span class="fn">getSession</span>(<span class="kw">false</span>);
        <span class="dc">String</span> path = req.<span class="fn">getServletPath</span>();
        <span class="kw">boolean</span> isExempt = <span class="kw">false</span>;
        <span class="kw">for</span> (<span class="dc">String</span> e : EXEMPT) <span class="kw">if</span> (path.<span class="fn">startsWith</span>(e)) { isExempt = <span class="kw">true</span>; <span class="kw">break</span>; }

        <span class="kw">if</span> (!isExempt &amp;&amp; session != <span class="kw">null</span>
                &amp;&amp; session.<span class="fn">getAttribute</span>(<span class="st">"userId"</span>) != <span class="kw">null</span>
                &amp;&amp; !Boolean.TRUE.<span class="fn">equals</span>(session.<span class="fn">getAttribute</span>(<span class="st">"2faVerified"</span>))) {
            res.<span class="fn">sendRedirect</span>(<span class="st">"/2fa/verify"</span>);
            <span class="kw">return</span>;
        }
        chain.<span class="fn">doFilter</span>(req, res);
    }
}</pre>
        </div>

        <div class="section-heading">Security Checklist for Java</div>
        <ul style="font-size:15px;line-height:2;color:#444;">
            <li>&#9989; Use <code>SecureRandom</code> — never <code>java.util.Random</code></li>
            <li>&#9989; Encrypt secrets with AES-256 before persisting (use JCA or a library like Jasypt)</li>
            <li>&#9989; Use a singleton <code>HttpClient</code> instance — it is thread-safe and connection-pooling aware</li>
            <li>&#9989; Always call the API over HTTPS</li>
            <li>&#9989; Add rate limiting on the verify endpoint (Spring's <code>Bucket4j</code> integration)</li>
            <li>&#9989; Invalidate and regenerate the session after successful 2FA</li>
            <li>&#9989; Provide recovery codes for users who lose their authenticator device</li>
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
