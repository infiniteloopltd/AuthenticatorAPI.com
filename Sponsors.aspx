<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sponsors.aspx.cs" Inherits="AuthenticatorAPI.Sponsors" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Sponsors - AuthenticatorAPI.com</title>

    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,400italic,700,900' rel='stylesheet' type='text/css'>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Support AuthenticatorAPI.com - a free, open source 2FA API by Infinite Loop Development Ltd">
    <meta name="author" content="Infinite Loop Development Ltd">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="Techie.css" rel="stylesheet">

    <style>
        body, html { overflow-x: hidden; }
        body { padding: 60px 20px 0; }

        footer {
            border-top: 1px solid #ddd;
            padding: 30px;
            margin-top: 50px;
            text-align: center;
            font-size: 0.9em;
            color: #666;
        }

        /* Hero CTA banner */
        .sponsor-hero {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            color: #fff;
            border-radius: 8px;
            padding: 50px 40px;
            text-align: center;
            margin-bottom: 40px;
        }
        .sponsor-hero h2 {
            font-size: 2.2em;
            font-weight: 900;
            margin-bottom: 15px;
            color: #fff;
        }
        .sponsor-hero p {
            font-size: 1.2em;
            max-width: 680px;
            margin: 0 auto 30px;
            color: rgba(255,255,255,0.9);
        }
        .btn-sponsor {
            background-color: #f39c12;
            color: #fff;
            font-size: 1.3em;
            font-weight: 700;
            padding: 14px 40px;
            border-radius: 4px;
            border: none;
            text-decoration: none;
            display: inline-block;
            transition: background 0.2s;
        }
        .btn-sponsor:hover {
            background-color: #e67e22;
            color: #fff;
            text-decoration: none;
        }
        .btn-sponsor .glyphicon {
            margin-right: 8px;
        }

        /* Stats row */
        .stats-row {
            text-align: center;
            margin: 30px 0;
        }
        .stat-box {
            display: inline-block;
            padding: 15px 30px;
            margin: 5px;
            background: #f9f9f9;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
        }
        .stat-box .stat-number {
            font-size: 2em;
            font-weight: 900;
            color: #2c3e50;
            display: block;
        }
        .stat-box .stat-label {
            font-size: 0.85em;
            color: #888;
        }

        /* Section styling */
        .section-title {
            border-left: 4px solid #3498db;
            padding-left: 15px;
            margin: 40px 0 20px;
        }

        /* Arctic vault badge */
        .vault-badge {
            background: #1a1a2e;
            color: #fff;
            border-radius: 6px;
            padding: 20px 25px;
            margin: 20px 0;
        }
        .vault-badge h4 {
            color: #f39c12;
            margin-top: 0;
        }
        .vault-badge ul {
            margin-bottom: 0;
            padding-left: 20px;
        }
        .vault-badge li {
            color: rgba(255,255,255,0.85);
            margin-bottom: 5px;
        }
        .vault-badge li a {
            color: #87ceeb;
        }
        .vault-badge li a:hover {
            color: #fff;
        }

        /* Sponsor cards */
        .sponsor-card {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 30px;
            margin-bottom: 30px;
            background: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
            transition: box-shadow 0.2s;
        }
        .sponsor-card:hover {
            box-shadow: 0 4px 16px rgba(0,0,0,0.12);
        }
        .sponsor-card .sponsor-logo {
            max-height: 60px;
            max-width: 180px;
            object-fit: contain;
            margin-bottom: 15px;
        }
        .sponsor-card .sponsor-avatar {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            border: 2px solid #e0e0e0;
            float: left;
            margin-right: 15px;
            margin-bottom: 5px;
        }
        .sponsor-card .sponsor-name {
            font-weight: 700;
            font-size: 1.1em;
        }
        .sponsor-card .sponsor-tier {
            display: inline-block;
            font-size: 0.75em;
            background: #f39c12;
            color: #fff;
            border-radius: 20px;
            padding: 2px 10px;
            margin-left: 8px;
            vertical-align: middle;
            font-weight: 700;
            letter-spacing: 0.5px;
        }
        .clearfix::after { content: ""; display: table; clear: both; }

        /* How to sponsor */
        .how-to-box {
            background: #f4f9ff;
            border: 1px solid #c8dff5;
            border-radius: 6px;
            padding: 25px 30px;
            margin: 30px 0;
        }
        .how-to-box ol {
            padding-left: 20px;
            margin-bottom: 0;
        }
        .how-to-box li {
            margin-bottom: 10px;
            font-size: 1.05em;
        }
    </style>
</head>

<body>

    <div class="container">

        <div class="jumbotron">
            <img src="auth.png" style="float: left; margin-top:30px" width="50" />
            <h1>Authenticator API.com</h1>
            <p>An API for Google Authenticator</p>
        </div>

        <div class="row">
            <div class="col-md-10 col-md-offset-1">

                <!-- HERO CTA -->
                <div class="sponsor-hero">
                    <h2>
                        <span class="glyphicon glyphicon-heart"></span>
                        Support an Open Source Project
                    </h2>
                    <p>
                        AuthenticatorAPI.com is <strong>free to use and fully open source</strong>. It runs on real servers
                        with real costs. If this API has saved you time or helped secure your users,
                        please consider becoming a GitHub Sponsor to help keep the lights on.
                    </p>
                    <a href="https://github.com/sponsors/infiniteloopltd" target="_blank" class="btn-sponsor">
                        <span class="glyphicon glyphicon-heart"></span> Sponsor on GitHub
                    </a>
                    <p style="margin-top:15px; font-size:0.9em; color:rgba(255,255,255,0.7);">
                        Every contribution, large or small, goes directly toward server and infrastructure costs.
                    </p>
                </div>

                <!-- STATS -->
                <div class="stats-row">
                    <div class="stat-box">
                        <span class="stat-number">Free</span>
                        <span class="stat-label">Always &amp; Forever</span>
                    </div>
                    <div class="stat-box">
                        <span class="stat-number">Open</span>
                        <span class="stat-label">Source on GitHub</span>
                    </div>
                    <div class="stat-box">
                        <span class="stat-number">2FA</span>
                        <span class="stat-label">TOTP Compatible</span>
                    </div>
                    <div class="stat-box">
                        <span class="stat-number">0</span>
                        <span class="stat-label">Data Stored</span>
                    </div>
                </div>

                <hr>

                <!-- ABOUT INFINITE LOOP -->
                <h3 class="section-title">About Infinite Loop Development Ltd</h3>

                <p>
                    <strong>Infinite Loop Development Ltd</strong> is a small Irish software development company,
                    founded in 2004. Many of our projects are open sourced for the benefit of the developer community.
                    We believe in giving back — building tools that others can use, inspect, and build upon freely.
                </p>
                <p>
                    We are proud to be an <strong>Arctic Code Vault Contributor</strong>, recognised by GitHub for
                    contributions that have been preserved for future generations in the Arctic World Archive. Our
                    contributions span several widely-used open source ecosystems:
                </p>

                <!-- Arctic Vault Badge -->
                <div class="vault-badge">
                    <h4>
                        <span class="glyphicon glyphicon-snow"></span>
                        &nbsp; Arctic Code Vault Contributor
                    </h4>
                    <ul>
                        <li>
                            <a href="https://github.com/CocoaPods/Specs" target="_blank">CocoaPods/Specs</a>
                            &mdash; the central repository for iOS &amp; macOS library specifications
                        </li>
                        <li>
                            <a href="https://github.com/apache/cordova-docs" target="_blank">apache/cordova-docs</a>
                            &mdash; documentation for the Apache Cordova cross-platform mobile framework
                        </li>
                        <li>
                            <a href="https://github.com/zchee/golang-wiki" target="_blank">zchee/golang-wiki</a>
                            &mdash; a comprehensive Go programming language wiki
                        </li>
                    </ul>
                </div>

                <p>
                    Our most popular open source repository is
                    <a href="https://github.com/infiniteloopltd/AuthenticatorAPI.com" target="_blank">
                        <strong>infiniteloopltd/AuthenticatorAPI.com</strong></a>,
                    where we have helped countless developers secure their apps and websites using
                    Google Authenticator-compatible two-factor authentication (TOTP). The codebase is free to
                    inspect, self-host, and contribute to.
                </p>
                <p>
                    Learn more about us at
                    <a href="https://www.infiniteloop.ie" target="_blank">www.infiniteloop.ie</a>.
                </p>

                <hr>

                <!-- WHY SPONSOR -->
                <h3 class="section-title">Why Sponsor?</h3>

                <p>
                    Running a public API service isn't free. Server hosting, bandwidth, maintenance, and SSL certificates
                    all incur real costs. While this API will always remain free to use, your sponsorship directly
                    helps ensure it stays online, fast, and well-maintained.
                </p>

                <div class="how-to-box">
                    <h4>How GitHub Sponsors works</h4>
                    <ol>
                        <li>Visit our <a href="https://github.com/sponsors/infiniteloopltd" target="_blank">GitHub Sponsors page</a>.</li>
                        <li>Choose a one-time or recurring monthly contribution amount.</li>
                        <li>GitHub processes payment — 100% goes to the project (GitHub charges no fees).</li>
                        <li>You'll appear on our sponsors list and have our sincere gratitude.</li>
                    </ol>
                </div>

                <div style="text-align:center; margin: 30px 0;">
                    <a href="https://github.com/sponsors/infiniteloopltd" target="_blank" class="btn-sponsor">
                        <span class="glyphicon glyphicon-heart"></span> Become a Sponsor
                    </a>
                </div>

                <hr>

                <!-- CURRENT SPONSORS -->
                <h3 class="section-title">Our Sponsors</h3>
                <p>
                    We are deeply grateful to the following sponsors for their generous support.
                    Their contributions keep this project running.
                </p>

                <!-- Sponsor 1: kathyIIS -->
                <div class="sponsor-card">
                    <div class="clearfix">
                        <img src="https://avatars.githubusercontent.com/u/76708060?v=4"
                             alt="kathyIIS avatar"
                             class="sponsor-avatar" />
                        <div>
                            <span class="sponsor-name">
                                <a href="https://github.com/kathyIIS" target="_blank">kathyIIS</a>
                                <span class="sponsor-tier">Sponsor</span>
                            </span>
                        </div>
                    </div>
                    <div style="margin-top:15px;">
                        <a href="https://www.inf-systems.com" target="_blank">
                            <img src="https://www.inf-systems.com/wp-content/uploads/2024/09/IIS_Logo_Colour-370x148-1.png"
                                 alt="Infinite Investment Systems"
                                 class="sponsor-logo" />
                        </a>
                        <p style="margin-top:10px;">
                            <strong><a href="https://www.inf-systems.com" target="_blank">Infinite Investment Systems Ltd.</a></strong>
                            is a specialist provider of portfolio management software for wealth managers and investment firms.
                            Their flagship product, <em>Harmony</em>, is a comprehensive, cloud-ready platform trusted by
                            leading portfolio managers across North America. IIS brings decades of financial technology expertise,
                            integrating with major custodians, data providers, and reporting platforms to streamline operations
                            for investment professionals.
                        </p>
                    </div>
                </div>

                <!-- Sponsor 2: rhods-salazar -->
                <div class="sponsor-card">
                    <div class="clearfix">
                        <img src="https://avatars.githubusercontent.com/u/255257528?v=4"
                             alt="rhods-salazar avatar"
                             class="sponsor-avatar" />
                        <div>
                            <span class="sponsor-name">
                                <a href="https://github.com/rhods-salazar" target="_blank">rhods-salazar</a>
                                <span class="sponsor-tier">Sponsor</span>
                            </span>
                        </div>
                    </div>
                    <div style="margin-top:15px;">
                        <a href="https://scenariocloud.com" target="_blank">
                            <img src="https://scenariocloud.com/wp-content/uploads/2024/06/Scenario.svg"
                                 alt="Scenario Cloud"
                                 class="sponsor-logo" />
                        </a>
                        <p style="margin-top:10px;">
                            <strong><a href="https://scenariocloud.com" target="_blank">Scenario &mdash; Project Insights Live</a></strong>
                            is a cloud-based project intelligence platform that gives teams real-time visibility into
                            project health, risks, and performance. Scenario helps organisations make better decisions
                            faster by surfacing actionable insights from project data, enabling proactive management
                            rather than reactive firefighting. Built for modern project-driven businesses, it connects
                            seamlessly with existing tools and workflows.
                        </p>
                    </div>
                </div>

                <hr>

                <!-- OPEN SOURCE LINK -->
                <div style="text-align:center; margin: 20px 0 10px;">
                    <p>
                        <span class="glyphicon glyphicon-console"></span>
                        &nbsp; View the full source code on
                        <a href="https://github.com/infiniteloopltd/AuthenticatorAPI.com" target="_blank">
                            <strong>GitHub</strong>
                        </a>
                        &mdash; contributions and pull requests are always welcome.
                    </p>
                    <a href="https://github.com/sponsors/infiniteloopltd" target="_blank" class="btn-sponsor">
                        <span class="glyphicon glyphicon-heart"></span> Sponsor This Project
                    </a>
                </div>

            </div>
        </div>

    </div>

    <footer>
        <p>
            &copy; 2026 <a href="http://www.infiniteloop.ie">Infinite Loop Development Ltd</a> &nbsp;|&nbsp;
            <a href="/contact.aspx">Contact Us</a> &nbsp;|&nbsp;
            <a href="/privacy.aspx">Privacy Policy</a> &nbsp;|&nbsp;
            <a href="/sponsors.aspx">Sponsors</a>
        </p>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>