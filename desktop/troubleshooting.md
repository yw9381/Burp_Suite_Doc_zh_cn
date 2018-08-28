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
            <a href="troubleshooting.html">Troubleshooting</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Troubleshooting</h1>
        <p>
            If you are new to Burp and are having problems, please first read the help on <a href="getting-started/index.html">Getting Started with Burp Suite</a>, and follow the instructions there.
            Otherwise, the problems and solutions below might help you.
        </p>
        <h4>Burp doesn't run</h4>
        
<p>Make sure you have a <a href="getting-started/index.html#launching-burp"> suitable version of Java installed</a>. Then <a href="getting-started/index.html#launching-burp"> start Burp
                from the command line</a>. Look at any error messages or other output that appears on the command line,
                which should indicate the cause of the problem.
                </p>
<h4>I get an error message saying NoClassDefFoundError</h4>
<p>
    When running Burp from the command
    line, make sure you have included the
    <span class="InlineCode">-jar</span>
    argument followed by the location of the Burp JAR file. If you're still having problems, check that your
    command is launching the correct version of Java. Run the command
    <span class="InlineCode">java -version</span>
    and confirm that the version being executed is 1.6 or later. If you have installed a later version of
    Java but an older version is still being executed, then replace "java" with an absolute path to the
    correct java executable on your system. If you're still having problems, your Java installation might be
    corrupted, so reinstall it.
</p>
<p>
    If you get this error message when trying to launch Burp with a
    Burp Extender plugin, then check that your BurpExtender class is declared in the burp package, and
    resides inside a folder called burp within your extension's JAR file.
</p>
<h4>I've unpacked the Burp JAR file. What next?</h4>
                <p>
You don't need to unpack or unzip the Burp
                JAR file. This probably happened because your computer is associating the .JAR file extension with some
                unarchiving software. You can change this association to associate with Java, or better, you can <a href="getting-started/index.html#launching-burp"> start Burp from the command line</a>.
                </p>
                <h4>My browser can't make any requests</h4>
                <p>
If your browser is always waiting and not showing any
                actual content, then please try the following steps. After each step, check whether you are still having
                problems, and only continue to the next step if things are not working.
                </p>
        <ol>
                    <li>
                        In Burp, go to the Proxy tab, and the Intercept sub-tab. If this is showing an intercepted HTTP
                        request, then turn off interception (click on the "Intercept is on" button to toggle the
                        interception status). Your browser should now work as normal. See <a href="tools/proxy/getting-started.html">Getting Started with Burp Proxy</a> for more help on the
                        basics of using Burp Proxy.
                    </li>
                    <li>
                        Try visiting another domain with your browser (ideally a well-known public domain). If this
                        works, then the problem might relate to the specific web site you originally visited.
                    </li>
                    <li>
                        Go to the Proxy tab, and the Options sub-tab. In the Proxy Listeners section, the table should
                        show at least one entry where the Running checkbox is checked. If this is unchecked, try to
                        check it. If the box cannot be checked, and the Alerts tab shows a message saying "Failed to
                        start proxy service" then Burp is not able to open the specified port and interface. This is
                        often because the port is in use by another process. Select the item in the table, click the
                        "Edit" button, and change the port number to a different one. Click "OK" and see whether the
                        listener can now be enabled. You may need to try a few different ports, or query your computer's
                        configuration to locate an available port. Then proceed to the next step to update your
                        browser's proxy configuration with the new port number.
                    </li>
                    <li>
                        Check that your browser's proxy settings are correctly configured, and are using the same IP
                        address and port number as configured in a running Proxy listener (in Burp's default settings,
                        this is IP address 127.0.0.1 and port 8080, may be different in your current configuration). For
                        further details, see <a href="getting-started/projects.html"> Configuring Your Browser</a>.
                    </li>
                    <li>
                        In Burp, go to the Options tab, and the Connections sub-tab. In the "Upstream Proxy Servers"
                        section, confirm whether any upstream proxies are configured, and if so whether these settings
                        are correct for your network's setup.
                    </li>
                    <li>
                        Make some more requests from your browser (e.g. press refresh a few times). Look in the Alerts
                        tab to see if any new entries are being generated. If so, these entries might indicate the cause
                        of the problem.
                    </li>
                    <li>
                        Go to the Burp menu, and select "Restore defaults" for all options. Then close Burp down
                        gracefully by selecting "Exit" from the Burp menu. Start Burp again. Shut down all your browser
                        instances, and then open a new browser window.
                        
                    </li>
                </ol>
        <h4>Burp isn't intercepting anything</h4>
        <p>
            In Burp, go to the Proxy tab, and the History sub-tab.
            Make some more requests from your browser (e.g. press refresh a few times), and check whether any new
            entries are appearing in the Proxy history. If so, then Burp is processing your browser traffic but is
            not presenting any messages for interception. Go to the Proxy Intercept tab, and enable master
            interception (click on the "Intercept is off" button to toggle the interception status). Then go to the
            Proxy Options tab, and click the "Restore defaults" button in the "Intercept Client Requests" and
            "Intercept Server Responses" sections. Make some more requests from your browser, and these should now
            appear in the Proxy Intercept tab.
        </p>
        <p>
            If your browser is loading pages correctly but no items are
            appearing in the Proxy history, you need to check your browser proxy settings. Your browser should be
            configured to use Burp for both HTTP and HTTPS; any "automatic" proxy options should be disabled, and
            any "exceptions" to the proxy settings should be removed. If you are unsure, follow carefully the steps
            in <a href="penetration-testing/configuring-your-browser.html"> Configuring Your Browser</a> to ensure your browser is
            correctly set up.
        </p>
        <h4>Burp isn't intercepting HTTPS requests</h4>
        <p>
            If your browser is sending HTTP requests through
            Burp, but not HTTPS requests, then your browser is probably configured to proxy only HTTP. Check in your
            browser proxy settings that the browser is configured to use Burp for both protocols. If you are unsure,
            follow carefully the steps in <a href="getting-started/projects.html"> Configuring Your Browser</a> to ensure your browser is correctly set up.
                </p>
        <h4>HTTPS websites don't work properly</h4>
        <p>
            If your browser is able to load HTTPS websites via
            Burp, but these do not function properly (e.g. the user interface is not complete or fully functional),
            then the application is probably attempting to load script code or other resources over HTTPS from
            another domain, and your browser is generating a security alert when loading these resources via Burp.
            You need to <a href="tools/proxy/options/installing-ca-certificate.html"> install Burp's CA certificate in your
                browser</a>, to ensure that applications using HTTPS function properly. 
                </p>
        <h4>I get authentication failures when using Burp</h4>
        <p>  
            If the application you are testing uses
            platform authentication (which normally shows as a popup login dialog within your browser), and you get
            authentication failure messages when your browser is configured to use Burp, then you need to configure
            Burp to handle the platform authentication instead of your browser. Go to the Options tab, and the
            Connections sub-tab, and the Platform Authentication section. Add a new entry for each hostname used by
            your application, configuring the authentication type and your credentials. If you aren't sure of the
            authentication type, then first try NTLMv2, then NTLMv1, and then the other types. You may need to close
            all browser windows and open a new browser window, to prevent any browser caching from interfering with
            the authentication process.</p>
        <h4>Burp runs out of memory</h4>
        <p>
            Burp is constrained by the amount of memory that your computer
            makes available to the Java process. You can request additional memory for Burp by starting Burp from
            the command line using the -Xmx argument. See <a href="getting-started/index.html#launching-burp">Launching
                Burp</a> for more details.
                </p>
                <h4>How do I run a scan?</h4>
        <p>
                    You can launch an automated crawl-and-audit scan simply by clicking "New scan" on the Burp dashboard and supplying the start URL. You can also launch scans in various other ways. See <a href="scanning/index.html">Scanning web sites</a> for more details.
                </p>
</div>
</section>
</body>
</html>