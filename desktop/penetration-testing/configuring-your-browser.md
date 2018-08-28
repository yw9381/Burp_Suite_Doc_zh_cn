<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../../../styles/css/ps.css">
</head>
<body>
<section class="container ps-breadcrumbs">
    <ol>
        <li>
            <a href="https://support.portswigger.net/">Support Center</a>
        </li>
        <li>
            <a href="../../index.html">Documentation</a>
        </li>
        <li>
            <a href="../index.html">Desktop Editions</a>
        </li>
        <li>
            <a href="index.html">Penetration Testing</a>
        </li>
        <li>
            <a href="configuring-your-browser.html">Configuring Your Browser</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Configuring Your Browser to Work With Burp Suite</h1>
        <p>
            Burp is designed to be used alongside your browser. Burp functions as an HTTP proxy server, and all HTTP/S
            traffic from your browser passes through Burp. To do any kind of testing with Burp, you need to configure
            your browser to work with it.
        </p>
        <p>
            Firstly, you need to confirm that Burp's Proxy listener is active and working. Go to the Proxy tab, then the
            Options sub-tab, and look in the Proxy Listeners section. You should see an entry in the table with the
            checkbox ticked in the Running column, and "127.0.0.1:8080" showing in the Interface column. If this is not
            the case, try pressing the "Restore defaults" button to the left of the panel. If the listener is still not
            running, then Burp was not able to open the default Proxy listener port (8080). You will need to select the
            table entry, click "Edit", and change the port number of the listener to a different number. See the <a href="../tools/proxy/options/index.html#proxy-listeners">Proxy listeners</a> help for more details.
        </p>
        <p>
            Secondly, you need to configure your browser to use the Burp Proxy listener as its HTTP proxy server. To do
            this, you need to change your browser's proxy settings to use the proxy host address (by default, 127.0.0.1)
            and port (by default, 8080) for both HTTP and HTTPS protocols, with no exceptions. The details of how to do
            this vary by browser and version, but are roughly as follows:
        </p>
        <ul>
            <li>
                <strong>Internet Explorer</strong> - Go to the Tools menu, select Internet Options, go to the
                Connections tab, and click on the "LAN settings" button. Make sure the "Automatically detect settings"
                box is unchecked. Make sure the "Use automatic configuration script" box is unchecked. Make sure the
                "Use a proxy server for your LAN" box is checked. Enter your Burp Proxy listener address in the
                "Address" field (by default, 127.0.0.1). Enter your Burp Proxy listener port in the "Port" field (by
                default, 8080). Make sure the "Bypass proxy server for local addresses" box is unchecked. Then click on
                the "Advanced" button. Make sure the "Use the same proxy server for all protocols" box is checked.
                Delete anything that appears in the "Exceptions" field. Then click "OK" to close all of the options
                dialogs.
            </li>
            <li>
                <strong>Chrome</strong> - The Chrome browser picks up the HTTP proxy settings configured on the host
                computer. If you are using Chrome, you can open your computer's built-in browser and follow the
                instructions for configuring that. If you aren't sure where the built-in proxy settings are, open
                Chrome, go to the Customize menu, select Settings, click on "Show advanced settings", and click the
                "Change proxy settings ..." button. This will open the relevant configuration options for your host
                computer.
            </li>
            <li>
                <strong>Firefox</strong> - Go to the Firefox menu, click on Options, click on Advanced, go to the
                Network tab, and click on the Settings button in the Connection section. Select the "Manual proxy
                configuration" radio button. Enter your Burp Proxy listener address in the "HTTP proxy" field (by
                default, 127.0.0.1). Enter your Burp Proxy listener port in the "Port" field (by default, 8080). Make
                sure the "Use this proxy server for all protocols" box is checked. Delete anything that appears in the
                "No proxy for" field. Then click "OK" to close all of the options dialogs.
            </li>
            <li>
                <strong>Safari</strong> - Go the Safari menu, click on Preferences, click on Advanced, and by the
                Proxies label click the "Change Settings" button. This will open the Network configuration settings for
                your current network adapter. In the Proxies tab, check the "Web Proxy (HTTP)" box, and enter your Burp
                Proxy listener address in the "Web Proxy Server" field (by default, 127.0.0.1), and your Burp Proxy
                listener port in the (unlabeled) port field (by default, 8080). Ensure the "Bypass proxy settings for
                these Hosts &amp; Domains" box is empty. Repeat these steps for the "Secure Web Proxy (HTTPS)" checkbox.
                Click "OK" and "Apply" and close the open dialogs.
            </li>
        </ul>
        <p>
            When you've configured your browser, you need to test that it is working properly. With Burp running, in
            your browser go to any HTTP URL (don't use HTTPS for the moment). Your browser should sit waiting for the
            request to complete. In Burp, go to the Proxy tab, and then the Intercept sub-tab. These tabs should be
            highlighted, and there should be an HTTP request showing in the main panel. Click on the "Intercept is on"
            button so that it says "Intercept is off". Go back to your browser, and you should (shortly) see the URL you
            requested being loaded in the normal way. If things aren't working in the way described, please refer to the <a href="../troubleshooting.html">troubleshooting help</a>.
        </p>
        <p>
            Finally, you need to configure your browser to be able to send HTTPS requests through Burp without any
            problems. This step isn't strictly necessary to use Burp in a basic way or only for non-HTTPS URLs, but it
            only needs to be done once and is necessary to get the most out of Burp when testing applications that use
            HTTPS. The reason for this requirement is that Burp breaks SSL connections between your browser and
            destination web servers, in order to view and modify the plain contents of HTTPS messages. SSL is designed
            to prevent this happening, and so by default your browser will show a security warning when you visit an
            HTTPS URL using Burp. To ensure that applications using HTTPS function properly, you need to install Burp's
            Certificate Authority (CA) SSL certificate in your browser trust store. For detailed help on doing this,
            please refer to the <a href="../tools/proxy/options/installing-ca-certificate.html"> help on installing Burp's CA
            certificate</a>. When you have done this, you can confirm things are working properly by closing all your
            browser windows, opening a new browser and visiting any HTTPS URL. The browser should not display any
            security warnings, and the page should load in the normal way (you will need to turn off interception again
            in the Proxy Intercept tab if you have re-enabled this).
        </p>
    </div>
</section>
</body>
</html>