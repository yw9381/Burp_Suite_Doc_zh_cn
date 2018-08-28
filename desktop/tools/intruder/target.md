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
            <a href="index.html">Intruder</a>
        </li>
        <li>
            <a href="target.html">Target</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Attack Target</h1>
        <p>
            This tab is used to configure the details of the target server for the attack. The required options
            are:
        </p>
        <ul>
            <li>
                <strong>Host</strong> - This is the IP address or hostname of the target server.
            </li>
            <li>
                <strong>Port</strong> - This is the port number of the HTTP/S service.
            </li>
            <li>
                <strong>Use HTTPS</strong> - This specifies whether SSL should be used.
            </li>
        </ul>
        <p>
            The easiest way to configure these details is to select the request you want to attack anywhere within Burp,
            and choose the "Send to Intruder" option on the context menu. This will send the selected request to a new
            tab in Intruder, and will automatically populate the Target and <a href="positions.html">Positions</a> tabs.&nbsp;
        </p>
    </div>
</section>
</body>
</html>