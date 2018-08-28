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
            <a href="connections.html">Connections</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Options: Connections</h1>
        <p>
            The Connections options control how Burp handles <a href="#platform-authentication">platform authentication</a>, <a href="#upstream-proxy-servers"> upstream proxy servers</a>, <a href="#socks-proxy">SOCKS proxy</a>, <a href="#timeouts">timeouts</a>, <a href="#hostname-resolution">hostname resolution</a>, and <a href="#out-of-scope-requests">out-of-scope requests</a>.
        </p>
        <div class="rounded-corner-box">
            <p>
                <strong>Note:</strong> Some of these options can be defined at both the user and project level. For
                these options, you can configure your normal options at the user level, and then override these if
                required on a per-project basis.
            </p>
        </div>
        <h2 id="platform-authentication">Platform Authentication</h2>
        <p>
            These settings let you configure Burp to automatically carry out platform authentication to destination web
            servers. Different authentication types and credentials can be configured for individual hosts.
        </p>
        <p>
            Supported authentication types are: basic, NTLMv1, NTLMv2 and digest authentication. The domain and hostname
            fields are only used for NTLM authentication.
        </p>
        <p>
            The &quot;Prompt for credentials on platform authentication failure&quot; option causes Burp to display an
            interactive popup whenever an authentication failure is encountered.
        </p>
        <h2 id="upstream-proxy-servers">Upstream Proxy Servers</h2>
        <p>
            These settings control whether Burp will send outgoing requests to an upstream proxy server, or directly to
            the destination web server.
        </p>
        <p>
            You can define multiple rules, specifying different proxy settings for different destination hosts, or
            groups of hosts. Rules are applied in sequence, and the first rule that matches the destination web server
            will be used. If no rule is matched, Burp defaults to direct, non-proxied connections.
        </p>
        <p>
            You can use wildcards in the destination host specification (* matches zero or more characters, and ?
            matches any character except a dot). To send all traffic to a single proxy server, create a rule with * as
            the destination host. Leave the proxy host blank to connect directly to the specified host.
        </p>
        <p>
            For each upstream proxy you configure, you can specify an authentication type and credentials if required.
            Supported authentication types are: basic, NTLMv1, NTLMv2 and digest authentication. The domain and hostname
            fields are only used for NTLM authentication.
        </p>
        <h2 id="socks-proxy">SOCKS Proxy</h2>
        <p>
            These settings let you configure Burp to use a SOCKS proxy for all outgoing communications. This setting is
            applied at the TCP level, and all outbound requests will be sent via this proxy.
        </p>
        <p>
            If you have configured rules for upstream HTTP proxy servers, then requests to upstream proxies will be sent
            via the SOCKS proxy configured here.
        </p>
        <p>
            If the option "Do DNS lookups over SOCKS proxy" is enabled, then all domain names will be resolved by the
            proxy. No local lookups will be performed.
        </p>
        <h2 id="timeouts">Timeouts</h2>
        <p>
            These settings specify the timeouts to be used for various network tasks. You can specify the following
            timeouts:
        </p>
        <ul>
            <li>
                <strong>Normal</strong> - This setting is used for most network communications, and determines how long
                Burp will wait before abandoning a request and record that a timeout has occurred.
            </li>
            <li>
                <strong>Open-ended responses</strong> - This setting is only used where a response is being processed
                which does not contain a Content-Length or Transfer-Encoding HTTP header. In this situation, Burp waits
                for the specified interval before determining that the transmission has been completed.
            </li>
            <li>
                <strong> Domain name resolution </strong> - This setting determines how often Burp will re-perform
                successful domain name look-ups. This should be set to a suitably low value if target host addresses are
                frequently changing.
            </li>
            <li>
                <strong> Failed domain name resolution </strong> - This setting determines how often Burp will reattempt
                unsuccessful domain name look-ups.
            </li>
        </ul>
        <p>
            Values are in seconds. If an option is left blank, then Burp will never time out that function.
        </p>
        <h2 id="hostname-resolution">Hostname Resolution</h2>
        <p>
            These settings enable you to specify mappings of hostnames to IP addresses, to override the DNS resolution
            provided by your computer.
        </p>
        <p>
            Each hostname resolution rule specifies a hostname, and the IP address that should be associated with that
            hostname. Rules can be individually enabled or disabled.
        </p>
        <p>
            This feature can be useful to ensure correct onward forwarding of requests when the hosts file has been
            modified to perform <a href="../tools/proxy/options/invisible.html">invisible proxying</a> of traffic from
            non-proxy-aware thick client components.
        </p>
        <h2 id="out-of-scope-requests">Out-of-Scope Requests</h2>
        <p>
            This feature can be used to prevent Burp from issuing any out-of-scope requests. It can be useful when you
            need to guarantee that no requests are made to targets that are not in-scope for your current work. Even if
            your browser makes requests for out-of-scope items, the outgoing requests will be dropped by Burp.
        </p>
        <p>
            You can enable this feature for the current <a href="../tools/target/scope.html">Target scope</a>. Alternatively, you
            can define a custom scope using <a href="../functions/url-matching.html"> URL-matching rules</a>.
        </p>
    </div>
</section>
</body>
</html>