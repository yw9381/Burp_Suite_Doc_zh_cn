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
            <a href="http.html">HTTP</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Options: HTTP</h1>
        <p>
            This tab contains settings to control how Burp handles HTTP <a href="#redirections">redirections</a>, <a href="#streaming-responses"> streaming responses</a> and <a href="#status-100-responses">status 100 responses</a>.
        </p>
        <h2 id="redirections">Redirections</h2>
        <p>
            These settings control the types of redirections that Burp will understand in situations where it is
            configured to follow redirections.
        </p>
        <p>
            The following types of redirection can be selected:
        </p>
        <ul>
            <li>
                3xx status code with Location header
            </li>
            <li>
                Refresh header
            </li>
            <li>
                Meta refresh tag
            </li>
            <li>
                JavaScript-driven
            </li>
            <li>
                Any status code with Location header
            </li>
        </ul>
        <p>
            Note that Burp's behavior in following redirections to particular targets is determined by settings within
            each individual Burp tool (for instance, based on <a href="../tools/target/scope.html">Target scope</a>).
        </p>
        <h2 id="streaming-responses">Streaming Responses</h2>
        <p>
            These settings let you inform Burp which URLs return "streaming" responses, which do not terminate. Burp
            will then handle these responses differently than normal responses.
        </p>
        <p>
            Streaming responses are often used for functions like continuously updating price data in trading
            applications. Typically, some client side script code makes a request, and the server keeps the response
            stream open, pushing further data in real time as this becomes available. Because intercepting proxies use a
            store-and-forward model, they can break these applications: the Proxy waits indefinitely for the streaming
            response to finish, and none of it is ever forwarded to the client.
        </p>
        <p>
            Streaming responses are handled in the following way by individual Burp tools:
        </p>
        <ul>
            <li>
                The <strong>Proxy</strong> will pass these responses straight through to the client as data is received.
            </li>
            <li>
                <strong>Repeater</strong> will update the response panel in real time as data is received.
            </li>
            <li>
                <strong>Other tools</strong> will ignore streaming responses and will close the connection.
            </li>
        </ul>
        <p>
            For help configuring the list of streaming URLs, refer to the help on <a href="../functions/url-matching.html"> URL matching rules</a>.
        </p>
        <p>
            Two further options are available relating to streaming responses:
        </p>
        <ul>
            <li>
                <strong>Store streaming responses</strong> - This causes Burp to store streaming responses in full.
                Using this option is necessary if you wish to view the contents of streaming responses within the <a href="../tools/proxy/history.html"> Proxy history</a> and <a href="../tools/repeater/using.html#issuing-requests">Repeater
                response panel</a>. Note that using this option may result in large temporary files.
            </li>
            <li>
                <strong>Strip chunked encoding metadata in streaming responses</strong> - Streaming responses are
                generally chunked-encoded over HTTP. If this option is selected, Burp will remove the chunked encoding
                metadata, making the responses more easily readable within Burp. Note that removing this metadata may
                break the client-side application, depending on how it is implemented.
            </li>
        </ul>
        <p>
            Streaming responses are often compressed using GZIP encoding - you can configure Burp to decompress this
            content via the normal options in the <a href="../tools/proxy/options/index.html#miscellaneous">Proxy</a> and <a href="../tools/repeater/options.html">Repeater</a> configurations.
        </p>
        <p>
            Note that you can also use the streaming responses support for handling very large responses that are not
            strictly streaming (such as binary file downloads), in order to bypass the store-and-forward proxy model and
            improve Burp's performance.
        </p>
        <h2 id="status-100-responses">Status 100 Responses</h2>
        <p>
            These settings control the way Burp handles HTTP responses with status 100. These responses often occur when
            a POST request is sent to the server, and it makes an interim response before the request body has been
            transmitted.
        </p>
        <p>
            The following settings are available:
        </p>
        <ul>
            <li>
                <strong> Understand 100 Continue responses </strong> - If this option is checked, Burp will skip the
                interim response and parse the real response headers for response information like status code and
                content type.
            </li>
            <li>
                <strong>Remove 100 Continue headers</strong> - If this option is checked, Burp will remove any interim
                headers from the server&#39;s response before this is passed to individual tools.
            </li>
        </ul>
    </div>
</section>
</body>
</html>