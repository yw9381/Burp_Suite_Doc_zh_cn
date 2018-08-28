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
            <a href="options.html">Options</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Burp Repeater Options</h1>
        <p>
            The Repeater menu controls aspects of Burp Repeater&#39;s behavior. The following options are
            available:
        </p>
        <ul>
            <li>
                <strong>Update Content-Length</strong> - This option controls whether Burp automatically updates the
                Content-Length header of the request where necessary. Using this option is normally essential when the
                request message contains a body.
            </li>
            <li>
                <strong>Unpack gzip / deflate</strong> - This option controls whether Burp automatically unpacks gzip-
                and deflate-compressed content received in responses.
            </li>
            <li>
                <strong>Follow redirections</strong> - This setting controls whether redirection responses are
                automatically followed.
                <strong>Note:</strong> If Repeater receives a redirection response which it is not configured to follow
                automatically, it will display a "Follow redirection" button near to the top of the UI. This allows you
                to manually follow the redirection after viewing it. This feature is useful for walking through each
                request and response in a redirection sequence. New cookies will be processed in these manual
                redirections if this option has been set in the "Process cookies in redirections" option described
                below.
            </li>
            <li>
                <strong>Process cookies in redirections</strong> - If this option is selected, then any cookies set in
                the redirection response will be resubmitted when the redirection target is followed.
            </li>
            <li>
                <strong>View</strong> - This submenu lets you configure the layout of the request/response panel. You
                can view the HTTP messages in a top/bottom split, a left/right split, or in tabs.
            </li>
            <li>
                <strong>Action</strong> - This submenu contains the same options as are available on via the context
                menu of the request and response <a href="../../functions/message-editor/index.html">message editors</a>.
            </li>
        </ul>
    </div>
</section>
</body>
</html>