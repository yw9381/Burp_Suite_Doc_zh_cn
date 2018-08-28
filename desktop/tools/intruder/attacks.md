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
            <a href="attacks.html">Attacks</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Running Attacks</h1>
        <p>
            When you have configured all of the settings for your attack, you need to <a href="using.html#launching-an-attack">launch the
            attack</a>, analyze the <a href="#attack-results"> results</a>, and sometimes modify the <a href="#attack-configuration-tabs"> attack configuration</a>, link in with your <a href="#burp-intruder-testing-workflow"> testing workflow</a>, or carry out <a href="#results-menus">other actions</a>.
        </p>
        <h2 id="attack-results">Attack results</h2>
        <p>
            The Results tab contains the <a href="#results-table">full details</a> of every request issued in the
            attack. You can <a href="#intruder-attacks-display-filter">filter</a> and <a href="#annotations">annotate</a> this
            information to help analyze it, and also use it to drive your <a href="#burp-intruder-testing-workflow">testing
            workflow</a>.
        </p>
        <h3 id="results-table">Results Table</h3>
        <p>
            The results table shows details of all requests and responses that have been made in the attack. Depending
            on the attack configuration, the table may contain the following columns, some of which are hidden by
            default and can be unhidden using the <a href="#columns-menu">Columns menu</a>:
        </p>
        <ul>
            <li>
                The request number. If the attack was <a href="options.html#attack-results-options">configured</a> to make an
                unmodified baseline request, this appears as item number 0 in the table.
            </li>
            <li>
                The position number for the current payload (for <a href="positions.html#attack-type">sniper
                attacks</a>).
            </li>
            <li>
                The payload(s) used in the request.
            </li>
            <li>
                The HTTP status code.
            </li>
            <li>
                The time of day the request was made.
            </li>
            <li>
                The time taken to begin receiving a response (in milliseconds).
            </li>
            <li>
                The time taken for the response to complete (in milliseconds).
            </li>
            <li>
                Whether or not a network error occurred in issuing the request.
            </li>
            <li>
                Whether or not a timeout occurred when waiting for or processing the response.
            </li>
            <li>
                The length of the response in bytes.
            </li>
            <li>
                Any cookies received in the response.
            </li>
            <li>
                The results of any <a href="options.html#grep-match"> match grep</a> items that are configured.
            </li>
            <li>
                The data extracted from any <a href="options.html#grep-extract">extract grep</a> items that are
                configured.
            </li>
            <li>
                Whether or not the payload was echoed in the response, if <a href="options.html#grep-payloads">payload
                grep</a> was configured.
            </li>
            <li>
                The number of redirections that were followed, if <a href="options.html#handling-redirections-during-attacks">configured</a>.
            </li>
            <li>
                Any user-applied <a href="#annotations">comment</a>.
            </li>
        </ul>
        <p>
            You can reorder the table's contents by clicking on any column header (clicking a header cycles through
            ascending sort, descending sort, and unsorted). For example, if you prefer the results table to grow
            "upwards", with the most recent items at the top of the table, then you can apply a descending sort to the
            request number column.
        </p>
        <p>
            <span class="pro-edition-feature-label">Professional</span>
            You can copy the contents of a column by Ctrl-clicking the header.
        </p>
        <p>
            If you select an item in the table, the request and response for that item are shown in the request/response
            pane, provided you configured the attack to <a href="options.html#attack-results-options"> store requests and
            responses</a>. If the attack is configured to <a href="options.html#handling-redirections-during-attacks">follow
            redirections</a>, all intermediate responses and requests are also displayed, alongside the initial request
            and final response. The request/response pane contains an <a href="../../functions/message-editor/index.html">HTTP
            message editor</a> for each message, providing detailed analysis. You can also double-click an item in the
            table to show the request and response in a pop-up window.
        </p>
        <h4>Analyzing Results</h4>
        <p>
            A key part of effectively interpreting the results of an attack is locating interesting or successful server
            responses, and identifying the requests that generated these. Interesting responses can usually be
            differentiated through at least one of the following:
        </p>
        <ul>
            <li>
                A different HTTP status code.
            </li>
            <li>
                A different length of response.
            </li>
            <li>
                The presence or absence of certain expressions.
            </li>
            <li>
                The occurrence of an error or timeout.
            </li>
            <li>
                The time taken to receive or complete the response.
            </li>
        </ul>
        <p>
            For example, in a content discovery exercise, requests for existing resources might return a &quot;200 OK&quot;
            response of varying lengths, while requests for nonexistent resources might return a &quot;404 Not found&quot;
            response, or a &quot;200 OK&quot; response containing a fixed-length custom error page. Or in a password
            guessing attack, failed login attempts might generate a &quot;200 OK&quot; response containing the keywords
            &quot;login failed&quot;, while a successful login might generate a &quot;302 Object moved&quot; response,
            or a &quot;200 OK&quot; response of a different length containing the word &quot;welcome&quot;. The types of
            response features that are relevant will generally depend on the <a href="using.html#typical-uses">type of
            attack</a> being performed.
        </p>
        <p>
            You can use the following techniques to help analyze the attack results and identify interesting items:
        </p>
        <ul>
            <li>
                Click on each column header in turn, and review the sorted table to identify any anomalous items.
            </li>
            <li>
                <a href="#columns-menu">Unhide additional columns</a> to analyze response times and cookies.
            </li>
            <li>
                Use the <a href="#intruder-attacks-display-filter">display filter</a> to remove items containing or not containing
                certain expressions.
            </li>
            <li>
                Create new <a href="options.html#grep-match">match grep</a> items to identify responses
                containing expressions found in some responses, and sort on the newly added columns.
            </li>
            <li>
                If an error message or other interesting data appears in some responses, create new <a href="options.html#grep-extract"> extract grep</a> items to extract this data, and sort on
                the newly added columns.
            </li>
        </ul>
        <h3 id="intruder-attacks-display-filter">Intruder attacks display filter</h3>
        <p>
            The results tab has a display filter that can be used to hide some of its content from view, to make it
            easier to analyze and work on the content you are interested in.
        </p>
        <p>
            The filter bar above the results table describes the current display filter. Clicking the filter bar opens
            the filter options for editing. The filter can be configured based on the following attributes:
        </p>
        <ul>
            <li>
                <span class="pro-edition-feature-label">Professional</span>
                <strong>Search term</strong> - You can filter on whether or not responses contain a specified search
                term. You can configure whether the search term is a literal string or a regular expression, and whether
                it is case sensitive. If you select the "Negative search" option, then only items not matching the
                search term will be shown.
            </li>
            <li>
                <strong>Status code</strong> - You can configure whether to show or hide responses with various HTTP
                status codes.
            </li>
            <li>
                <strong>Annotation</strong> - You can configure whether to show only items with user-supplied <a href="#annotations"> comments or highlights</a>.
            </li>
        </ul>
        <p>
            The content displayed within the results table is effectively a view into an underlying database, and the
            display filter controls what is included in that view. If you set a filter to hide some items, these are not
            deleted, only hidden, and will reappear if you unset the relevant filter. This means you can use the filter
            to help you systematically examine a large set of results (e.g. from <a href="using.html#fuzzing-for-vulnerabilities">fuzzing</a> a request containing many parameters) to understand
            where different kinds of interesting responses appear.
        </p>
        <h3 id="annotations"> Annotations </h3>
        <p>
            You can annotate attack results items by adding comments and highlights. This can be useful to flag up
            interesting responses for further investigation.
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
            When you have annotated interesting requests, you can use column sorting and the <a href="#intruder-attacks-display-filter">display
            filter</a> to quickly find these items later.
        </p>
        <h3 id="burp-intruder-testing-workflow">Burp Intruder testing workflow </h3>
        <p>
            As well as displaying details of all requests and responses, the attack results let you to control and
            initiate specific attacks and carry out other actions, using the context menu. The following options are
            available:
        </p>
        <ul>
            <li>
                <strong>Scan / Spider / Send to ...</strong> - You can send any item to other Burp tools, to perform
                further attacks or analysis. The ability to send requests between tools forms the core of Burp's <a href="../../penetration-testing/index.html"> user-driven workflow</a>.&nbsp;
            </li>
            <li>
                <strong>Show response in browser</strong> - You can use this to render the selected response in your
                browser, to avoid the limitations of Burp's built-in <a href="../../functions/message-editor/index.html#render">HTML renderer</a>. When you select this option,
                Burp gives you a unique URL that you can paste into your browser (configured to use the current instance
                of Burp as its proxy), to render the response. The resulting browser request is served by Burp with the
                exact response that you selected (the request is not forwarded to the original web server), and yet the
                response is processed by the browser in the context of the originally requested URL. Hence, relative
                links within the response will be handled properly by your browser. As a result, your browser may make
                additional requests (for images, CSS, etc.) in the course of rendering the response - these will be
                handled by Burp in the usual way.
            </li>
            <li>
                <strong>Request in browser</strong> - You can use this to re-issue the selected request in your browser
                (configured to use the current instance of Burp as its proxy), either <strong>in the original session</strong> (causing Burp to issue the request using the exact Cookie header that appeared in the original request), or <strong>in the current browser session</strong> (causing Burp to issue the request using the cookies supplied by your browser).
            </li>
            <li>
                <span class="pro-edition-feature-label">Professional</span>
                <strong>Generate CSRF PoC</strong> - You can use the <a href="../../functions/generate-csrf-poc.html">Generate
                CSRF PoC</a> function to create some HTML which, when viewed in a browser, will cause the selected
                request to be issued.
            </li>
            <li>
                <strong>Add to site map</strong> - This adds the selected item(s) to Burp's Target <a href="../target/site-map/index.html">site map</a>. This option is useful when you are using Intruder to perform <a href="using.html#enumerating-identifiers"> customized content discovery</a>, and have identified
                some new resources on the server which had not been added to the site map through other methods.
            </li>
            <li>
                <strong>Request item again</strong> - This queues the selected item(s) to be requested again by the
                attack engine. When the item is re-requested, the table entry for the item, and associated HTTP
                messages, will be updated based on the new request. This option is useful when some attack requests have
                failed due to network errors, or received an anomalous server response due to some intermittent problem.
                You can also use it if you have <a href="#attack-configuration-tabs">modified</a> the base request or other relevant
                configuration during the attack, and want to re-request items that were based on the original
                configuration.
            </li>
            <li>
                <strong>Define extract grep from response</strong> - This opens the <a href="../../functions/response-extraction.html"> response extraction rule dialog</a> showing the
                selected item's response, and lets you create a new <a href="options.html#grep-extract">extract
                grep</a> item derived from that response. This option is useful when some attack requests have generated
                a different type of response than the base request (for example, a particular format of error message
                when <a href="using.html#fuzzing-for-vulnerabilities">fuzzing</a>, or a different login message when <a href="using.html#enumerating-identifiers">guessing credentials</a>). When you encounter a different
                response like this, it is often helpful to create a new extract grep item to extract an interesting part
                of the response, so that you can quickly review the contents of other similar responses.
            </li>
            <li>
                <strong>Add comment</strong> - You can use this function to add a comment to the selected item(s). See <a href="#annotations"> Annotations</a> for more details.
            </li>
            <li>
                <strong>Highlight</strong> - You can use this function to apply a highlight to the selected item(s). See <a href="#annotations"> Annotations</a> for more details.
            </li>
            <li>
                <strong>Delete item(s)</strong> - This function removes the selected item(s) permanently.
            </li>
            <li>
                <strong>Copy links</strong> - This function parses the selected item(s) for links, and copies these to
                the clipboard.
            </li>
            <li>
                <strong>Save item(s)</strong> - This function lets you specify a file to save the details of selected
                item(s) in XML format, including full requests and responses, and all relevant metadata such as response
                length, HTTP status code and MIME type.
            </li>
        </ul>
        <h2 id="attack-configuration-tabs">Attack Configuration Tabs</h2>
        <p>
            As well as the <a href="#attack-results">Results tab</a>, the attack window contains a clone of each of the
            configuration tabs from the main UI on which the current attack was based. This enables you to review and
            modify the attack configuration while the attack is underway.
        </p>
        <div class="rounded-corner-box">
            <p>
                For further details, see the help on each of the configuration tabs:
            </p>
            <ul class="link-list">
                <li>
                    <a href="target.html">Target</a>
                </li>
                <li>
                    <a href="positions.html">Positions</a>
                </li>
                <li>
                    <a href="payloads/index.html">Payloads</a>
                </li>
                <li>
                    <a href="options.html">Options</a>
                </li>
            </ul>
        </div>
        <p>
            When modifying the configuration of a running attack, the following points should be noted:
        </p>
        <ul>
            <li>
                Some parts of the attack configuration are fundamental to the structure of the attack (such as the <a href="positions.html#attack-type">attack type</a> and <a href="payloads/types.html">payload
                type</a>), and cannot be changed after the attack has started.
            </li>
            <li>
                Changing some parts of the configuration while the attack is running may have unanticipated effects. For
                example, if you are using <a href="payloads/types.html#numbers">number payloads</a> and edit
                the To field, then the changes will take effect as each key is pressed; if you initially delete a digit
                from the To field, then the attack might abruptly complete because the To field now contains a smaller
                number. It is strongly recommended that you pause running attacks before modifying their configuration.
            </li>
        </ul>
        <h2 id="results-menus">Results Menus</h2>
        <p>
            The results view contains several menus with commands for controlling the attack, and carrying out other
            actions. These are described below.
        </p>
        <h3 id="attack-menu">Attack Menu</h3>
        <p>
            This contains commands to pause, resume, or repeat the attack.
        </p>
        <h3 id="save-menu">Save Menu</h3>
        <ul>
            <li>
                <strong>Attack</strong> - This is used to save a copy of the current attack, including results. The
                saved file can be reloaded using the "Open saved attack" option from the Intruder menu in the main Burp
                UI.
            </li>
            <li>
                <strong>Results table</strong> - This is used to save the <a href="#results-table">results table</a> as
                a text file. You can choose to save all rows, or only selected rows. You can also select which columns
                to include, and the column delimiter. This function is useful for exporting the results into a
                spreadsheet for further analysis, or for saving a single column (such as data mined using the <a href="options.html#grep-extract">extract grep</a> function) to be used as an input file for
                subsequent attacks or other tools.
            </li>
            <li>
                <strong>Server responses</strong> - This is used to save the full responses received for all requests.
                These can either be saved in individual files (sequentially numbered), or concatenated in sequence into
                a single file.
            </li>
            <li>
                <strong>Attack configuration</strong> - This is used to save the configuration of the currently
                executing attack (not the results). You can reload the attack configuration using the "Load attack
                config" option from the Intruder menu in the main Burp UI.
            </li>
        </ul>
        <h3 id="columns-menu">Columns Menu</h3>
        <p>
            This lets you select which available columns are visible in the attack <a href="#results-table">results
            table</a>.
        </p>
    </div>
</section>
</body>
</html>