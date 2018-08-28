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
            <a href="history.html">History</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Burp Proxy History</h1>
        <p>
            The Proxy history maintains a <a href="#history-table">full record</a> of all messages that have passed through the
            Proxy. You can <a href="#proxy-history-display-filter">filter</a> and <a href="#proxy-history-annotations"> annotate</a> this information to
            help manage it, and also use the Proxy history to drive your <a href="#proxy-history-testing-workflow">testing workflow</a>.
        </p>
        <p>
            The Proxy history is always updated even when you have <a href="intercept.html#controls">interception
            turned off</a>, allowing you to browse without interruption while still monitoring key details about
            application traffic.
        </p>
        <h2 id="history-table">History Table</h2>
        <p>
            Separate history tables are shown for HTTP and WebSockets messages. Each table shows full details of the
            messages that have passed through the Proxy, and any modifications you have made to <a href="intercept.html">intercepted</a> messages.
        </p>
        <p>
            The HTTP history table contains the following columns:
        </p>
        <ul>
            <li>
                The request index number
            </li>
            <li>
                The protocol and server hostname
            </li>
            <li>
                The HTTP method
            </li>
            <li>
                The URL file path and query string
            </li>
            <li>
                Flag whether the request contains any parameters
            </li>
            <li>
                Flag whether the request or response were modified by the user
            </li>
            <li>
                The HTTP status code of the response
            </li>
            <li>
                The length of the response in bytes
            </li>
            <li>
                The MIME type of the response
            </li>
            <li>
                The URL file extension
            </li>
            <li>
                The page title (for HTML responses)
            </li>
            <li>
                Any user-applied <a href="#proxy-history-annotations">comment</a>
            </li>
            <li>
                Flag whether SSL is used
            </li>
            <li>
                The IP address of the destination server
            </li>
            <li>
                Any cookies that were set in the response
            </li>
            <li>
                The time the request was made
            </li>
            <li>
                The <a href="options/index.html#binding">listener port</a> on which the request was received
            </li>
        </ul>
        <p>
            The WebSockets history table contains the following columns:
        </p>
        <ul>
            <li>
                The request index number
            </li>
            <li>
                The URL of the WebSockets connection
            </li>
            <li>
                The direction of the message (outgoing vs incoming)
            </li>
            <li>
                Flag whether the message was modified by the user
            </li>
            <li>
                The length of the response in bytes
            </li>
            <li>
                Any user-applied <a href="#proxy-history-annotations">comment</a>
            </li>
            <li>
                Flag whether SSL is used
            </li>
            <li>
                The time the message was received
            </li>
            <li>
                The <a href="options/index.html#binding">listener port</a> on which the message was received
            </li>
        </ul>
        <p>
            You can reorder the table's contents by clicking on any column header (clicking a header cycles through
            ascending sort, descending sort, and unsorted). For example, if you prefer your history table to grow
            "upwards", with the most recent items at the top of the table, then you can apply a descending sort to the
            request number column.
        </p>
        <p>
            You can also reorder the table's columns by dragging columns. This can be useful if you want to ensure that
            certain columns are always visible.
        </p>
        <p>
            If you select an item in the table, the lower pane shows the relevant message(s) for the item (whether HTTP
            or WebSockets messages). If a message was modified, either through <a href="intercept.html">user
            interception</a> or through <a href="options/index.html#response-modification">automatic response modification</a> or <a href="options/index.html#match-and-replace">match and replace rules</a>, then each modified message is shown
            separately. The lower pane contains a <a href="../../functions/message-editor/index.html">message editor</a> for
            each message, providing detailed analysis.
        </p>
        <p>
            In addition to the main history view, you can also:
        </p>
        <ul>
            <li>
                Double-click an item in the table to show the item in a pop-up window.
            </li>
            <li>
                Use the <a href="#proxy-history-testing-workflow">context menu</a> to open a new history window with its own <a href="#proxy-history-display-filter">display filter</a>.
            </li>
        </ul>
        <h2 id="proxy-history-display-filter">Proxy history display filter</h2>
        <p>
            Each history table has a display filter that can be used to hide some of its content from view, to make it
            easier to analyze and work on the content you are interested in.
        </p>
        <p>
            The filter bar above the history table describes the current display filter. Clicking the filter bar opens
            the filter options for editing.
        </p>
        <p>
            The HTTP history filter can be configured based on the following attributes:
        </p>
        <ul>
            <li>
                <strong>Request type</strong> - You can show only <a href="../target/scope.html">in-scope</a> items, only
                items with responses, or only requests with parameters.
            </li>
            <li>
                <strong>MIME type</strong> - You can configure whether to show or hide responses containing various
                different MIME types, such as HTML, CSS, or images.
            </li>
            <li>
                <strong>Status code</strong> - You can configure whether to show or hide responses with various HTTP
                status codes.
            </li>
            <li>
                <span class="pro-edition-feature-label">Professional</span>
                <strong>Search term</strong> - You can filter on whether or not responses contain a specified search
                term. You can configure whether the search term is a literal string or a regular expression, and whether
                it is case sensitive. If you select the "Negative search" option, then only items not matching the
                search term will be shown.
            </li>
            <li>
                <strong>File extension</strong> - You can configure whether to show or hide items with specified file
                extensions.
            </li>
            <li>
                <strong>Annotation</strong> - You can configure whether to show only items with user-supplied <a href="#proxy-history-annotations"> comments or highlights</a>.
            </li>
            <li>
                <strong>Listener</strong> - You can show only items received on a specific <a href="options/index.html#binding">listener port</a>. This can be useful when <a href="#proxy-history-testing-workflow">testing access controls</a>.
            </li>
        </ul>
        <p>
            The WebSockets history filter can be configured based on the following attributes:
        </p>
        <ul>
            <li>
                <strong>Request type</strong> - You can show only <a href="../target/scope.html">in-scope</a> items (based
                on the URL of the WebSockets connection), or only incoming or outgoing messages.
            </li>
            <li>
                <span class="pro-edition-feature-label">Professional</span>
                <strong>Search term</strong> - You can filter on whether or not messages contain a specified search
                term. You can configure whether the search term is a literal string or a regular expression, and whether
                it is case sensitive. If you select the "Negative search" option, then only items not matching the
                search term will be shown.
            </li>
            <li>
                <strong>Annotation</strong> - You can configure whether to show only items with user-supplied <a href="#proxy-history-annotations"> comments or highlights</a>.
            </li>
            <li>
                <strong>Listener</strong> - You can show only items received on a specific <a href="options/index.html#binding">listener port</a>. This can be useful when <a href="#proxy-history-testing-workflow">testing access controls</a>.
            </li>
        </ul>
        <p>
            The content displayed within the Proxy history is effectively a view into an underlying database, and the
            display filters control what is included in that view. If you set a filter to hide some items, these are not
            deleted, only hidden, and will reappear if you unset the relevant filter. This means you can use the filter
            to help you systematically examine a large Proxy history to understand where different kinds of interesting
            requests appear.
        </p>
        <h2 id="proxy-history-annotations">Proxy history annotations</h2>
        <p>
            You can annotate Proxy history items by adding comments and highlights. This can be useful to describe the
            purpose of different items, and to flag up interesting items for further investigation.
        </p>
        <p>
            You can add highlights in two ways:
        </p>
        <ul>
            <li>
                You can highlight individual items using the drop-down menu on the left-most table column.
            </li>
            <li>
                You can highlight one or more selected items using the "Highlight" item on the context menu.
            </li>
        </ul>
        <p>
            You can add comments in two ways:
        </p>
        <ul>
            <li>
                You can double-click the relevant entry, within the Comment column, to add or edit a comment in-place.
            </li>
            <li>
                You can comment one or more selected items using the "Add comment" item on the context menu.
            </li>
        </ul>
        <p>
            You can also annotate items as they appear in the <a href="intercept.html">Intercept tab</a>, and
            these will automatically appear in the history table.
        </p>
        <p>
            When you have annotated interesting items, you can use column sorting and the <a href="#proxy-history-display-filter">display
            filter</a> to quickly find these items later.
        </p>
        <h2 id="proxy-history-testing-workflow">Proxy history testing workflow</h2>
        <p>
            As well as displaying details of all messages passing through the Proxy, the history enables you to control
            and initiate specific attacks, using the context menu. Depending on the type of history being shown, the options described below are available.
        </p>
            <h4>Add to / remove from scope</h4>
        <p>
            These options create new <a href="../target/scope.html">target
                scope</a> rules which add or remove the selected item(s) from scope.
        </p>
            <h4>Scan / Spider / Send to ...</h4>
        <p>
            You can send any item to other Burp tools, to perform
            further attacks or analysis. The ability to send requests between tools forms the core of Burp's <a href="../../penetration-testing/index.html"> user-driven workflow</a>.
        </p>
            <h4>Show response in browser</h4>
        <p>
            You can use this to render the selected response in your
            browser, to avoid the limitations of Burp's built-in <a href="../../functions/message-editor/index.html#render">HTML renderer</a>. When you select this option,
            Burp gives you a unique URL that you can paste into your browser (configured to use the current instance
            of Burp as its proxy), to render the response. The resulting browser request is served by Burp with the
            exact response that you selected (the request is not forwarded to the original web server), and yet the
            response is processed by the browser in the context of the originally requested URL. Hence, relative
            links within the response will be handled properly by your browser. As a result, your browser may make
            additional requests (for images, CSS, etc.) in the course of rendering the response - these will be
            handled by Burp in the usual way.
        </p>
            <h4>Request in browser</h4>
        <p>
            You can use this to re-issue the selected request in your browser
            (configured to use the current instance of Burp as its proxy). The following sub-options are available:
        </p>
        <ul>
                    <li>
                        <strong>In original session</strong> - This causes Burp to issue the request using the exact
                        Cookie header that appeared in the original request.
            </li>
                    <li>
                        <strong>In current browser session</strong> -&nbsp;This causes Burp to issue the request using
                        the cookies supplied by your browser. You can use this feature to facilitate testing of access
                        controls, by selecting requests within Burp that were generated within one user context (e.g. an
                        administrator), and reissuing the requests within a different user context that you are now
                        logged in as (e.g. an ordinary user). When you are dealing with complex, multi-stage processes,
                        this methodology, of manually pasting a series of URLs from Burp into your browser, is normally
                        a lot easier than repeating a multi-stage process over and over, and modifying cookies manually
                        using the Proxy.
                    </li>
        </ul>
            <h4>Engagement tools</h4>
        <p>
            <span class="pro-edition-feature-label">Professional</span>
            This submenu contains various useful functions for carrying out
            engagement-related tasks:
        </p>
        <ul>
                    <li>
                        <strong>Find references</strong> - You can use the <a href="../../functions/search.html#find-references">Find references</a> function to search all of
                        Burp&#39;s tools for HTTP responses that link to the selected item.
            </li>
                    <li>
                        <strong>Discover content</strong> - You can use the <a href="../../functions/content-discovery.html">Discover content</a> function to discover
                        content and functionality that is not linked from visible content which you can browse to or
                        spider.
                    </li>
                    <li>
                        <strong>Schedule task</strong> - You can use the <a href="../../functions/task-scheduler.html">Schedule
                        task</a> function to create tasks that will run automatically at defined times and intervals.
                    </li>
                    <li>
                        <strong>Generate CSRF PoC</strong> - You can use the <a href="../../functions/generate-csrf-poc.html">Generate
                        CSRF PoC</a> function to create some HTML which, when viewed in a browser, will cause the
                        selected request to be issued.
                    </li>
        </ul>
            <h4>Show new history window</h4>
        <p>
            This creates a new window containing a new view of the Proxy
            history. In some situations, it can be useful to display more than one view into the underlying history
            data, and apply different filters to each view. For example, when testing access controls, you may log
            into an application in different user contexts, and want to review separately the different sequences of
            requests that occur in each user context. You can do this by using a separate browser for each user
            context you are testing, and create a separate <a href="options/index.html#proxy-listeners">Proxy listener</a> for use by each browser (you will need to update your <a href="../../getting-started/projects.html">proxy
                configuration</a> in each browser to point to the relevant listener). For each browser, you can then
            open a separate Proxy history window, and set the <a href="#proxy-history-display-filter">display filter</a> to show only
            requests from the relevant Proxy listener port. As you use the application in each browser, each history
            window will show only the items for the associated user context. You can then use the "Request in
            browser in current browser session" function to switch requests between browsers, to determine how they
            are handled in that browser's user context.
        </p>
            <h4>Add comment</h4>
        <p>
            You can use this function to add a comment to the selected item(s). See <a href="#proxy-history-annotations"> Annotations</a> for more details.
        </p>
            <h4>Highlight</h4>
        <p>
            You can use this function to apply a highlight to the selected item(s). See <a href="#proxy-history-annotations"> Annotations</a> for more details.
        </p>
            <h4>Delete item(s)</h4>
        <p>
            This function removes the selected item(s) permanently
        </p>
            <h4>Copy URL(s)</h4>
        <p>
            This function copies the URL(s) of the selected item(s) to the clipboard.
        </p>
            <h4>Copy as curl command</h4>
        <p>
            This function copies to the clipboard a curl command that can be
            used to generate the selected request.
        </p>
            <h4>Copy links</h4>
        <p>
            This function parses the selected item(s) for links, and copies these to
            the clipboard.
        </p>
            <h4>Save item(s)</h4>
        <p>
            This function lets you specify a file to save the details of selected
            item(s) in XML format, including full requests and responses, and all relevant metadata such as response
            length, HTTP status code and MIME type.
        </p>
    </div>
</section>
</body>
</html>