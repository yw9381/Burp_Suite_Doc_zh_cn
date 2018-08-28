<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../../../../../styles/css/ps.css">
</head>
<body>
<section class="container ps-breadcrumbs">
    <ol>
        <li>
            <a href="https://support.portswigger.net/">Support Center</a>
        </li>
        <li>
            <a href="../../../../index.html">Documentation</a>
        </li>
        <li>
            <a href="../../../index.html">Desktop Editions</a>
        </li>
        <li>
            <a href="../../index.html">Tools</a>
        </li>
        <li>
            <a href="../index.html">Proxy</a>
        </li>
        <li>
            <a href="index.html">Options</a>
        </li>
        <li>
            <a href="installing-ca-certificate.html">Install CA Certificate</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Installing Burp&#39;s CA Certificate</h1>
        <p>
            By default, when you browse an HTTPS website via Burp, the Proxy generates an SSL certificate for each host,
            signed by its own Certificate Authority (CA) certificate. This CA certificate is generated the first time
            Burp is run, and stored locally. To use Burp Proxy most effectively with HTTPS websites, you will need to
            install Burp's CA certificate as a trusted root in your browser.
        </p>
        <p>
            <strong>Note:</strong> If you install a trusted root certificate in your browser, then an attacker who has
            the private key for that certificate may be able to man-in-the-middle your SSL connections without obvious
            detection, even when you are not using an intercepting proxy. To protect against this, Burp generates a
            unique CA certificate for each installation, and the private key for this certificate is stored on your
            computer, in a user-specific location. If untrusted people can read local data on your computer, you may not
            wish to install Burp's CA certificate.
        </p>
        <div class="rounded-corner-box">
            <p>
                For full instructions on installing Burp's CA certificate in your browser, please refer to the following
                article in the <a href="https://support.portswigger.net/">Burp Suite Support Center</a>:
            </p>
            <ul class="link-list">
                <li>
                    <a href="https://support.portswigger.net/customer/portal/articles/1783075-installing-burp-s-ca-certificate-in-your-browser"> Installing Burp's CA Certificate in your browser</a>
                </li>
            </ul>
            <p>
                This article contains detailed steps for installing the CA certificate on various common browsers and
                mobile devices.
            </p>
        </div>
    </div>
</section>
</body>
</html>