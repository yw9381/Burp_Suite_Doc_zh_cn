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
            <a href="index.html">Useful Functions</a>
        </li>
        <li>
            <a href="url-matching.html">URL-Matching Rules</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>URL-Matching Rules</h1>
        <p>
            URL-matching rules are used in various locations within Burp, to define URL-based scoping for various
            functions, such as general <a href="../tools/target/scope.html">Target scope</a>, the scope of individual functions
            like <a href="../scanning/live-scans.html">live scanning</a>, URLs returning <a href="../options/http.html#streaming-responses">streaming responses</a>, and the scope of <a href="../options/sessions/index.html#session-handling-rules"> session handling rules</a>.
        </p>
        <p>
            You can configure URL-based scoping in <a href="#normal-scope-control">normal</a> or <a href="#advanced-scope-control">advanced</a> mode.
            Normal mode performs better in mode situations, but advanced mode provides more power and flexibility where
            needed. Both types of scope control rules are case insensitive.
        </p>
        <h2 id="normal-scope-control">Normal Scope Control</h2>
        <p>
            Normal scope control is ideal for most purposes, and involves simply specifying URL prefixes for items that
            are in or out of scope. Each prefix can include a specific protocol, or can omit the protocol to match both
            HTTP and HTTPS.
        </p>
        <p>
            Examples of valid URL prefixes are:
        </p>
        <ul>
            <li>
                http://example.com/path
            </li>
            <li>
                https://example.com/admin
            </li>
            <li>
                example.com
            </li>
            <li>
                example.com/myapp/
            </li>
            <li>
                http://example.com:8080/login
            </li>
        </ul>
        <p>
            Note that wildcard expressions are not supported in simple URL prefixes.
        </p>
        <h2 id="advanced-scope-control">Advanced Scope Control</h2>
        <p>
            Advanced scope control provides more power and flexibility than normal scope control, and uses URL-matching
            rules rather than simple prefixes. Each URL-matching rule can specify various features of the URLs that will
            be matched. For a URL to match the rule, it must match all of the features that are specified by the rule.
            The following items can be configured:
        </p>
        <ul>
            <li>
                <strong>Protocol</strong> - This specifies the protocol(s) that the rule will match. Available options
                are: HTTP, HTTPS, or any.
            </li>
            <li>
                <strong>Host or IP range</strong> - This specifies the host(s) that the rule will match. You can enter a
                regular expression to match the hostname, or an IP range in various standard formats, for example
                10.1.1.1/24 or 10.1.1-20.1-127. If the host field is left blank, then the rule can match URLs containing
                any host.
            </li>
            <li>
                <strong>Port</strong> - This specifies the port(s) that the rule will match. You can enter a regular
                expression to match one or more port numbers. If the port field is left blank, then the rule can match
                URLs containing any port.
            </li>
            <li>
                <strong>File</strong> - This specifies the file portion of the URL that the rule will match (ignoring
                any query string). You can enter a regular expression to match the required range of URL files. If the
                file field is left blank, then the rule can match URLs containing any file.
            </li>
        </ul>
        <p>
            Often, the easiest way to create an advanced URL-matching rule is to copy the relevant URL to the clipboard
            from elsewhere (either your browser or from a request within Burp), and click the "Paste URL" button on the
            URL-matching rule dialog. This will create a rule that matches this URL, and also any others that have this
            URL as a prefix (Burp places a wildcard at the end of the file expression). You can then manually edit the
            rule as required, to fine-tune the URLs that are matched.
        </p>
        <p>
            You can also use the "Load ..." button to load a list of items from a text file. Each item in list should be
            either a URL or a hostname, and Burp will create an appropriate rule for each item.
        </p>
    </div>
</section>
</body>
</html>