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
            <a href="index.html">Burp Collaborator</a>
        </li>
        <li>
            <a href="deploying.html">Deploying a Private Server</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Deploying a Private Burp Collaborator Server</h1>
        <p>
            By default, Burp uses the public Collaborator Server provided by PortSwigger, and this option may be
            suitable for many purposes. See the main <a href="index.html">Burp Collaborator documentation</a> for
            more details.
        </p>
        <p>
            If you wish, you can deploy your own private instance of the Collaborator Server. This documentation
            describes the process of doing so, and covers the following topics:
        </p>
        <ul class="link-list">
            <li>
                <a href="#installation-and-execution">Installation and execution</a>
            </li>
            <li>
                <a href="#basic-set-up-on-a-closed-network">Basic set-up on a closed network</a>
            </li>
            <li>
                <a href="#running-on-non-standard-ports">Running on non-standard ports</a>
            </li>
            <li>
                <a href="#dns-configuration">DNS configuration</a>
            </li>
            <li>
                <a href="#ssl-configuration">SSL configuration</a>
            </li>
            <li>
                <a href="#interaction-events-and-polling">Interaction events and polling</a>
            </li>
            <li>
                <a href="#metrics">Metrics</a>
            </li>
            <li>
                <a href="#collaborator-logging">Logging</a>
            </li>
            <li>
                <a href="#testing-the-installation">Testing the installation</a>
            </li>
            <li>
                <a href="#collaborator-configuration-file-format">Configuration file format</a>
            </li>
        </ul>
        <h2 id="installation-and-execution">Installation And Execution</h2>
        <p>
            The Burp Collaborator server is included in the same executable file as Burp Suite Professional itself. No
            license key is required to run your own instance of the server. The server can be started directly from the
            command line using the
            <span class="InlineCode">--collaborator-server</span>
            argument, for example:
        </p>
        <p class="InlineCode">
            sudo java -jar burp.jar --collaborator-server
        </p>
        <p>
            The server will fail to start if it cannot bind to the ports it needs to run its services. You will need to
            stop any other processes that are using these ports. By default, Burp Collaborator server listens on the
            following ports:
        </p>
        <ul>
            <li>
                DNS: UDP port 53
            </li>
            <li>
                HTTP: TCP port 80
            </li>
            <li>
                HTTP: TCP port 443
            </li>
            <li>
                SMTP: TCP ports 25 and 587
            </li>
            <li>
                SMTPS: TCP port 465
            </li>
        </ul>
        <p>
            Further, on Unix-based systems, you may need to run the server with root privileges in order to bind to
            these ports. Alternatively, you can configure the server to <a href="#running-on-non-standard-ports"> run on non-standard ports</a>,
            and use port mapping to redirect the original ports.
        </p>
        <p>
            When launching the Collaborator server, it is desirable to configure the JVM's memory handling and garbage
            collection, based on the expected usage. If you are running the Collaborator server on a desktop machine for
            a small number of expected users, you can reduce the amount of memory used by the JVM. The following command
            allows the heap to fluctuate between 10 and 200 MB, and for the JVM to spend 5% of its time in garbage
            collection, which typically uses less memory:
        </p>
        <p class="InlineCode"> sudo java -Xms10m -Xmx200m -XX:GCTimeRatio=19 -jar burp.jar --collaborator-server</p>
        <p>
            If you are running the Collaborator server on a dedicated machine to support a larger number of users, then
            it is efficient to fix the size of the heap to the amount of physical memory available, typically leaving
            1GB available for the operating system, JVM and any other running processes. For example:
        </p>
        <p class="InlineCode">
            sudo java -Xmx3g -Xms3g -jar burp.jar --collaborator-server
        </p>
        <p>
            If the server is expected to be heavily used and has more than 4GB of physical memory, it is recommended to
            switch to the G1 garbage collector, which significantly reduces the JVM pauses that can occur during garbage
            collection. For example:
        </p>
        <p class="InlineCode">
            sudo java -Xmx12g -Xms12g -XX:+UseG1GC -jar burp.jar --collaborator-server
        </p>
        <p>
            To make full use of the Collaborator server's capabilities, you will generally also need to create a
            suitable <a href="#collaborator-configuration-file-format">configuration file</a>.
        </p>
        <h2 id="basic-set-up-on-a-closed-network">Basic Set-up On A Closed Network</h2>
        <p>
            A common use case for a private Collaborator server is to support a single tester (or a small team) working
            on a private closed network. If you are testing an application on a closed network with no Internet access,
            then of course the default public Collaborator server cannot be used.
        </p>
        <p>
            In this situation, you can launch a basic Collaborator server instance using one of the commands in <a href="#installation-and-execution"> Installation and Execution</a>, without the need for any <a href="#collaborator-configuration-file-format">configuration
            file</a>. You then simply need to <a href="../desktop/options/misc-project.html#burp-collaborator-server">configure Burp</a> to use your machine's IP address as its Collaborator server.
        </p>
        <p>
            In this set-up, the Collaborator will not support custom DNS resolution or valid trusted HTTPS connections.
            However, you will still be able to use the basic Collaborator features to detect issues like external HTTP
            interactions.&nbsp;
        </p>
        <h2 id="running-on-non-standard-ports">Running On Non-Standard Ports</h2>
        <p>
            If you wish to run the Collaborator server as a non-root user, you will need to configure it to run on
            non-standard ports. You will also need to configure your operating system to map the original ports to the
            custom ports you are using. Typically, you will need to configure mappings for incoming TCP and UDP
            connections, and also for outgoing UDP responses.
        </p>
        <p>
            You can configure the Collaborator server to use non-standard ports using its <a href="#collaborator-configuration-file-format">configuration
            file</a>. For example:
        </p>
        <p class="InlineCode">
            { <br>
    &nbsp; "serverDomain" : "burpcollaborator.example.com", <br>
    &nbsp; "eventCapture": { <br>
    &nbsp; &nbsp; "http": { <br>
    &nbsp; &nbsp; &nbsp; "ports" : 8080 <br>
    &nbsp; &nbsp; }, <br>
    &nbsp; &nbsp; "https": { <br>
    &nbsp; &nbsp; &nbsp; "ports" : 8443 <br>
    &nbsp; &nbsp; }, <br>
    &nbsp; &nbsp; "smtp": { <br>
    &nbsp; &nbsp; &nbsp; "ports" : [8025, 8587] <br>
    &nbsp; &nbsp; }, <br>
    &nbsp; &nbsp; "smtps": { <br>
    &nbsp; &nbsp; &nbsp; "ports" : 8465 <br>
    &nbsp; &nbsp; } <br>
    &nbsp; }, <br>
    &nbsp; "dns": { <br>
    &nbsp; &nbsp; "ports" : 8053 <br>
    &nbsp; } <br>
    }
        </p>
<p>Note that the "ports" value can be a single port number or an array of port numbers, if you
        want to listen for a service on multiple ports. By default, the Collaborator server listens for SMTP
        interactions on ports 25 and 587.</p>
        <h2 id="dns-configuration">DNS Configuration</h2>
        <p>
            Burp Collaborator by default runs a DNS service for a specific domain, and to make use of this you will need
            a dedicated domain or subdomain for the Collaborator to use. You can omit the DNS capability and access the
            Collaborator server only by IP address; however, this configuration is less effective at detecting various
            vulnerabilities.
        </p>
        <p>
            If you are running Burp Collaborator on the public Internet, you can purchase a dedicated domain (e.g.
            example.com), or use a subdomain of a domain that you already own and use (e.g.
            burpcollaborator.example.com). If your installation will be restricted to an internal network, you can
            choose any dedicated internal domain.
        </p>
        <p>
            The Collaborator server needs to know which domain it controls so that it can serve the appropriate DNS
            records. This is configured in the Collaborator <a href="#collaborator-configuration-file-format">configuration file</a>. For example:
        </p>
        <p class="InlineCode">
            { <br>
    &nbsp; "serverDomain": "burpcollaborator.example.com" <br>
            }
        </p>
        <p>
            You will also need to configure your domain so that DNS for the domain is delegated to your Collaborator
            server. The details of this will depend on your set-up. Most domain registrars provide a web interface
            allowing you to configure the authoritative DNS servers for your domain.
        </p>
        <p>
            If you are using
            <span class="InlineCode">example.com</span>
            as the domain for your Collaborator server, you will need to configure the domain to use the following name
            servers:
        </p>
        <p class="InlineCode">
            ns1.example.com<br>
            ns2.example.com
        </p>
        <p>
            You will also need to configure glue records to associate each of these with the IP address of your
            Collaborator server. If your domain registrar requires each configured DNS server for the domain to reside
            on a different IP address, then you might need to configure two public IP addresses on your Collaborator
            server.
        </p>
        <p>
            <strong>Note:</strong> It is not possible to avoid the use of the Collaborator DNS service by simply editing
            the hosts file of the target server being tested. When employing the Collaborator server in its testing,
            Burp uses randomly generated subdomains of the main configured domain. Host files do not support wildcards
            and so cannot be used to route queries with randomly generated subdomains.
        </p>
        <h2 id="ssl-configuration">SSL Configuration</h2>
        <p>
            Burp Collaborator runs HTTPS and SMTPS services for capturing interactions initiated by tested systems, and
            to serve polling requests made by Burp Suite. Typically, SSL connections to the Collaborator server will
            only succeed if the Collaborator has been configured with a valid wildcard SSL certificate for the domain
            name being used. SSL certificates can be configured using the Collaborator <a href="#collaborator-configuration-file-format">configuration
            file</a>.
        </p>
        <p>
            If you do not have a valid wildcard SSL certificate for your domain, then Burp Collaborator can create a
            self-signed certificate. For example, the following configuration will create a self-signed wildcard
            certificate for *.burpcollaborator.example.com:
        </p>
        <p class="InlineCode">
    "ssl": { <br>
    &nbsp; "hostname" : "burpcollaborator.example.com" <br>
            }
        </p>
        <p>
            Using a self-signed certificate may be sufficient if you are able to install the certificate as trusted on
            the target server you are testing, or if the target application does not validate SSL certificates.
        </p>
        <p>
            If you have purchased a valid wildcard SSL certificate for your domain, you can obtain the certificate from
            your Certificate Authority (CA), and install it in your Collaborator server. In this example, we have
            generated a Certificate Signing Request (CSR) using OpenSSL, and the CA has provided the certificate and an
            intermediate certificate.
        </p>
        <p>
            With OpenSSL, the default format for keys is the traditional SSLeay format. These need to be converted to
            PKCS8 before the Collaborator server can import them. The OpenSSL command to do this conversion is:
        </p>
        <p class="InlineCode">
            openssl pkcs8 -topk8 -inform PEM -in
            keys/burpcollaborator.example.com.key -outform PEM -out
            keys/burpcollaborator.example.com.key.pkcs8 -nocrypt
        </p>
        <p>
            SSL certificates can be configured using the Collaborator <a href="#collaborator-configuration-file-format">configuration file</a>. The
            following example configuration file demonstrates how to load the private key, the certificate, and the
            intermediate certificate:
        </p>
        <p class="InlineCode">
    "ssl": { <br>
    &nbsp; "certificateFiles" : [ <br>
    &nbsp; &nbsp; "keys/burpcollaborator.example.com.key.pkcs8", <br>
    &nbsp; &nbsp; "keys/burpcollaborator.example.com.crt", <br>
    &nbsp; &nbsp; "keys/intermediate.crt"] <br>
            }
        </p>
        <p>
            <strong>Note:</strong> The certificate files must be specified in the correct order: private key,
            certificate, intermediate certificate(s).
        </p>
        <p>
            Alternatively, you can generate a CSR using the Java keytool, and import the resulting certificate into the
            Java keystore of the server. In this situation, you can configure the Collaborator to load the certificate
            using:
        </p>
        <p class="InlineCode">
    "ssl": { <br>
    &nbsp; "keystore": { <br>
    &nbsp; &nbsp; "path" : "myKeystore.jks", <br>
    &nbsp; &nbsp; "password" : "myPassword" <br>
            }
        </p>
        <p>
            If you have configured separate network interfaces for <a href="#interaction-events-and-polling"> interaction events and
            polling</a>, you will need to configure SSL separately for each interface.
        </p>
        <h2 id="interaction-events-and-polling">Interaction Events and Polling</h2>
        <p>
            The Collaborator server supports two types of incoming communications from clients:
        </p>
        <ul>
            <li>
                <strong>Interaction events</strong> - These occur when a target application being tested initiates some
                kind of interaction with the Collaborator server, for example a DNS lookup or an HTTP request.
            </li>
            <li>
                <strong>Polling requests</strong> - These occur when an instance of Burp asks the Collaborator server
                whether any interaction events have occurred resulting from its payloads.
            </li>
        </ul>
        <p>
            By default, the Collaborator server handles both interaction events and polling requests on the same network
            interface. If you wish, you can configure the Collaborator to use different interfaces (or ports) for
            serving polling requests. This facility can be used to work around firewall restrictions, or to control
            access to the polling function at the network layer.
        </p>
        <p>
            You can configure a separate polling interface using the optional "polling" section of the Collaborator <a href="#collaborator-configuration-file-format">configuration file</a>. If you do this, you can use the same wildcard SSL certificate
            for both interfaces, and let the Collaborator server's DNS service direct polling requests to the correct
            interface. With this set-up, you will only need to configure the server location in the <a href="../desktop/options/misc-project.html#burp-collaborator-server"> Burp Collaborator Server</a> options, and Burp will
            automatically prepend "polling." to the server domain when performing polling requests. The Collaborator's
            DNS service will resolve the polling subdomain to the public IP address of the separate polling interface.
            This provides the benefit of using separate interaction and polling interfaces while simplifying the
            configuration of the Burp client.
        </p>
        <h2 id="metrics">Metrics</h2>
        <p>
            The Collaborator server captures various usage metrics allowing administrators to monitor the performance
            and load of the server. These metrics can be useful to validate that the Collaborator machine is
            sufficiently powerful for its level of usage. Note that the metrics do not contain any data extracted from
            specific <a href="#interaction-events-and-polling"> interaction events and polling requests</a>.
        </p>
        <p>
            Metrics data is accessible via the polling interface of the Collaborator server, and access can be
            controlled through the use of a shared secret URL path and a client IP address whitelist. Metrics are
            disabled by default but can be enabled using the optional "metrics" section of the Collaborator <a href="#collaborator-configuration-file-format">configuration file</a>. For example:
        </p>
        <p class="InlineCode">
    "polling" : { <br>
    &nbsp; "publicAddress" : "10.20.0.159" <br>
            }, <br>
    "metrics": { <br>
    &nbsp; "path" : "jnaicmez8", <br>
    &nbsp; "addressWhitelist" : ["21.10.23.0/24"] <br>
            },
        </p>
        <p>
            With this configuration, metrics would be available to clients on the 21.10.23.0/24 network at the URL:
        </p>
        <p class="InlineCode">
            https://10.20.0.159/jnaicmez8/metrics
        </p>
        <h2 id="collaborator-logging">Collaborator logging</h2>
        <p>
            You can configure logging to standard output, via the
            <span class="InlineCode">logLevel</span>
            value in the <a href="#collaborator-configuration-file-format">configuration file</a>. The available values are:
        </p>
        <ul>
            <li>
                OFF - Nothing is logged.
            </li>
            <li>
                ERROR - Unexpected exceptions are logged.
            </li>
            <li>
                INFO - Information about configuration and services is logged at startup. This is the default value.
            </li>
            <li>
                DEBUG - Details of Collaborator interactions and polling are logged, including source IP address and interaction IDs. Note that this might disclose sensitive information in the log output.
            </li>
        </ul>
<h2 id="testing-the-installation">Testing the Installation</h2>
        <p>
            When the server is deployed, you can use Burp Suite to test that is operating correctly. In Burp Suite Professional, configure
            the details of your server in the <a href="../desktop/options/misc-project.html#burp-collaborator-server"> Burp Collaborator
                Server</a> options, and run the health check function. Burp will then attempt to exercise each of the
            expected Collaborator functions, and will provide feedback of the success or failure of each function.
        </p>
        <h2 id="collaborator-configuration-file-format">Collaborator configuration File Format</h2>
        <p>
            All options for Burp Collaborator server are controlled using a configuration file. By default, the
            Collaborator server looks for a file called
            <span class="InlineCode">collaborator.config</span>
            in the current working directory. This location can be overridden from the command line using the
            <span class="InlineCode">--collaborator-config</span>
            argument, for example:
        </p>
        <p class="InlineCode">
            sudo java -jar burp.jar --collaborator-server --collaborator-config=myconfig.config
        </p>
        <p>
            The configuration file uses a JSON format, with support for comments. Where IP addresses are required, you
            can configure either a single address or a list of addresses. For example, either of the following could be
            used to configure the local address(es) of a network interface:
        </p>
        <p class="InlineCode">
    "localAddress" : "10.20.0.159" <br>
    "localAddress" : ["10.20.0.159", "127.0.0.1"]
        </p>
        <p>
            A complete sample configuration file, together with an explanation of each available option, is shown below:
        </p>
        <p class="InlineCode">
            { <br>
    &nbsp; "serverDomain" : "burpcollaborator.example.com", <br>
    &nbsp; "workerThreads" : 10, <br>
    &nbsp; "eventCapture": { <br>
    &nbsp; &nbsp; "localAddress" : ["10.20.0.159", "127.0.0.1"], <br>
    &nbsp; &nbsp; "publicAddress" : "10.20.0.159", <br>
    &nbsp; &nbsp; "http": { <br>
    &nbsp; &nbsp; &nbsp; "ports" : 80 <br>
    &nbsp; &nbsp; }, <br>
    &nbsp; &nbsp; "https": { <br>
    &nbsp; &nbsp; &nbsp; "ports" : 443 <br>
    &nbsp; &nbsp; }, <br>
    &nbsp; &nbsp; "smtp": { <br>
    &nbsp; &nbsp; &nbsp; "ports" : [25, 587] <br>
    &nbsp; &nbsp; }, <br>
    &nbsp; &nbsp; "smtps": { <br>
    &nbsp; &nbsp; &nbsp; "ports" : 465 <br>
    &nbsp; &nbsp; }, <br>
    &nbsp; &nbsp; "ssl": { <br>
    &nbsp; &nbsp; &nbsp; "certificateFiles" : [ <br>
    &nbsp; &nbsp; &nbsp; &nbsp; "keys/burpcollaborator.example.com.key.pkcs8", <br>
    &nbsp; &nbsp; &nbsp; &nbsp; "keys/burpcollaborator.example.com.crt", <br>
    &nbsp; &nbsp; &nbsp; &nbsp; "keys/intermediate.crt" ] <br>
    &nbsp; &nbsp; } <br>
    &nbsp; }, <br>
    &nbsp; "polling" : { <br>
    &nbsp; &nbsp; "localAddress" : "127.0.0.1", <br>
    &nbsp; &nbsp; "publicAddress" : "10.20.0.159", <br>
    &nbsp; &nbsp; "http": { <br>
    &nbsp; &nbsp; &nbsp; "port" : 9090 <br>
    &nbsp; &nbsp; }, <br>
    &nbsp; &nbsp; "https": { <br>
    &nbsp; &nbsp; &nbsp; "port" : 9443 <br>
    &nbsp; &nbsp; }, <br>
    &nbsp; &nbsp; "ssl": { <br>
    &nbsp; &nbsp; &nbsp; "hostname" : "collaboratorpolling.example.com" <br>
    &nbsp; &nbsp; } <br>
    &nbsp; }, <br>
    &nbsp; "metrics": { <br>
    &nbsp; &nbsp; "path" : "jnaicmez8", <br>
    &nbsp; &nbsp; "addressWhitelist" : ["21.10.23.0/24"] <br>
    &nbsp; }, <br>
    &nbsp; "dns": { <br>
    &nbsp; &nbsp; "interfaces" : [{ <br>
    &nbsp; &nbsp; &nbsp; "name": "ns1", <br>
    &nbsp; &nbsp; &nbsp; "localAddress" : "34.23.11.6", <br>
    &nbsp; &nbsp; &nbsp; "publicAddress" : "98.87.76.55" <br>
    &nbsp; &nbsp; }, { <br>
    &nbsp; &nbsp; &nbsp; "name" : "ns2", <br>
    &nbsp; &nbsp; &nbsp; "localAddress" : "34.23.11.6", <br>
    &nbsp; &nbsp; &nbsp; "publicAddress" : "98.87.11.00" <br>
    &nbsp; &nbsp; }], <br>
    &nbsp; &nbsp; "ports" : 53 <br>
    &nbsp; }, <br>
    &nbsp; "logLevel" : "INFO" <br>
    }
        </p>
        <table>
            <tr>
                <td>
                    serverDomain
                </td>
                <td>
                    The domain or subdomain which the Collaborator server will control DNS for. This setting is required
                    for DNS functionality.
                </td>
            </tr>
            <tr>
                <td>
                    workerThreads
                </td>
                <td>
                    The number of threads used by the Collaborator to process incoming requests.
                </td>
            </tr>
            <tr>
                <td>
                    eventCapture.localAddress
                </td>
                <td>
                    By default, the Collaborator will listen on all local interfaces for capturing interaction events.
                    If specified, it will only listen on the configured interfaces.
                </td>
            </tr>
            <tr>
                <td>
                    eventCapture.publicAddress
                </td>
                <td>
                    The public IP address used for capturing interaction events.
                </td>
            </tr>
            <tr>
                <td>
                    eventCapture.http.ports
                </td>
                <td>
                    The ports for listening for HTTP interaction events. This should only be changed from the default if
                    port 80 is being forwarded.
                </td>
            </tr>
            <tr>
                <td>
                    eventCapture.https.ports
                </td>
                <td>
                    The ports for listening for HTTPS interaction events. This should only be changed from the default
                    if port 443 is being forwarded.
                </td>
            </tr>
            <tr>
                <td>
                    eventCapture.smtp.ports
                </td>
                <td>
                    The ports for listening for SMTP interaction events. This should only be changed from the default if
                    ports 25 and 587 are being forwarded.
                </td>
            </tr>
            <tr>
                <td>
                    eventCapture.smtps.ports
                </td>
                <td>
                    The ports for listening for SMTPS interaction events. This should only be changed from the default
                    if port 465 is being forwarded.
                </td>
            </tr>
            <tr>
                <td>
                    eventCapture.https.hostname
                </td>
                <td>
                    Used to generate a self-signed certificate. See <a href="#ssl-configuration">SSL configuration</a> for more
                    details.
                </td>
            </tr>
            <tr>
                <td>
                    polling.localAddress
                </td>
                <td>
                    By default, the Collaborator will use the same network interface for capturing interaction events
                    and serving polling requests. If specified, it will use a different interface for polling requests.
                </td>
            </tr>
            <tr>
                <td>
                    polling.publicAddress
                </td>
                <td>
                    The public address used for serving polling requests.
                </td>
            </tr>
            <tr>
                <td>
                    polling.http.port
                </td>
                <td>
                    The port to be used for polling over HTTP. This can be non-standard and Burp Suite will need to be <a href="../desktop/options/misc-project.html#burp-collaborator-server">configured</a> to use it.
                </td>
            </tr>
            <tr>
                <td>
                    polling.https.port
                </td>
                <td>
                    The port to be used for polling over HTTPS. This can be non-standard and Burp Suite will need to be <a href="../desktop/options/misc-project.html#burp-collaborator-server">configured</a> to use it.
                </td>
            </tr>
            <tr>
                <td>
                    polling.https.hostname
                </td>
                <td>
                    Used to generate a self-signed certificate. See <a href="#ssl-configuration">SSL configuration</a> for more
                    details.
                </td>
            </tr>
            <tr>
                <td>
                    metrics.path
                </td>
                <td>
                    URL path under at which the metrics page can be accessed.
                </td>
            </tr>
            <tr>
                <td>
                    metrics.whitelist
                </td>
                <td>
                    A whitelist of client IP addresses allowed to access the metrics page.
                </td>
            </tr>
            <tr>
                <td>
                    dns.ports
                </td>
                <td>
                    Ports for listening for DNS queries. This should only be changed from the default if port 53 is
                    being forwarded.
                </td>
            </tr>
            <tr>
                <td>
                    dns.interfaces
                </td>
                <td>
                    A list of local interfaces for listening for DNS queries. If your registrar requires that you
                    configure a different IP address for each authoritative name server, you can use multiple network
                    interfaces and configure their locations with this option.
                </td>
            </tr>
            <tr>
                <td>
                    dns.interfaces.name
                </td>
                <td>
                    The hostname to use for the name server running on this interface. A different hostname should be
                    used for each name server (e.g. ns1, ns2, etc.).
                </td>
            </tr>
            <tr>
                <td>
                    dns.interfaces.localAddress
                </td>
                <td>
                    The local address to bind to for this name server.
                </td>
            </tr>
            <tr>
                <td>
                    dns.interfaces.publicAddress
                </td>
                <td>
                    The public IP address corresponding to the configured local address. Typically, you will need to use
                    the configured hostname and public IP address in your DNS record for your domain.
                </td>
            </tr>
            <tr>
                <td>
                    logLevel
                </td>
                <td>
The level of <a href="#collaborator-logging">logging</a> required to standard output.
                </td>
            </tr>
        </table>
    </div>
</section>
</body>
</html>