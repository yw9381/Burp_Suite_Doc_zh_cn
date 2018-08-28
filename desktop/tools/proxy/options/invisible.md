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
            <a href="invisible.html">Invisible Proxying</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Burp Proxy: Invisible Proxying</h1>
        <p>
            Burp's support for invisible proxying allows non-proxy-aware clients to connect directly to a <a href="index.html#proxy-listeners">Proxy listener</a>. This option is sometimes useful if the
            application you are targeting employs a thick client component that runs outside of the browser, or a
            browser plugin that makes its own HTTP requests outside of the browser&#39;s framework. Often, these clients
            don&#39;t support HTTP proxies, or don&#39;t provide an easy way to configure them to use one.
        </p>
        <h3>Redirecting Inbound Requests</h3>
        <p>
            You can effectively force the non-proxy-aware client to connect to Burp by modifying your DNS resolution to
            redirect the relevant hostname, and setting up invisible Proxy listeners on the port(s) used by the
            application.
        </p>
        <p>
            For example, if the application uses the domain name example.org, and uses HTTP and HTTPS on the standard
            ports, you would need to add an entry to your hosts file redirecting the domain name to your local
            machine:
        </p>
        <p class="InlineCode">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 127.0.0.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; example.org&nbsp;
        </p>
        <p>
            To receive the redirected requests, you would also need to create invisible Burp Proxy listeners on
            127.0.0.1:80 and 127.0.0.1:443. The non-proxy-aware client will then resolve the domain name to your local
            IP address, and send requests directly to your listeners on that interface.
        </p>
        <h3>Invisible Proxy Mode</h3>
        <p>
            Using DNS to redirect client requests to the local listeners is easy enough, but the need for a special
            invisible proxy mode arises because the resulting requests will not be in the form that is normally expected
            by an HTTP proxy.
        </p>
        <p>
            When using plain HTTP, a proxy-style request looks like this:
        </p>
            <p class="InlineCode">
                GET http://example.org/foo.php HTTP/1.1<br>
                Host: example.org
            </p>
        <p>
            whereas the corresponding non-proxy-style request looks like this:
        </p>
            <p class="InlineCode">
                GET /foo.php HTTP/1.1<br>
                Host: example.org
            </p>
        <p>
            Normally, web proxies need to receive the full URL in the first line of the request in order to determine
            which destination host to forward the request to (they do not look at the Host header to determine the
            destination). If invisible proxying is enabled, when Burp receives any non-proxy-style requests, it will
            parse out the contents of the Host header, and use that as the destination host for that request.
        </p>
        <p>
            When using HTTPS with a proxy, clients send a CONNECT request identifying the destination host they wish to
            connect to, and then perform SSL negotiation. However, non-proxy-aware clients will proceed directly to SSL
            negotiation, believing they are communicating directly with the destination host. If invisible proxying is
            enabled, Burp will tolerate direct negotiation of SSL by the client, and again will parse out the contents
            of the Host header from the decrypted request.
        </p>
        <h3>Redirecting Outbound Requests</h3>
        <p>
            When running in invisible mode, Burp will by default forward requests on to destination hosts based on the
            Host header that was parsed out of each request. However, because you have modified the hosts file entry for
            the relevant domain, Burp itself will resolve the hostname to the local listener address, and unless
            configured differently will forward the request back to itself, creating an infinite loop.
        </p>
        <p>
            There are two methods for resolving this problem:
        </p>
        <ul>
            <li>
                If all the invisibly proxied traffic is headed for a single domain (i.e. if the non-proxy-aware client
                only ever contacts a single domain), you can use the Proxy listener's <a href="index.html#request-handling"> redirection options</a> to force the outgoing
                traffic to go to the correct IP address.
            </li>
            <li>
                If the proxied traffic is headed for multiple domains, you can use Burp's own <a href="../../../options/connections.html#hostname-resolution"> hostname resolution options</a> to override the hosts file and
                redirect each domain individually back to its correct original IP address.
            </li>
        </ul>
        <p>
            A related problem arises if the non-proxy-aware client does not include a Host header in its requests.
            Without this header, when processing non-proxy-style requests, Burp cannot determine which destination host
            the requests should be forwarded to.
        </p>
        <p>
            Again, there are two methods for resolving this problem. If all requests should be forwarded to the same destination host, you can use the Proxy listener's <a href="index.html#request-handling"> redirection options</a> to force the outgoing
            traffic to go to the correct IP address.
        </p>
        <p>
                If different requests should be forwarded to different hosts, then you will need to use multiple Proxy
			listeners:</p>
                <ul>
                    <li>
                        Create a separate virtual network interface for each destination host. (Most operating systems
                        let you create additional virtual interfaces with loopback-like properties. Alternatively, this
                        is possible in virtualized environments.)
                    </li>
                    <li>
                        Create a separate Proxy listener for each interface (or two listeners if HTTP and HTTPS are both
                        in use).
                    </li>
                    <li>
                        Using your hosts file, redirect each destination hostname to a different network interface
                        (i.e., to a different listener).
                    </li>
                    <li>
                        Configure the listener on each interface to redirect all traffic to the IP address of the host
                        whose traffic was redirected to it.
                    </li>
                </ul>
        <h3>Handling SSL Certificates</h3>
        <p>
            There are various options for configuring the <a href="index.html#certificate">server SSL
            certificates</a> used by Burp Proxy listeners. The default option, of automatically generating a certificate
            for each destination host, may sometimes not work with invisible proxying. Non-proxy-aware clients negotiate
            SSL directly with the listener, without first sending a CONNECT request identifying the destination host
            that the client is seeking to contact. Many clients, including browsers, support the "server_name" extension
            in the Client Hello message, which identifies the destination host that the client wishes to negotiate with.
            If this extension is present, Burp uses it to generate a certificate for that host in the normal way.
            However, if the extension is not present in the Client Hello message, Burp will fail over to using a static
            self-signed certificate instead.
        </p>
        <p>
            As with redirection of outbound requests, there are two methods for resolving this problem:
        </p>
        <ul>
            <li>
                If all HTTPS requests are to the same domain, you can configure the invisible listener to generate a
                CA-signed certificate with the specific hostname being used by the application.
            </li>
            <li>
                If different HTTPS requests are for different domains, you will need to create a different invisible
                Proxy listener for each destination host, each using a different virtual network interface, as described
                for redirection of outbound requests. You will then need to configure each listener to generate a
                CA-signed certificate with the specific hostname whose traffic is being redirected to it.
            </li>
        </ul>
    </div>
</section>
</body>
</html>