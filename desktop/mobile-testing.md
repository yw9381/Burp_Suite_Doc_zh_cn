<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../../styles/css/ps.css">
</head>
<body>
<section class="container ps-breadcrumbs">
    <ol>
        <li>
            <a href="https://support.portswigger.net/">Support Center</a>
        </li>
        <li>
            <a href="../index.html">Documentation</a>
        </li>
        <li>
            <a href="index.html">Desktop Editions</a>
        </li>
        <li>
            <a href="mobile-testing.html">Mobile Testing</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Mobile Testing</h1>
        <p>
            You can use Burp Suite for performing security testing of mobile applications. To do this, you simply need to configure the mobile device to proxy its traffic via Burp Proxy. You can then intercept, view, and modify all of the HTTP/S requests and responses processed by the mobile app, and carry out <a href="penetration-testing/index.html">penetration testing using Burp</a> in the normal way.
        </p>
        <p>
            Successfully intercepting HTTP/S traffic from mobile applications can be non-trivial, due to problems setting the necessary proxy configuration, or due to SSL certificate pinning.
        </p>
<p>
            Burp Suite Mobile Assistant is a tool to facilitate testing of iOS apps with Burp Suite. It supports the
            following key functions:
        </p>
        <ul>
            <li>
                It can modify the system-wide proxy settings of iOS devices so that HTTP(S) traffic can be easily
                redirected to a running instance of Burp.
            </li>
            <li>
                It can attempt to circumvent SSL certificate pinning in selected apps, allowing Burp Suite to break
                their HTTPS connections and intercept, inspect and modify all traffic.
            </li>
        </ul>
        <p>
            Burp Suite Mobile Assistant currently supports mobile devices running iOS versions 8.0 and onwards.
        </p>
        <div class="rounded-corner-box">
            <p>
                Use the links below for more details:
            </p>
            <ul class="link-list">
                <li>
                    <a href="tools/mobile-assistant/installing.html">Installing Mobile Assistant</a>
                </li>
                <li>
                    <a href="tools/mobile-assistant/index.html">Using Mobile Assistant</a>
                </li>
            </ul>
        </div>
        <div class="rounded-corner-box">
            <p>
                <strong>Note:</strong> Burp Suite Mobile Assistant should not be used in situations where availability,
                confidentiality or integrity of data is required. Mobile Assistant changes injected apps in a way that
                significantly reduces the security of their communications.
            </p>
        </div>
    </div>
</section>
</body>
</html>