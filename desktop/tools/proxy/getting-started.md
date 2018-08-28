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
            <a href="getting-started.html">Getting Started</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Getting Started With Burp Proxy</h1>
        <p>
            Burp Proxy lies at the heart of Burp's <a href="../../penetration-testing/index.html">user-driven workflow</a>. It operates
            as a web proxy server between your browser and target applications, and lets you intercept, inspect and
            modify the raw traffic passing in both directions.
        </p>
        <div class="rounded-corner-box">
            <p>
                Also in the <a href="https://support.portswigger.net/">Burp Suite Support Center</a>:
            </p>
            <ul class="link-list">
                <li>
                    <a href="https://support.portswigger.net/customer/portal/articles/1783118-getting-started-with-burp-proxy"> Getting started with Burp Proxy</a>
                </li>
            </ul>
        </div>
        <div class="rounded-corner-box">
            <p>
                <strong>Note:</strong> Using Burp Proxy may result in unexpected effects in some applications. Until you
                are fully familiar with its functionality and settings, you should only use Burp Proxy against
                non-production systems.
            </p>
        </div>
        <p>
            To start getting to know Burp Proxy, carry out the following steps:
        </p>
        <ol>
            <li>
                First, ensure that Burp is <a href="../../getting-started/index.html#launching-burp">installed and running</a>, and
                that you have <a href="../../getting-started/projects.html"> configured your browser</a> to work with
                Burp.
            </li>
            <li>
                In Burp, go to the Proxy Intercept tab, and ensure that interception is on (if the button says
                "Intercept is off" then click it to toggle the interception status).
            </li>
            <li>
                In your browser, visit any URL. The browser will sit waiting until the request completes.
            </li>
            <li>
                In Burp, go to the Proxy Intercept tab. You should see your browser's request displayed for you to view
                and edit. Click through each of the message editor tabs (Raw, Headers, etc.) to see the different ways
                of analyzing the message.
            </li>
            <li>
                Click the "Forward" button to send the request to the server. In most cases, your browser will make more
                than one request in order to display the page (for images, etc.). Look at each subsequent request and
                then forward it to the server. When there are no more requests to forward, your browser should have
                finished loading the URL you requested.
            </li>
            <li>
                In your browser, click the Refresh button to reload the current page.
            </li>
            <li>
                In Burp, this time edit the request in the Proxy Intercept tab. Change the URL in the first line of the
                request so that a nonexistent item is requested. Forward the request (and any subsequent ones) to the
                server. Then look back in your browser. Although your browser requested the same URL as before, you
                should see a "Not found" message, because you changed the actual outgoing request on the fly, within
                Burp.
            </li>
            <li>
                In Burp, go to the Proxy History tab. This contains a table of all HTTP messages that have passed
                through the Proxy. Select an item in the table, and look at the HTTP messages in the request and
                response tabs. If you select the item that you modified, you will see separate tabs for the original and
                modified requests.
            </li>
            <li>
                Click on a column header in the Proxy history. This sorts the contents of the table according to that
                column. Click the same header again to reverse-sort on that column, and again to clear the sorting and
                show items in the default order. Try this for different columns.
            </li>
            <li>
                Within the history table, click on a cell in the leftmost column, and choose a color from the drop-down
                menu. This will highlight that row in the selected color. In another row, double-click within the
                Comment column and type a comment. You can use highlights and comments to annotate the history and
                identify interesting items.
            </li>
            <li>
                Above the history table there is a filter bar. Click on the filter bar to show the options available.
                Try changing the filter settings in various ways, and see the effect on what is shown in the history
                table. When the Proxy history has become very large, you can use the filter to hide certain types of
                items, to help find items you are looking for.
            </li>
            <li>
                Select an item in the history, and show the context menu (usually, by right-clicking your mouse). The
                options on the context menu are used to drive your testing workflow within Burp. Choose "Send to
                Repeater", and go to the Repeater tab. You will see the selected request has been copied into the <a href="../repeater/using.html">Repeater</a> tool, for further testing. For more details on sending items
                between Burp tools, and the overall testing workflow, see <a href="../../penetration-testing/index.html"> Using Burp
                Suite</a>.
            </li>
            <li>
                Go to the Proxy Options tab, and look at all the options that are available. These can be used to change
                the behavior of the Proxy listeners, define rules to determine what request and response messages are
                intercepted by the Proxy, perform automatic modification of messages, and control the Proxy's behavior
                in other ways. For more details, see <a href="options/index.html">Burp Proxy Options</a>.
            </li>
        </ol>
        <div class="rounded-corner-box">
            <p>
                Use the links below for further help on starting to use Burp Proxy:
            </p>
            <ul class="link-list">
                <li>
                    <a href="using.html">Using Burp Proxy</a>
                </li>
                <li>
                    <a href="../../penetration-testing/index.html">Using Burp Suite</a>
                </li>
                <li>
                    <a href="../../troubleshooting.html">Troubleshooting common problems</a>
                </li>
            </ul>
        </div>
    </div>
</section>
</body>
</html>