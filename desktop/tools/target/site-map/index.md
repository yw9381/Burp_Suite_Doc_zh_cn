<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../../../../../styles/css/ps.css">
</head>
<body>
<section class="container ps-breadcrumbs">
    <ol>
        <li>
            <a href="https://support.portswigger.net/">Support Center</a>
        </li>
        <li>
            <a href="../../../../index.html">Documentation</a>
        </li>
        <li>
            <a href="../../../index.html">Desktop Editions</a>
        </li>
        <li>
            <a href="../../index.html">Tools</a>
        </li>
        <li>
            <a href="../index.html">Target</a>
        </li>
        <li>
            <a href="index.html">Target Site Map</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Target Site Map</h1>
        <p>
            The site map aggregates all of the <a href="#target-information"> information</a> that Burp has gathered about
            applications. You can <a href="#site-map-display-filter">filter</a> and <a href="#site-map-annotations"> annotate</a> this information
            to help manage it, and also use the site map to drive your <a href="#site-map-testing-workflow">testing workflow</a>.
        </p>
        <h2 id="target-information">Target Information</h2>
        <p>
            The site map displays information about the contents and security issues that have been discovered in target
            applications. It lets you view the full requests and responses for individual items, and the full details
            about discovered issues.
        </p>
        <h3 id="site-map-views">Site Map Views</h3>
        <p>
            The left-hand-side tree view contains a hierarchical representation of content, with URLs broken down into
            domains, directories, files, and parameterized requests. You can expand interesting branches to see further
            detail. If you select one or more parts of the tree, the relevant details about all the selected items and
            items in child branches are shown in the right-hand-side view.
        </p>
        <p>
            The icons in the tree view also provide a visual indication of the most significant security issue that has
            been identified within each branch or item.
        </p>
        <p>
            The right-hand-side view contains details of both the <a href="#contents-view">contents</a> and discovered <a href="#issues-view">issues</a> for the items selected in the tree view. The contents and issues can be
            displayed within separate sub-tabs or in a left/right split.
        </p>
        <p><strong>Note:</strong> You can configure your preferred view via the View sub-menu on the context menu.</p>
        <p>
            You can pop up a new site map window, based on the same underlying data, using the "Show new site map
            window" option on the context menu. You can use the new window to display and monitor a different selection
            of target items. You can also apply a different <a href="#site-map-display-filter">display filter</a>.
        </p>
        <h3 id="contents-view">Contents View</h3>
        <p>
            The site map aggregates all of the content that Burp has observed in applications. This includes:
        </p>
        <ul>
            <li>
                All of the resources that have been directly requested via the <a href="../../proxy/index.html">Proxy</a>.
            </li>
            <li>
                Any items that have been inferred by analyzing the responses to proxy requests (provided you have not
                disabled <a href="../../../scanning/live-scans.html#live-passive-crawl">passive crawling</a>).
            </li>
            <li>
                Content discovered using the <a href="../../../scanning/index.html">Scanner</a> or <a href="../../../functions/content-discovery.html">content discovery</a> functions.
            </li>
            <li>
                Any items manually added by the user, from the output of other tools.
            </li>
        </ul>
        <p>
            Items in the site map that have been requested are shown in black. Items that have not yet been requested
            are shown in gray. By default (with <a href="../../../scanning/live-scans.html#live-passive-crawl">passive crawling</a> enabled)
            when you begin browsing a typical application, a large amount of content will appear in gray before you even
            get as far as requesting it, because Burp has discovered links to it in the content that you have requested.
            You can remove uninteresting content (for example, on other domains that are linked to from your target
            application), by setting an appropriate <a href="../scope.html">target scope</a> and using the site map <a href="#site-map-display-filter">display filter</a>.
        </p>
        <p>
            The contents table shows key details about each selected item (URL, HTTP status code, page title, etc.). You
            can sort the table according to any column (click the column header to cycle through ascending sort,
            descending sort, and unsorted). If you select an item in the table, the request and response (where
            available) for that item are shown in the request/response pane. This contains an <a href="../../../functions/message-editor/index.html">HTTP message editor</a> for the request and response, providing
            detailed analysis of each message.
        </p>
        <h3 id="issues-view">Issues View</h3>
        <p>
            The issues view of the site map shows the issues that Burp Scanner has identified for the selected items. If you select an issue, the relevant details
            are displayed, including:
        </p>
        <ul>
            <li>
A customized vulnerability advisory containing a&nbsp;standard description of the issue type and its remediation, and a description of any specific features that apply to the issue and affect its remediation.
            </li>
            <li>
                The full requests and responses that were the basis for reporting the issue. Where applicable, the parts
                of the request and response that are relevant to identifying and reproducing the issue are highlighted
                in the request and response <a href="../../../functions/message-editor/index.html">message editors</a>.
            </li>
            <li>
                Details of any interactions with the <a href="../../../../collaborator/index.html"> Burp Collaborator</a> server that were
                the basis for reporting the issue.
            </li>
        </ul>
        <p>
            Often, the fastest way to reproduce and verify an issue is to use the context menu on the message editor to
            send the request to Burp Repeater. Alternatively, for GET requests, you can copy the URL and paste it into
            your browser. Then you can reissue the request, and if necessary fine tune the proof-of-concept attack that
            was generated by Burp.
        </p>
        <p>
            Every issue that Burp Scanner reports is given a rating both for severity (high, medium, low, informational)
            and for confidence (certain, firm, tentative). When an issue has been identified using a technique that is
            inherently less reliable (such as for blind SQL injection), Burp makes you aware of this, by dropping the
            confidence level to less than certain. These ratings should always be interpreted as indicative, and you
            should review them based on your knowledge of the application's functionality and business context.
        </p>
        <p>
            The issues view has a context menu that you can use to perform the following actions:
        </p>
        <ul>
            <li>
                <strong>Report selected issues</strong> - This starts Burp Scanner's <a href="../../../scanning/reporting-results.html">reporting
                wizard</a>, to generate a formal report of the selected issues.
            </li>
            <li>
                <strong>Set severity</strong> - This lets you reassign the severity level of the issue. You can set the
                severity to high, medium, low, or informational. You can also flag the issue as a false positive.
            </li>
            <li>
                <strong>Set confidence</strong> - This lets you reassign the confidence level of the issue. You can set
                the confidence to certain, firm or tentative.
            </li>
            <li>
                <strong>Delete selected issues</strong> - This deletes the selected issues. Note that if you delete an
                issue, and Burp rediscovers the same issue (for example, if you rescan the same request), then the issue
                will be reported again. If instead you mark the issue as a false positive, then this will not happen.
                Therefore, deletion of issues is best used for cleaning up the scan results to remove hosts or paths you
                are not interested in. For unwanted issues within the functionality you are still working on, you should
                use the false positive option.
            </li>
        </ul>
        <h2 id="site-map-display-filter">Site map display filter</h2>
        <p>
            The site map has a display filter that can be used to hide some of its content from view, to make it easier
            to analyze and work on the content you are interested in.
        </p>
        <p>
            The filter bar above the site map describes the current display filter. Clicking the filter bar opens the
            filter options for editing. The filter can be configured based on the following attributes:
        </p>
        <ul>
            <li>
                <strong>Request type</strong> - You can show only <a href="../scope.html">in-scope</a> items, only
                requested items, only requests with parameters, or you can hide not-found items.
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
                <strong>Folders</strong> - You can optionally hide empty folders in the tree view. This is useful to
                remove folders whose child items have all been hidden by other display filter attributes.
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
                <strong>Annotation</strong> - You can configure whether to show only items with user-supplied <a href="#site-map-annotations"> comments or highlights</a>.
            </li>
        </ul>
        <p>
            The content displayed within the site map is effectively a view into an underlying database, and the display
            filter controls what is included in that view. If you set a filter to hide some items, these are not
            deleted, only hidden, and will reappear if you unset the relevant filter. This means you can use the filter
            to help you systematically examine a complex site map to understand where different kinds of interesting
            content reside.
        </p>
        <p>
            <strong>Note:</strong> If you often use different display filters, you can pop up additional site map
            windows (using the "Show new site map window" option on the context menu), and apply a different display
            filter to each window.
        </p>
        <h2 id="site-map-annotations">Site map annotations</h2>
        <p>
            In the contents table view, you can annotate items by adding comments and highlights. This can be useful to
            describe the purpose of different URLs, and to flag up interesting items for further investigation.
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
            When you have annotated interesting requests, you can use column sorting and the <a href="#site-map-display-filter">display
            filter</a> to quickly find these items later.
        </p>
        <h2 id="site-map-testing-workflow">Site map testing workflow</h2>
        <p>
            As well as displaying all of the information gathered about your target, the site map enables you to control
            and initiate specific attacks against the target, using the context menus that appear everywhere. The exact
            options that are available depend on the location where the context menu was invoked, and the type of
			item(s) selected. The complete list of context menu actions is as follows:</p>
            <h3>Add to / remove from scope</h3>
            <p>These options create new <a href="../scope.html">target
                scope</a> rules which add or remove the selected item(s) from scope. The rule generated will apply to
            the selected item and all child branches in the tree. A common technique when testing an application
            that includes some sensitive URLs is to add the whole application path (domain or directory) to the
            target scope, and then select the sensitive items and exclude them from scope.
        </p>
            <h3>Scan / Spider / Send to ...</h3>
            <p>
                You can send any item to other Burp tools, to perform
                further attacks or analysis. The ability to send requests between tools forms the core of Burp's <a href="../../../penetration-testing/index.html"> user-driven workflow</a>. For example, you can select a host or folder
                within the tree view, and perform actions on the entire branch of the tree, such as <a href="../../../../scanner/index.html">scanning for content or vulnerabilities</a>. Or you can select an
                individual item anywhere, and send the request to other Burp tools, such as <a href="../../intruder/index.html">Intruder</a> or <a href="../../repeater/index.html">Repeater</a>.
            </p>
            <h3>Show response in browser</h3>
        <p>
            You can use this to render the selected response in your
            browser, to avoid the limitations of Burp's built-in <a href="../../../functions/message-editor/index.html#render">HTML renderer</a>. When you select this option,
            Burp gives you a unique URL that you can paste into your browser (configured to use the current instance
            of Burp as its proxy), to render the response. The resulting browser request is served by Burp with the
            exact response that you selected (the request is not forwarded to the original web server), and yet the
            response is processed by the browser in the context of the originally requested URL. Hence, relative
            links within the response will be handled properly by your browser. As a result, your browser may make
            additional requests (for images, CSS, etc.) in the course of rendering the response - these will be
            handled by Burp in the usual way.
        </p>
            <h3>Request in browser</h3>
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
                        <strong>In current browser session</strong> - This causes Burp to issue the request using the
                        cookies supplied by your browser. You can use this feature to facilitate testing of access
                        controls, by selecting requests within Burp that were generated within one user context (e.g. an
                        administrator), and reissuing the requests within a different user context that you are now
                        logged in as (e.g. an ordinary user). When you are dealing with complex, multi-stage processes,
                        this methodology, of manually pasting a series of URLs from Burp into your browser, is normally
                        a lot easier than repeating a multi-stage process over and over, and modifying cookies manually
                        using the Proxy.
                    </li>
        </ul>
            <h3>Engagement tools</h3>
        <p>
            <span class="pro-edition-feature-label">Professional</span> This submenu contains various useful functions for carrying out
            engagement-related tasks:
        </p>
        <ul>
                    <li>
                        <strong>Search</strong> - You can use the <a href="../../../functions/search.html#text-search">Search
                        function</a> to search the selected branch(es) of the site map for items matching a specific
                        expression.
            </li>
                    <li>
                        <strong>Find comments / scripts</strong> - You can use the <a href="../../../functions/search.html#find-comments-and-scripts"> Find comments / scripts</a> functions to search
                        the selected branch(es) of the site map for comments and scripts.
                    </li>
                    <li>
                        <strong>Find references</strong> - You can use the <a href="../../../functions/search.html#find-references">Find references</a> function to search all of
                        Burp&#39;s tools for HTTP responses that link to the selected item.
                    </li>
                    <li>
                        <strong>Analyze target</strong> - You can use the <a href="../../../functions/target-analyzer.html">Target
                        Analyzer</a> function to analyze the selected branch(es) of the site map and tell you how many static and dynamic URLs it
                        contains, and how many parameters each URL takes.
                    </li>
                    <li>
                        <strong>Discover content</strong> - You can use the <a href="../../../functions/content-discovery.html">Discover content</a> function to discover
                        content and functionality that is not linked from visible content which you can browse to or
                        spider.
                    </li>
                    <li>
                        <strong>Schedule task</strong> - You can use the <a href="../../../functions/task-scheduler.html">Schedule
                        task</a> function to create tasks that will run automatically at defined times and intervals.
                    </li>
                    <li>
                        <strong>Generate CSRF PoC</strong> - You can use the <a href="../../../functions/generate-csrf-poc.html">Generate
                        CSRF PoC</a> function to create some HTML which, when viewed in a browser, will cause the
                        selected request to be issued.
                    </li>
                    <li>
                        <strong>Simulate manual testing</strong> - The <a href="../../../functions/manual-stimulator.html"> Manual testing simulator</a> can be used to generate HTTP traffic that is similar to that caused
                        by manual penetration testing.
                    </li>
        </ul>
            <h3>Compare site maps</h3>
        <p>
            You can use the <a href="comparing.html">Compare
                site maps</a> function to identify differences between two site maps. This is a powerful feature that
            can be used for various purposes, in particular testing for access control vulnerabilities.
        </p>
            <h3>Add comment</h3>
        <p>
            You can use this function to add a comment to the selected table item(s).
            See <a href="#site-map-annotations"> Annotations</a> for more details.
        </p>
            <h3>Highlight</h3>
        <p>
            You can use this function to apply a highlight to the selected table
            item(s). See <a href="#site-map-annotations"> Annotations</a> for more details.
        </p>
            <h3>Expand / collapse branch / requested items</h3>
        <p>
            You can use these functions in the tree
            view to quickly expand whole branches of the tree, and collapse them after you have reviewed them.
        </p>
            <h3>Delete item(s)</h3>
        <p>
            This function removes the selected item(s) permanently. Since by
            default the site map displays all content that Burp has identified based on HTTP responses, the map will
            often include a large amount of third-party content that is linked to from the application you are
            interested in. You can deal with this either by configuring a suitable <a href="../scope.html">target
                scope</a> and a <a href="#site-map-display-filter">display filter</a>, or by manually removing irrelevant branches of the
            tree.
        </p>
            <h3>Copy URL(s)</h3>
        <p>
            This function copies the URL(s) of the selected item(s) to the clipboard.
        </p>
            <h3>Copy as curl command</h3>
        <p>
            This function copies to the clipboard a curl command that can be
            used to generate the selected request.
        </p>
            <h3>Copy links</h3>
        <p>
            This function parses the selected item(s) for links, and copies these to
            the clipboard.
        </p>
            <h3>Save item(s)</h3>
        <p>
            This function lets you specify a file to save the details of selected
            item(s) in XML format, including full requests and responses, and all relevant metadata such as response
            length, HTTP status code and MIME type.
        </p>
    </div>
</section>
</body>
</html>