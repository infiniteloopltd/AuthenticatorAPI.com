<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Add Google Authenticator 2FA to Python | AuthenticatorAPI.com</title>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Step-by-step guide to integrating Google Authenticator two-factor authentication into a Python application using AuthenticatorAPI.com.">
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

        .page-hero { background: linear-gradient(135deg, #1a6b3c 0%, #27ae60 100%); color:#fff; padding:52px 0 44px; margin-bottom:40px; border-radius:6px; }
        .page-hero .lang-badge { display:inline-block; background:rgba(255,255,255,.2); border-radius:30px; padding:4px 16px; font-size:13px; font-weight:700; letter-spacing:.06em; margin-bottom:14px; }
        .page-hero h1 { font-size:36px; font-weight:900; margin:0 0 10px; }
        .page-hero p { font-size:18px; opacity:.85; margin:0; font-weight:300; }

        .step-block { border-left:4px solid #27ae60; padding:0 0 32px 28px; position:relative; margin-top:8px; }
        .step-block:last-child { border-left-color:transparent; }
        .step-num { position:absolute; left:-18px; top:0; width:32px; height:32px; border-radius:50%; background:#27ae60; color:#fff; font-weight:900; font-size:14px; display:flex; align-items:center; justify-content:center; }
        .step-block h3 { font-size:19px; font-weight:700; color:#2c3e50; margin:0 0 12px; }
        .step-block p, .step-block ul { font-size:15px; color:#444; line-height:1.75; }

        pre.code-block { background:#1e2d3d; color:#a8d8f0; padding:20px 24px; border-radius:6px; font-size:13px; border:none; overflow-x:auto; line-height:1.7; }
        pre.code-block .cm  { color:#6a9955; }
        pre.code-block .kw  { color:#569cd6; }
        pre.code-block .st  { color:#ce9178; }
        pre.code-block .fn  { color:#dcdcaa; }
        pre.code-block .vr  { color:#9cdcfe; }
        pre.code-block .dc  { color:#4ec9b0; }

        .section-heading { font-size:24px; font-weight:700; color:#2c3e50; border-bottom:3px solid #27ae60; padding-bottom:8px; margin:40px 0 24px; }
        .info-box { background:#eafaf1; border-left:4px solid #27ae60; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#1a6b3c; }
        .warn-box { background:#fef9e7; border-left:4px solid #f39c12; border-radius:4px; padding:16px 20px; margin:20px 0; font-size:14px; color:#7d6608; }
        .lang-nav { display:flex; gap:10px; flex-wrap:wrap; margin-bottom:36px; }
        .lang-nav a { display:inline-block; padding:8px 18px; border-radius:4px; border:2px solid #e0e0e0; font-size:13px; font-weight:700; text-decoration:none; color:#555; transition:all .2s; }
        .lang-nav a:hover { border-color:#27ae60; color:#27ae60; }
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
            <div class="lang-badge">Python</div>
            <h1>Add 2FA to Your Python App</h1>
            <p>A complete guide to integrating Google Authenticator using AuthenticatorAPI.com</p>
        </div>

        <div class="lang-nav">
            <span style="line-height:36px;font-size:13px;font-weight:700;color:#888;">Also available in:</span>
            <a href="/integrate-2fa-php.aspx">PHP</a>
            <a href="/integrate-2fa-csharp.aspx">C#</a>
            <a href="/integrate-2fa-javascript.aspx">JavaScript</a>
            <a href="/integrate-2fa-java.aspx">Java</a>
        </div>

        <p class="lead text-muted">This guide covers adding Google Authenticator-compatible TOTP two-factor authentication to Python applications — whether you are using Flask, Django, FastAPI, or a plain script. The only dependency you need is the standard <code>requests</code> library.</p>

        <div class="info-box">&#128073; <strong>Prerequisites:</strong> Python 3.7+, <code>requests</code> library (<code>pip install requests</code>). A database (SQLite, PostgreSQL, etc.) to store per-user secrets.</div>

        <div class="section-heading">Step-by-Step Integration</div>

        <div class="step-block">
            <div class="step-num">1</div>
            <h3>Generate a Secret Code</h3>
            <p>Use Python's <code>secrets</code> module (cryptographically secure) to generate a random Base32 secret for each user at the point they enable 2FA.</p>
            <pre class="code-block"><span class="kw">import</span> secrets
<span class="kw">import</span> string

<span class="kw">def</span> <span class="fn">generate_totp_secret</span>(length: <span class="dc">int</span> = <span class="st">32</span>) -> <span class="dc">str</span>:
    <span class="st">"""Generate a cryptographically random Base32 secret."""</span>
    <span class="cm"># Base32 alphabet: A-Z and 2-7</span>
    alphabet = string.ascii_uppercase + <span class="st">'234567'</span>
    <span class="kw">return</span> <span class="st">''</span>.join(secrets.choice(alphabet) <span class="kw">for</span> _ <span class="kw">in</span> range(length))

<span class="cm"># Example usage</span>
secret = <span class="fn">generate_totp_secret</span>()
<span class="cm"># e.g. 'JBSWY3DPEHPK3PXPJBSWY3DPEHPK3PX'</span>

<span class="cm"># Store encrypted — never store plaintext secrets</span>
<span class="kw">from</span> cryptography.fernet <span class="kw">import</span> Fernet
cipher = Fernet(ENCRYPTION_KEY)  <span class="cm"># key from environment variable</span>
encrypted_secret = cipher.<span class="fn">encrypt</span>(secret.<span class="fn">encode</span>()).<span class="fn">decode</span>()
<span class="cm"># Save encrypted_secret to the database for this user</span></pre>
        </div>

        <div class="step-block">
            <div class="step-num">2</div>
            <h3>Fetch and Display the QR Code</h3>
            <p>Call the Pair endpoint to get a QR code image, then embed it in your setup page so the user can scan it.</p>
            <pre class="code-block"><span class="kw">import</span> requests
<span class="kw">from</span> urllib.parse <span class="kw">import</span> urlencode

<span class="kw">def</span> <span class="fn">get_qr_code_html</span>(app_name: <span class="dc">str</span>, user_email: <span class="dc">str</span>, secret: <span class="dc">str</span>) -> <span class="dc">str</span>:
    <span class="st">"""Returns an HTML img tag containing the QR code for pairing."""</span>
    params = {
        <span class="st">'AppName'</span>:    app_name,
        <span class="st">'AppInfo'</span>:    user_email,
        <span class="st">'SecretCode'</span>: secret,
    }
    base_url = <span class="st">'https://www.authenticatorApi.com/pair.aspx'</span>
    response = requests.<span class="fn">get</span>(base_url, params=params, timeout=<span class="st">10</span>)
    response.<span class="fn">raise_for_status</span>()
    <span class="kw">return</span> response.text  <span class="cm"># Returns an &lt;img&gt; tag</span>

<span class="cm"># Flask route example</span>
<span class="kw">from</span> flask <span class="kw">import</span> session, render_template

<span class="cm"># @app.route('/settings/2fa/setup')</span>
<span class="kw">def</span> <span class="fn">setup_2fa</span>():
    secret = <span class="fn">generate_totp_secret</span>()
    session[<span class="st">'pending_2fa_secret'</span>] = secret  <span class="cm"># store until confirmed</span>
    qr_html = <span class="fn">get_qr_code_html</span>(<span class="st">'MyApp'</span>, session[<span class="st">'user_email'</span>], secret)
    <span class="kw">return</span> <span class="fn">render_template</span>(<span class="st">'2fa_setup.html'</span>, qr=qr_html, secret=secret)</pre>
            <div class="info-box">&#9888; Only save the secret to the database <em>after</em> the user successfully verifies their first code. This prevents orphaned secrets from abandoned setups.</div>
        </div>

        <div class="step-block">
            <div class="step-num">3</div>
            <h3>Validate the PIN at Login</h3>
            <p>Once the user has set up 2FA, validate every login by calling the Validate endpoint.</p>
            <pre class="code-block"><span class="kw">def</span> <span class="fn">validate_totp_pin</span>(pin: <span class="dc">str</span>, secret: <span class="dc">str</span>) -> <span class="dc">bool</span>:
    <span class="st">"""Returns True if the 6-digit pin is valid for the given secret."""</span>
    <span class="kw">if not</span> pin.<span class="fn">isdigit</span>() <span class="kw">or</span> <span class="fn">len</span>(pin) != <span class="st">6</span>:
        <span class="kw">return False</span>

    params = {<span class="st">'Pin'</span>: pin, <span class="st">'SecretCode'</span>: secret}
    response = requests.<span class="fn">get</span>(
        <span class="st">'https://www.authenticatorApi.com/Validate.aspx'</span>,
        params=params,
        timeout=<span class="st">10</span>
    )
    response.<span class="fn">raise_for_status</span>()
    <span class="kw">return</span> response.text.<span class="fn">strip</span>().<span class="fn">lower</span>() == <span class="st">'true'</span>

<span class="cm"># Flask login route example</span>
<span class="kw">from</span> flask <span class="kw">import</span> request, redirect, url_for, flash

<span class="cm"># @app.route('/login/verify', methods=['POST'])</span>
<span class="kw">def</span> <span class="fn">verify_2fa</span>():
    pin = request.form.<span class="fn">get</span>(<span class="st">'pin'</span>, <span class="st">''</span>)
    secret = <span class="fn">get_user_secret</span>(session[<span class="st">'user_id'</span>])  <span class="cm"># decrypt from DB</span>

    <span class="kw">try</span>:
        valid = <span class="fn">validate_totp_pin</span>(pin, secret)
    <span class="kw">except</span> requests.RequestException:
        <span class="fn">flash</span>(<span class="st">'Could not reach authentication service. Try again.'</span>, <span class="st">'error'</span>)
        <span class="kw">return</span> <span class="fn">redirect</span>(<span class="fn">url_for</span>(<span class="st">'verify_2fa_form'</span>))

    <span class="kw">if</span> valid:
        session[<span class="st">'2fa_verified'</span>] = <span class="kw">True</span>
        <span class="kw">return</span> <span class="fn">redirect</span>(<span class="fn">url_for</span>(<span class="st">'dashboard'</span>))
    <span class="kw">else</span>:
        <span class="fn">flash</span>(<span class="st">'Invalid code. Please try again.'</span>, <span class="st">'error'</span>)
        <span class="kw">return</span> <span class="fn">redirect</span>(<span class="fn">url_for</span>(<span class="st">'verify_2fa_form'</span>))</pre>
        </div>

        <div class="step-block">
            <div class="step-num">4</div>
            <h3>Protect Routes with a Decorator</h3>
            <p>In Flask, create a decorator that enforces 2FA verification before allowing access to protected views.</p>
            <pre class="code-block"><span class="kw">from</span> functools <span class="kw">import</span> wraps
<span class="kw">from</span> flask <span class="kw">import</span> session, redirect, url_for

<span class="kw">def</span> <span class="fn">require_2fa</span>(f):
    <span class="dc">@wraps</span>(f)
    <span class="kw">def</span> <span class="fn">decorated_function</span>(*args, **kwargs):
        <span class="kw">if not</span> session.<span class="fn">get</span>(<span class="st">'user_id'</span>):
            <span class="kw">return</span> <span class="fn">redirect</span>(<span class="fn">url_for</span>(<span class="st">'login'</span>))
        <span class="kw">if</span> <span class="fn">user_has_2fa</span>(session[<span class="st">'user_id'</span>]) <span class="kw">and not</span> session.<span class="fn">get</span>(<span class="st">'2fa_verified'</span>):
            <span class="kw">return</span> <span class="fn">redirect</span>(<span class="fn">url_for</span>(<span class="st">'verify_2fa_form'</span>))
        <span class="kw">return</span> <span class="fn">f</span>(*args, **kwargs)
    <span class="kw">return</span> decorated_function

<span class="cm"># Usage:</span>
<span class="dc">@app.route</span>(<span class="st">'/dashboard'</span>)
<span class="dc">@require_2fa</span>
<span class="kw">def</span> <span class="fn">dashboard</span>():
    <span class="kw">return</span> <span class="fn">render_template</span>(<span class="st">'dashboard.html'</span>)</pre>
        </div>

        <div class="section-heading">Django Integration</div>
        <p>For Django, the same logic applies but using Django's ORM and middleware patterns.</p>

        <pre class="code-block"><span class="cm"># views.py</span>
<span class="kw">import</span> requests
<span class="kw">from</span> django.contrib.auth.decorators <span class="kw">import</span> login_required
<span class="kw">from</span> django.shortcuts <span class="kw">import</span> redirect, render
<span class="kw">from</span> django.contrib <span class="kw">import</span> messages
<span class="kw">from</span> .models <span class="kw">import</span> UserProfile

<span class="dc">@login_required</span>
<span class="kw">def</span> <span class="fn">verify_2fa</span>(request):
    <span class="kw">if</span> request.method == <span class="st">'POST'</span>:
        pin    = request.POST.<span class="fn">get</span>(<span class="st">'pin'</span>, <span class="st">''</span>)
        profile = UserProfile.objects.<span class="fn">get</span>(user=request.user)
        secret  = profile.<span class="fn">get_decrypted_totp_secret</span>()

        resp = requests.<span class="fn">get</span>(
            <span class="st">'https://www.authenticatorApi.com/Validate.aspx'</span>,
            params={<span class="st">'Pin'</span>: pin, <span class="st">'SecretCode'</span>: secret},
            timeout=<span class="st">10</span>
        )

        <span class="kw">if</span> resp.text.<span class="fn">strip</span>().<span class="fn">lower</span>() == <span class="st">'true'</span>:
            request.session[<span class="st">'2fa_verified'</span>] = <span class="kw">True</span>
            <span class="kw">return</span> <span class="fn">redirect</span>(<span class="st">'dashboard'</span>)
        <span class="kw">else</span>:
            messages.<span class="fn">error</span>(request, <span class="st">'Invalid code. Please try again.'</span>)

    <span class="kw">return</span> <span class="fn">render</span>(request, <span class="st">'auth/verify_2fa.html'</span>)

<span class="cm"># middleware.py — enforce 2FA on all protected views</span>
<span class="kw">class</span> <span class="dc">TwoFactorMiddleware</span>:
    EXEMPT_PATHS = [<span class="st">'/login/'</span>, <span class="st">'/login/verify/'</span>, <span class="st">'/logout/'</span>]

    <span class="kw">def</span> <span class="fn">__init__</span>(self, get_response):
        self.get_response = get_response

    <span class="kw">def</span> <span class="fn">__call__</span>(self, request):
        <span class="kw">if</span> (request.user.<span class="fn">is_authenticated</span>
                <span class="kw">and</span> request.path <span class="kw">not in</span> self.EXEMPT_PATHS
                <span class="kw">and</span> <span class="fn">user_has_2fa</span>(request.user)
                <span class="kw">and not</span> request.session.<span class="fn">get</span>(<span class="st">'2fa_verified'</span>)):
            <span class="kw">return</span> <span class="fn">redirect</span>(<span class="st">'/login/verify/'</span>)
        <span class="kw">return</span> self.<span class="fn">get_response</span>(request)</pre>

        <div class="section-heading">FastAPI Integration</div>
        <pre class="code-block"><span class="kw">from</span> fastapi <span class="kw">import</span> FastAPI, HTTPException, Depends
<span class="kw">from</span> fastapi.security <span class="kw">import</span> OAuth2PasswordBearer
<span class="kw">import</span> httpx

app = <span class="fn">FastAPI</span>()

<span class="kw">async def</span> <span class="fn">validate_totp</span>(pin: <span class="dc">str</span>, secret: <span class="dc">str</span>) -> <span class="dc">bool</span>:
    <span class="kw">async with</span> httpx.<span class="fn">AsyncClient</span>() <span class="kw">as</span> client:
        response = <span class="kw">await</span> client.<span class="fn">get</span>(
            <span class="st">'https://www.authenticatorApi.com/Validate.aspx'</span>,
            params={<span class="st">'Pin'</span>: pin, <span class="st">'SecretCode'</span>: secret},
            timeout=<span class="st">10.0</span>
        )
    <span class="kw">return</span> response.text.<span class="fn">strip</span>().<span class="fn">lower</span>() == <span class="st">'true'</span>

<span class="dc">@app.post</span>(<span class="st">'/auth/verify-2fa'</span>)
<span class="kw">async def</span> <span class="fn">verify_2fa</span>(pin: <span class="dc">str</span>, current_user = <span class="fn">Depends</span>(get_current_user)):
    secret = <span class="kw">await</span> <span class="fn">get_user_secret</span>(current_user.id)
    <span class="kw">if not await</span> <span class="fn">validate_totp</span>(pin, secret):
        <span class="kw">raise</span> <span class="fn">HTTPException</span>(status_code=<span class="st">401</span>, detail=<span class="st">'Invalid 2FA code'</span>)
    <span class="kw">return</span> {<span class="st">'status'</span>: <span class="st">'verified'</span>}</pre>

        <div class="section-heading">Security Checklist for Python</div>
        <ul style="font-size:15px;line-height:2;color:#444;">
            <li>&#9989; Use <code>secrets.choice()</code> not <code>random.choice()</code> for secret generation</li>
            <li>&#9989; Encrypt secrets at rest using <code>cryptography.fernet</code> or Django's field encryption</li>
            <li>&#9989; Always use HTTPS when calling the API</li>
            <li>&#9989; Catch <code>requests.RequestException</code> and fail gracefully</li>
            <li>&#9989; Rate-limit TOTP verification attempts per user</li>
            <li>&#9989; Regenerate session tokens after successful 2FA (<code>session.cycle_key()</code> in Django)</li>
            <li>&#9989; Don't log the <code>SecretCode</code> value — scrub it from any request logging</li>
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
