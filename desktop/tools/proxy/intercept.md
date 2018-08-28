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
            <a href="index.html">Proxy</a>
        </li>
        <li>
            <a href="intercept.html">Intercepting Messages</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Intercepting Messages</h1>
        <p>
            The Intercept tab is used to display and modify HTTP and WebSockets messages that pass between your browser
            and web servers. The ability to monitor, intercept and modify all messages is a core part of Burp's <a href="../../penetration-testing/index.html">user-driven workflow</a>. In Burp Proxy's options, you can configure <a href="options/index.html#intercepting-http-requests-and-responses">interception rules</a> to determine exactly what HTTP requests and
            responses are stalled for interception (for example, in-scope items, items with specific file extensions,
            requests with parameters, etc.). You can also configure which <a href="options/index.html#intercepting-websockets-messages">WebSockets messages</a> are intercepted.
        </p>
        <h2 id="controls">Controls</h2>
        <p>
            When an intercepted message is being displayed, details of the destination server are shown at the top of
            the panel. For HTTP requests, you can manually edit the target server to which the request will be sent, by
            clicking on the server caption or the button next to it.
        </p>
        <p>
            The panel also contains the following controls:
        </p>
        <ul>
            <li>
                <strong>Forward</strong> - When you have reviewed and (if required) edited the message, click "Forward"
                to send the message on to the server or browser.
            </li>
            <li>
                <strong>Drop</strong> - Use this to abandon the message so that it is not forwarded.
            </li>
            <li>
                <strong>Interception is on/off</strong> - This button is used to toggle all interception on and off. If
                the button is showing "Intercept is on", then messages will be intercepted or automatically forwarded
                according to the configured options for interception of <a href="options/index.html#intercepting-http-requests-and-responses">HTTP</a> and <a href="options/index.html#intercepting-websockets-messages">WebSockets</a> messages. If the button is showing
                &quot;Intercept is off&quot; then all messages will be automatically forwarded.
            </li>
            <li>
                <strong>Action</strong> - This shows a menu of available actions that can be performed on the currently
                displayed message. These are the same options that appear on the context menu of the intercepted <a href="#message-display">message display</a>.
            </li>
            <li>
                <strong>Comment field</strong> - This lets you add a comment to interesting items, to easily identify
                them later. Comments added in the intercept panel will appear in the relevant item in the <a href="history.html">Proxy history</a>. Further, if you add a comment to an HTTP request, the
                comment will appear again if the corresponding response is also intercepted.
            </li>
            <li>
                <strong>Highlight</strong> - This lets you apply a colored highlight to interesting items. As with
                comments, highlights will appear in the Proxy history and on intercepted responses.
            </li>
        </ul>
        <p>
            <strong>Note:</strong> You can also use hotkeys to forward or drop intercepted messages. By default, Ctrl+F
            is used to forward the current message. You can modify the default hotkeys in the <a href="../../options/misc-user.html#hotkeys">hotkey options</a>.
        </p>
        <h2 id="message-display">Message Display</h2>
        <p>
            The main panel of the Intercept tab contains a <a href="../../functions/message-editor/index.html">message
            editor</a> that shows the currently intercepted message, allowing you to analyze the message and perform
            numerous actions on it.
        </p>
        <p>
            The editor context menu contains numerous useful items. In addition to the <a href="../../functions/message-editor/index.html#context-menu-commands">standard functions</a> provided by the editor itself, the
            following actions are available for HTTP messages:
        </p>
        <ul>
            <li>
                <strong>Don&#39;t intercept requests/responses</strong> - These commands allow you to quickly add an <a href="options/index.html#intercepting-http-requests-and-responses"> interception rule</a> to prevent future interception of
                messages that share a specific feature with the currently displayed message (based on the host, file
                extension, HTTP status code, etc.). If you are being bugged by uninteresting requests or responses of a
                particular type, you can use this option to automatically forward all such messages.
            </li>
            <li>
                <strong>Do intercept</strong> - Available for requests only, this allows you to require that the
                response to the currently displayed request should be intercepted.
            </li>
        </ul>
    </div>
</section>
</body>
</html>