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
            <a href="index.html">Repeater</a>
        </li>
        <li>
            <a href="using.html">Using Burp Repeater</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Using Burp Repeater</h1>
        <p>
            Burp Repeater is a simple tool for manually manipulating and reissuing individual HTTP requests, and
            analyzing the application&#39;s responses. You can use Repeater for all kinds of purposes, such as changing
            parameter values to test for input-based vulnerabilities, issuing requests in a specific sequence to test
            for logic flaws, and reissuing requests from <a href="../target/site-map/index.html#issues-view"> Burp Scanner
            issues</a> to manually verify reported issues.
        </p>
        <h2 id="issuing-requests">Issuing Requests</h2>
        <p>
            The main Repeater UI lets you work on multiple different requests simultaneously, each in its own tab. When
            you send requests to Repeater, each one is opened in its own numbered tab. Each tab contains the following
            items:
        </p>
        <ul>
            <li>
                Controls to issue requests and navigate the request history. The target server to which the request will
                be sent is shown - you can click on the target details to change these.
            </li>
            <li>
                An <a href="../../functions/message-editor/index.html">HTTP message editor</a> containing the request to be
                issued. You can edit the request and reissue it over and over.
            </li>
            <li>
                An <a href="../../functions/message-editor/index.html">HTTP message editor</a> showing the response that was
                received from the last issued request.
            </li>
        </ul>
        <p>
            The easiest way to start working with Repeater is to select the request you want to work on within another
            Burp tool (such as the <a href="../proxy/history.html">Proxy history</a> or Target <a href="../target/site-map/index.html">site map</a>), and use the &quot;Send to Repeater&quot; option on the context
            menu. This will create a new request tab in Repeater, and automatically populate the target details and
            request message editor with the relevant details. You can then modify and issue the request as required.
        </p>
        <p>
            When your request is ready to send, click the "Go" button to send it to the server. The response is
            displayed when this is received, together with the response length and a timer (in milliseconds). You can
            use the usual <a href="../../functions/message-editor/index.html">HTTP message editor</a> functions to help analyze
            the request and response messages, and carry out further actions.
        </p>
        <h2 id="request-history">Request History</h2>
        <p>
            Each Repeater tab maintains its own history of the requests that have been made within it. You can click the
            "&lt;" and "&gt;" buttons to navigate backwards and forwards through this history and view each request and
            response. You can also use the drop-down buttons to show a numbered list of adjacent items in the history,
            and quickly move to them. At any point in the history, you can edit and reissue the currently displayed
            request.
        </p>
        <h2 id="repeater-options">Repeater Options</h2>
        <p>
            Burp Repeater has various <a href="options.html">options</a> that control its behavior, including
            automatic updating of the Content-Length header, unpacking of compressed content, and the following of
            redirections. You can access these options via the Repeater menu.&nbsp;
        </p>
        <h2 id="managing-request-tabs">Managing Request Tabs</h2>
        <p>
            You can easily manage Repeater's request tabs. You can:
        </p>
        <ul>
            <li>
                Rename tabs by double-clicking the tab header.
            </li>
            <li>
                Reorder tabs by dragging them.
            </li>
            <li>
                Open a new tab by clicking on the right-most "..." tab.
            </li>
            <li>
                Close tabs by clicking the X button in the tab header.
            </li>
        </ul>
    </div>
</section>
</body>
</html>