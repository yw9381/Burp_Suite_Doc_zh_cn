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
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Burp Proxy Options</h1>
        <p>
            This tab contains Burp Proxy settings for <a href="#proxy-listeners"> Proxy listeners</a>, <a href="#intercepting-http-requests-and-responses"> intercepting HTTP requests and responses</a>, <a href="#intercepting-websockets-messages">intercepting
            WebSockets messages</a>, <a href="#response-modification">response modification</a>, <a href="#match-and-replace">match and
            replace</a>, <a href="#ssl-pass-through">SSL pass through</a>, and <a href="#miscellaneous"> miscellaneous</a> options.
        </p>
        <h2 id="proxy-listeners">Proxy Listeners</h2>
        <p>
            A Proxy listener is a local HTTP proxy server that listens for incoming connections from your browser. It
            allows you to monitor and intercept all requests and responses, and lies at the heart of Burp's <a href="../../../penetration-testing/index.html">user-driven workflow</a>. By default, Burp creates a single listener on port
            8080 of the loopback interface. To use this listener, you need to <a href="../../../getting-started/projects.html">configure your browser</a> to use 127.0.0.1:8080 as its proxy
            server. This default listener is all that is required for testing virtually all browser-based web
            applications.
        </p>
        <p>
            Burp lets you create multiple Proxy listeners, and provides a wealth of configuration options for
            controlling their behavior. You may occasionally need to use these options when testing unusual
            applications, or working with some non-browser-based HTTP clients.
        </p>
        <h3 id="binding">Binding</h3>
        <p>
            These settings control how Burp binds the Proxy listener to a local network interface:
        </p>
        <ul>
            <li>
                <strong>Bind to port</strong> - This is the port on the local interface that will be opened to listen
                for incoming connections. You will need to use a free port that has not been bound by another
                application.
            </li>
            <li>
                <strong>Bind to address</strong> - This is the IP address of the local interface that Burp will bind to.
                You can bind to just the loopback interface, or to all interfaces, or to any specific local IP address. <strong>Note:</strong> if the listener is bound to all interfaces or to a specific non-loopback
                interface, then other computers may be able to connect to the listener. This may enable them to initiate
                outbound connections originating from your IP address, and to access the contents of the <a href="../history.html">Proxy history</a>, which may contain sensitive data such as login
                credentials. You should only enable this when you are located on a trusted network.
            </li>
        </ul>
        <h3 id="request-handling">Request Handling</h3>
        <p>
            These settings include options to control whether Burp redirects requests received by this listener:
        </p>
        <ul>
            <li>
                <strong>Redirect to host</strong> - If this option is configured, Burp will forward every request to the
                specified host, regardless of the target requested by the browser. Note that if you are using this
                option, it may be necessary to configure a <a href="#match-and-replace">match/replace rule</a> to rewrite the
                Host header in requests, if the server to which you are redirecting requests expects a Host header that
                differs from the one sent by the browser.
            </li>
            <li>
                <strong>Redirect to port</strong> - If this option is configured, Burp will forward every request to the
                specified port, regardless of the target requested by the browser.
            </li>
            <li>
                <strong>Force use of SSL</strong> - If this option is configured, Burp will use HTTPS in all outgoing
                connections, even if the incoming request used plain HTTP. You can use this option, in conjunction with
                the SSL-related <a href="#response-modification">response modification</a> options, to carry out sslstrip-like attacks
                using Burp, in which an application that enforces HTTPS can be downgraded to plain HTTP for a victim
                user whose traffic is unwittingly being proxied through Burp.
            </li>
        </ul>
        <p>
            Note that each of the redirection options can be used individually. So for example, you can redirect all
            requests to a particular host, while preserving the original port and protocol used in each original
            request.
        </p>
        <p>
            Burp's support for <strong>invisible proxying</strong> allows non-proxy-aware clients to connect directly to
            the listener. For more details see the <a href="invisible.html"> invisible proxying help</a>.
        </p>
        <h3 id="certificate">Certificate</h3>
        <p>
            These settings control the server SSL certificate that is presented to SSL clients. Use of these options can
            resolve some SSL issues that arise when using an intercepting proxy:
        </p>
        <ul>
            <li>
                You can eliminate SSL alerts in your browser, and the need to create SSL exceptions.
            </li>
            <li>
                Where web pages load SSL-protected items from other domains, you can ensure that these are properly
                loaded by the browser, without the need to first manually accept the proxy&#39;s SSL certificate for
                each referenced domain.
            </li>
            <li>
                You can work with thick client applications that refuse to connect to the server if an invalid SSL
                certificate is received.
            </li>
        </ul>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Use a self-signed certificate</strong> - A simple self-signed SSL certificate is presented to
                your browser, which always causes an SSL alert.
            </li>
            <li>
                <strong>Generate CA-signed per-host certificates</strong> - This is the default option. Upon
                installation, Burp creates a unique, self-signed Certificate Authority (CA) certificate, and stores this
                on your computer to use each time Burp is run. When your browser makes an SSL connection to a given
                host, Burp generates an SSL certificate for that host, signed by the CA certificate. You can <a href="installing-ca-certificate.html">install Burp&#39;s CA certificate</a> as a trusted root in
                your browser, so that the per-host certificates are accepted without any alerts. You can also <a href="#exporting-and-importing-the-ca-certificate">export the CA certificate</a> to use in other tools or other
                instances of Burp.
            </li>
            <li>
                <strong>Generate a CA-signed certificate with a specific hostname</strong> - This is similar to the
                preceding option; however, Burp will generate a single host certificate to use with every SSL
                connection, using the hostname you specify. This option is sometimes necessary when performing invisible
                proxying, because the client does not send a CONNECT request, and so Burp cannot identify the required
                hostname prior to the SSL negotiation. As previously, you can <a href="installing-ca-certificate.html">install Burp&#39;s CA certificate</a> as a trusted root.
            </li>
            <li>
                <strong>Use a custom certificate</strong> - This option enables you to load a specific certificate (in
                PKCS#12 format) to present to your browser. This option should be used if the application uses a client
                which requires a specific server certificate (e.g. with a given serial number or certification chain).
            </li>
        </ul>
        <h3 id="exporting-and-importing-the-ca-certificate">Exporting and Importing the CA Certificate</h3>
        <p>
            You can export your installation-specific CA certificate for use in other tools or in other instances of
            Burp, and you can import a certificate to use in the current instance of Burp. Click the "Import / export CA
            certificate" button to do this.
        </p>
        <p>
            You can choose to export the certificate only (for importing into the truststore of your browser or other
            device), or you can export both the certificate and its private key.
        </p>
        <p>
            <strong>Note:</strong> You should not disclose the private key for your certificate to any untrusted party.
            A malicious attacker in possession of your certificate and key may be able to intercept your browser's HTTPS
            traffic even when you are not using Burp.
        </p>
        <p>
            You can also export the certificate only by visiting http://burp/cert in your browser. This is the same
            certificate that Burp presents to your browser when it makes HTTPS requests, but the facility to download it
            via a URL is helpful when installing on some mobile devices.
        </p>
        <p>
            If you want to generate a new CA certificate, you can do this by clicking the "Regenerate CA certificate"
            button. You will need to restart Burp for the change to take effect, and then install the new certificate in
            your browser.
        </p>
        <h3 id="creating-a-custom-ca-certificate">Creating a Custom CA Certificate</h3>
        <p>
            You can use the following OpenSSL commands to create a custom CA certificate with your own details, such as
            CA name:
        </p>
        <p class="InlineCode">
            openssl req -x509 -days 730 -nodes -newkey rsa:2048 -outform der -keyout server.key -out ca.der
        </p>
        <p>
            [OpenSSL will prompt you to enter various details for the certificate. Be sure to enter suitable values for
            all the prompted items.]
        </p>
        <p class="InlineCode">
            openssl rsa -in server.key -inform pem -out server.key.der -outform der
        </p>
        <p class="InlineCode">
            openssl pkcs8 -topk8 -in server.key.der -inform der -out server.key.pkcs8.der -outform der -nocrypt
        </p>
        <p>
            Then click on the "Import / export CA certificate" button in Burp, and select "Cert and key in DER format".
            Select ca.der as the certificate file, and server.key.pkcs8.der as the key file. Burp will then load the
            custom CA certificate and begin using it to generate per-host certificates.
        </p>
        <h2 id="intercepting-http-requests-and-responses">Intercepting HTTP Requests and Responses</h2>
        <p>
            These settings control which requests and responses are stalled for viewing and editing in the <a href="../intercept.html">Intercept tab</a>. Separate settings are applied to requests and responses.
        </p>
        <p>
            The "Intercept" checkbox determines whether any messages are intercepted. If it is checked, then Burp
            applies the configured rules to each message to determine whether it should be intercepted.
        </p>
        <p>
            Individual rules can be activated or deactivated with the checkbox on the left of each rule. Rules can be
            added, edited, removed, or reordered using the buttons.
        </p>
        <p>
            Rules can be configured on practically any attribute of the message, including domain name, IP address,
            protocol, HTTP method, URL, file extension, parameters, cookies, header/body content, status code, MIME
            type, HTML page title, and Proxy listener port. You can configure rules to only intercept items for URLs
            that are within the target scope. Regular expressions can be used to define complex matching conditions for
            each attribute.
        </p>
        <p>
            Rules are processed in order, and are combined using the Boolean operators AND and OR. These are processed
            with a simple &quot;left to right&quot; logic in which the scope of each operator is as follows:
        </p>
        <p class="InlineCode">
            (cumulative result of all prior rules) AND/OR (result of current rule)
        </p>
        <p>
            All active rules are processed on every message, and the result after the final active rule is applied
            determines whether the message is intercepted or forwarded in the background.
        </p>
        <p>
            The &quot;Automatically update Content-Length" checkbox controls whether Burp automatically updates the
            Content-Length header of the message when this has been modified by the user. Using this option is normally
            essential when the HTTP body has been modified.
        </p>
        <p>
            For requests, there is an option to automatically fix missing or superfluous new lines at the end of
            requests. If an edited request does not contain a blank line following the headers, Burp will add this. If
            an edited request with a body containing URL-encoded parameters contains any newline characters at the end
            of the body, Burp will remove these. This option can be useful to correct mistakes made while manually
            editing requests in the interception view, to avoid issuing invalid requests to the server.
        </p>
        <h2 id="intercepting-websockets-messages">Intercepting WebSockets Messages</h2>
        <p>
            Use these settings to control which WebSockets messages are stalled for viewing and editing in the intercept
            tab.
        </p>
        <p>
            You can configure separately whether outgoing (client-to-server) messages and incoming (server-to-client)
            messages are intercepted.
        </p>
        <h2 id="response-modification">Response Modification</h2>
        <p>
            These settings are used to perform automatic modification of responses. You can use these options to achieve
            various tasks by automatically rewriting the HTML in application responses.
        </p>
        <p>
            The following options may be useful to remove client-side controls over data:
        </p>
        <ul>
            <li>
                Unhide hidden form fields. (There is a sub-option to prominently highlight unhidden fields on-screen,
                for easy identification.)
            </li>
            <li>
                Enable disabled form fields
            </li>
            <li>
                Remove input field length limits
            </li>
            <li>
                Remove JavaScript form validation
            </li>
        </ul>
        <p>
            The following options may be useful for disabling client-side logic for testing purposes (note that these
            features are not designed to be used as a security defense in the manner of NoScript):
        </p>
        <ul>
            <li>
                Remove all JavaScript
            </li>
            <li>
                Remove
                <span class="InlineCode">&lt;object&gt;</span>
                tags
            </li>
        </ul>
        <p>
            The following options may be used to deliver sslstrip-like attacks against a victim user whose traffic is
            unwittingly being proxied via Burp. You can use these in conjunction with the listener option to <a href="#request-handling">force SSL in outgoing requests</a> to effectively strip SSL from the
            user's connection:
        </p>
        <ul>
            <li>
                Convert HTTPS links to HTTP
            </li>
            <li>
                Remove secure flag from cookies
            </li>
        </ul>
        <h2 id="match-and-replace">Match and Replace</h2>
        <p>
            These settings are used to automatically replace parts of requests and responses passing through the Proxy.
            For each HTTP message, the enabled match and replace rules are executed in turn, and any applicable
            replacements are made.
        </p>
        <p>
            Rules can be defined separately for requests and responses, for message headers and bodies, and also
            specifically for the first line only of requests. Each rule can specify a literal string or regex pattern to
            match, and a string to replace it with.
        </p>
        <p>
            For message headers, if the match condition matches the entire header and the replacement string is left
            blank, then the header is deleted. If a blank matching expression is specified, then the replacement string
            will be added as a new header.
        </p>
        <p>
            There are various default rules available to assist with common tasks - these are disabled by default.
        </p>
        <h4>Matching Multi-Line Regions</h4>
        <p>
            You can use standard regex syntax to match multi-line regions of message bodies. For example, if a response
            body contains only:
        </p>
        <p class="InlineCode">
            Now is the time for all good men<br>
            to come to the aid of the party
        </p>
        <p>
            then using the regex:
        </p>
        <p class="InlineCode">
            Now.*the
        </p>
        <p>
            will match:
        </p>
        <p class="InlineCode">
            Now is the time for all good men<br>
            to come to the aid of the
        </p>
        <p>
            If you want to match only within a single line, you can modify the regex to:
        </p>
        <p class="InlineCode">
            Now[^\n]*the
        </p>
        <p>
            which will match:
        </p>
        <p class="InlineCode">
            Now is the
        </p>
        <h4>Using Regex Groups in Back-References and Replacement Strings</h4>
        <p>
            Groups can be defined within a matcher expression using parentheses, and are assigned a 1-indexed reference
            number in order from left to right (with group 0 representing the entire match).
        </p>
        <p>
            Groups can be back-referenced within the same matcher expression by using a backslash followed by the
            group's index. For example, to match a pair of opening and closing tags with no other tags between, you
            could use the regex:
        </p>
        <p class="InlineCode">
            &lt;([^/]\w*)[^&gt;]*&gt;[^&gt;]*?&lt;/\1[^&gt;]*&gt;
        </p>
        <p>
            In the replacement string, groups can be referenced using a $ followed by the group index. So the
            following replacement string will include the name of the tag that was matched in the above regex:
        </p>
        <p class="InlineCode">
            Replaced: $1
        </p>
        <h2 id="ssl-pass-through">SSL Pass Through</h2>
        <p>
            These settings are used to specify destination webservers for which Burp will directly pass through SSL
            connections. No details about requests or responses made via these connections will be available in the
            Proxy <a href="../intercept.html">intercept view</a> or <a href="../history.html">history</a>.
        </p>
        <p>
            Passing through SSL connections can be useful in cases where it is not straightforward to eliminate SSL
            errors on the client - for example, in mobile applications that perform SSL certificate pinning. If the
            application accesses multiple domains, or uses a mix of HTTP and HTTPS connections, then passing through SSL
            connections to specific problematic hosts still enables you to work on other traffic using Burp in the
            normal way.
        </p>
        <p>
            If the option to <strong> automatically add entries on client SSL negotiation failure </strong> is enabled,
            then Burp will detect when the client fails an SSL negotiation (for example, due to not recognizing Burp's <a href="installing-ca-certificate.html">CA certificate</a>), and will automatically add the relevant
            server to the SSL pass through list.
        </p>
        <h2 id="miscellaneous">Miscellaneous</h2>
        <p>
            These settings control some specific details of Burp Proxy's behavior. The following options are
            available:
        </p>
        <ul>
            <li>
                <strong>Use HTTP/1.0 in requests to server</strong> - This option controls whether Burp Proxy enforces
                HTTP version 1.0 in requests to destination servers. The default setting is to use whichever version of
                HTTP is used by the browser. However, some legacy servers or applications may require version 1.0 in
                order to function correctly.
            </li>
            <li>
                <strong>Use HTTP/1.0 in responses to client</strong> - All current browsers support both version 1.0 and
                1.1 of HTTP. Since version 1.0 has a reduced feature set, forcing use of version 1.0 can sometimes be
                useful to control aspects of browsers' behavior, such as preventing attempts to perform HTTP pipelining.
            </li>
            <li>
                <strong>Set response header "Connection: close"</strong> - This option may also be useful to prevent
                HTTP pipelining in some situations.
            </li>
            <li>
                <strong>Set "Connection: close" on incoming requests</strong> - This option may also be useful to
                prevent HTTP pipelining in some situations.
            </li>
            <li>
                <strong>Strip Proxy-* headers in incoming requests</strong> - Browsers sometimes send request headers
                containing information intended for the proxy server that is being used. Some attacks exist whereby a
                malicious web site may attempt to induce a browser to include sensitive data within these headers. By
                default, Burp Proxy strips these headers from incoming requests to prevent leakage of any information.
                Unchecking this option will cause Burp to leave these headers unmodified.
            </li>
            <li>
                <strong>Strip Accept-Encoding headers in incoming requests</strong> - Browsers typically offer to accept
                various encodings in responses, e.g. for compression of content. Some encodings cause problems when
                processing responses in Burp. By default, Burp removes this header to reduce the chance that encoding is
                used. If a server mandates encoding then you might need to uncheck this option.
            </li>
            <li>
                <strong>Strip Sec-WebSocket-Extensions headers in incoming requests</strong> - Browsers may offer to
                support various extensions relating to WebSocket connections, e.g. for compression of content. Some
                encodings cause problems when processing responses in Burp. By default, Burp removes this header to
                reduce the chance that extensions are used. If a server mandates a particular extension then you might
                need to uncheck this option.
            </li>
            <li>
                <strong>Unpack gzip / deflate in requests</strong> - Some applications (often those using custom client
                components), compress the message body in requests. This option controls whether Burp Proxy
                automatically unpacks compressed request bodies. Note that some applications may break if they expect a
                compressed body and the compression has been removed by Burp.
            </li>
            <li>
                <strong>Unpack gzip / deflate in responses</strong> - Most browsers accept gzip- and deflate-compressed
                content in responses. This option controls whether Burp Proxy automatically unpacks compressed response
                bodies. Note that you can often prevent servers from attempting to compress responses by removing the
                Accept-Encoding header from requests (possibly using Burp Proxy's <a href="#match-and-replace">match and
                replace</a> feature).
            </li>
            <li>
                <strong>Disable web interface at http://burp</strong> - This option may be useful if you are forced to
                configure your <a href="#binding">listener</a> to accept connections on an unprotected
                interface, and wish to prevent others gaining access to Burp's <a href="../in-browser-controls.html"> in-browser interface</a>.
            </li>
            <li>
                <strong>Suppress Burp error messages in browser</strong> - When certain errors occur, by default Burp
                returns meaningful error messages to the browser. If you wish to run Burp in stealth mode, to perform
                man-in-the-middle attacks against a victim user, then it may be useful to suppress these error messages
                to disguise the fact that Burp is involved.
            </li>
            <li>
                <strong>Don't send items to Proxy history or other Burp tools</strong> - This option prevents Burp from
                logging any requests to the Proxy history or the Target site map, and sending any items for live
                scanning. It may be useful if you are using Burp Proxy for some specific purpose, such as authenticating
                to upstream servers or performing match-and-replace operations, and you want to avoid incurring the
                memory and storage overhead that logging entails.
            </li>
            <li>
                <strong>Don't send items to Proxy history or other Burp tools, if out of scope</strong> - This option
                prevents Burp from logging any out-of-scope requests to the Proxy history or the Target site map, and
                sending any out-of-scope items for live scanning. It is useful to avoid accumulating project data for
                out-of-scope items.
            </li>
        </ul>
    </div>
</section>
</body>
</html>