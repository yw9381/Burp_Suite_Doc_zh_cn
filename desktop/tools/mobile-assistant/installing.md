<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../../../../styles/css/ps.css">
</head>
<body>
<section class="container ps-breadcrumbs">
    <ol>
        <li>
            <a href="https://support.portswigger.net/">Support Center</a>
        </li>
        <li>
            <a href="../../../index.html">Documentation</a>
        </li>
        <li>
            <a href="../../index.html">Desktop Editions</a>
        </li>
        <li>
            <a href="../index.html">Tools</a>
        </li>
        <li>
            <a href="index.html">Mobile Assistant</a>
        </li>
        <li>
            <a href="installing.html">Installing Burp Suite Mobile Assistant</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Installing Burp Suite Mobile Assistant</h1>
        <div class="rounded-corner-box">
            <p>
                <strong>Note:</strong> Burp Suite Mobile Assistant needs to be installed onto a jailbroken device due to
                the nature of its features. Jailbreaks usually install the popular package manager Cydia which can be
                used to install Mobile Assistant. Advanced users may prefer to obtain Mobile Assistant directly. They
                can do this by pointing a web browser to Burp Suite's in-browser interface, e.g.
                http://[burp-host-ip]:8080/mobileassistant.deb. Although Cydia is not strictly necessary, Mobile
                Assistant depends on <a href="https://www.theiphonewiki.com/wiki/Cydia_Substrate">Cydia Substrate</a>.
            </p>
        </div>
        <p>
            Use the following steps to install Burp Suite Mobile Assistant using Cydia:
        </p>
        <ol>
            <li>
                Launch Burp Suite on a system that is network-accessible from the jailbroken device, and ensure the
                proxy listener is bound to an accessible network interface and port.
            </li>
            <li>
                On the jailbroken device, open Cydia and navigate to the Sources tab.
            </li>
            <li>
                Tap the Edit button located at the top right-hand corner.
            </li>
            <li>
                Tap the Add button located at the top left-hand corner.
            </li>
            <li>
                Populate the APT URL prompt with the IP address (or hostname) and port number of your Burp Proxy
                listener, using HTTP as the protocol, e.g. http://[burp-host-ip]:8080. If Cydia is not able to connect,
                verify that your Burp Proxy listener is configured to listen on the relevant network interface, and that
                connections are not being blocked by your computer's host firewall or by device segregation in your
                wireless network.
            </li>
            <li>
                Tap the Done button to finish.
            </li>
            <li>
                Install Mobile Assistant from the new Cydia package source in the normal way. Either search for Mobile
                Assistant or browse the new source's packages and tap Install.
            </li>
        </ol>
    </div>
</section>
</body>
</html>