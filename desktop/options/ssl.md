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
            <a href="index.html">Options</a>
        </li>
        <li>
            <a href="ssl.html">SSL</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Options: SSL</h1>
        <p>
            This tab contains settings for <a href="#ssl-negotiation">SSL negotiation</a>, <a href="#java-ssl-options">Java SSL
            options</a>, and <a href="#client-ssl-certificates">client</a> and <a href="#server-ssl-certificates">server</a> SSL certificates.
        </p>
        <p>
            <strong>Note:</strong> Some of these options can be defined at both the user and project level. For these
            options, you can configure your normal options at the user level, and then override these if required on a
            per-project basis.
        </p>
        <h2 id="ssl-negotiation">SSL Negotiation</h2>
        <p>
            These settings control the SSL protocols and ciphers that Burp will use when performing SSL negotiation with
            upstream servers. You can configure Burp to use the default protocols and ciphers of your Java installation,
            or override these defaults and enable specific protocols and ciphers as required.
        </p>
        <p>
            Sometimes, you may have difficulty negotiating SSL connections with certain web servers. The Java SSL stack
            contains a few gremlins, and fails to work with certain unusual server configurations. To help you
            troubleshoot this problem, Burp lets you specify which protocols and ciphers should be offered to servers
            during SSL negotiations.
        </p>
        <p>
            The following other options are available:
        </p>
        <ul>
            <li>
                <strong> Automatically select compatible SSL parameters on negotiation failure </strong> - If this
                option is enabled, then when Burp fails to negotiate SSL using the configured protocols and ciphers, it
                will probe the server to try and establish a set of compatible SSL parameters that are supported by both
                the server and Java. If compatible parameters are found, Burp caches this information and uses the
                parameters in the first instance for future negotiations with the same server. This option is generally
                desirable and can avoid the need to troubleshoot SSL issues and experiment with protocols and ciphers.
            </li>
            <li>
                <strong>Allow unsafe SSL renegotiation</strong> - This option may be necessary when using some client
                SSL certificates, or attempting work around other SSL problems.
            </li>
        </ul>
        <h2 id="java-ssl-options">Java SSL Options</h2>
        <p>
            These settings can be used to enable certain SSL features that might be needed to successfully connect to
            some servers.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Enable algorithms blocked by Java security policy</strong> - As of Java 7, the Java security
                policy can be used to block certain obsolete algorithms from being used in SSL negotiation, and some of
                these are blocked by default (such as MD2). Many live web servers have SSL certificates that use these
                obsolete algorithms, and it is not possible to connect to these servers using the default Java security
                policy. Enabling this option allows Burp to use the obsolete algorithms when connecting to the affected
                servers. Changes to this option take effect when you restart Burp.
            </li>
            <li>
                <strong>Disable Java SNI extension</strong> - As of Java 7, the SSL Server Name Indication (SNI)
                extension is implemented and enabled by default. Some misconfigured web servers with SNI enabled send an
                "Unrecognized name" warning in the SSL handshake. Whilst browsers ignore this warning, the Java
                implementation does not, and fails to connect. You can use this option to disable the Java SNI
                extension, and so connect to the affected servers. Changes to this option take effect when you restart
                Burp.
            </li>
        </ul>
        <h2 id="client-ssl-certificates">Client SSL Certificates</h2>
        <p>
            These settings let you configure the client SSL certificates that Burp will use when a destination host
            requests one. You can configure multiple certificates, and specify the hosts for which each certificate
            should be used. When a host requests a client SSL certificate, Burp will use the first certificate in the
            list whose host configuration matches the name of the host being contacted.
        </p>
        <p>
            You can use wildcards in the destination host specification (* matches zero or more characters, and ?
            matches any character except a dot). To use a single certificate whenever any host requests one, use * as
            the destination host.
        </p>
        <p>
            The following types of client certificates are supported:
        </p>
        <ul>
            <li>
                <strong>File (PKCS#12)</strong> - You will need to configure the location of the certificate file and
                the password for the certificate.
            </li>
            <li>
                <strong>Hardware token or smartcard (PKCS#11)</strong> - You will need to configure the location of the
                PKCS#11 library file for your device, your PIN code, and select the certificate from those that are
                available. The PKCS#11 library file is a native code file that is installed with the software for your
                device. On Windows, Burp can automatically search common locations to find the library files that you
                have installed.
            </li>
        </ul>
        <h2 id="server-ssl-certificates">Server SSL Certificates</h2>
        <p>
            This information-only panel contains details of all X509 certificates received from web servers.
            Double-click an item in the table to display the full details of the certificate.&nbsp;
        </p>
    </div>
</section>
</body>
</html>