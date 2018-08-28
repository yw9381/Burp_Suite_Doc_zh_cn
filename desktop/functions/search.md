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
            <a href="search.html">Search</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Search</h1>
        <div class="rounded-corner-box">
            <p>
                Burp provides various functions that let you search for different items:
            </p>
            <ul class="link-list">
                <li>
                    <a href="#text-search">Simple text search</a>
                </li>
                <li>
                    <a href="#find-comments-and-scripts">Find comments</a>
                </li>
                <li>
                    <a href="#find-comments-and-scripts">Find scripts</a>
                </li>
                <li>
                    <a href="#find-references">Find references (links) to a particular URL</a>
                </li>
            </ul>
        </div>
        <h2 id="text-search">Text search</h2>
        <p>
            You can perform suite-wide searches by selecting "Search" from the Burp menu. You can also search within
            selected branches in the Target <a href="../tools/target/site-map/index.html">site map</a>, by selecting "Search" within
            "Engagement tools" in the context menu.
        </p>
        <p>
            The search dialog lets you configure the following options:
        </p>
        <ul>
            <li>
                The expression to search for
            </li>
            <li>
                Whether the search is case sensitive
            </li>
            <li>
                Whether the search term is a literal string or a regular expression
            </li>
            <li>
                Whether the search should show "negative" matches (i.e. items that do not contain the search expression)
            </li>
            <li>
                Whether the search is restricted to <a href="../tools/target/scope.html">in-scope</a> items only
            </li>
            <li>
                Whether the search results should dynamically update as new HTTP messages are processed by Burp tools
            </li>
            <li>
                Which locations to search within HTTP messages (requests vs. responses, headers vs. body)
            </li>
            <li>
                Which tools to search in
            </li>
        </ul>
        <p>
            When you click &quot;Go", the search begins and the details of each search match are shown in a sortable
            table. The preview pane shows the full request and response for the selected item, including highlighted
            matches for your search expression. The context menu can be used to send requests to Burp tools and carry
            out other actions.
        </p>
        <h2 id="find-comments-and-scripts">Find Comments and Scripts</h2>
        <p>
            You can use these functions to search part or all of the Target <a href="../tools/target/site-map/index.html">site map</a> for comments and scripts. You can start the search by selecting part or all of the site map tree, and
            choosing "Find comments" or "Find scripts" within "Engagement tools" in the site map context menu.
        </p>
        <p>
            In the search dialog, use the "Search" button to perform the search (or re-perform it later). Details of the
            discovered items are shown in a sortable table. The preview pane shows the full request and response for the
            selected item, with relevant items automatically highlighted, and also extracted into their own tab. The
            context menu can be used to send requests to Burp tools and carry out other actions.
        </p>
        <p>
            Selecting the "Dynamic update" option will cause Burp to dynamically update the results as new HTTP messages
            are processed by Burp tools. You can use the &quot;Export&quot; button to save all of the scripts or
            comments to file or to the clipboard, optionally consolidating duplicated items.
        </p>
        <h2 id="find-references">Find References</h2>
        <p>
            You can use this function to search all of Burp's tools for HTTP responses that link to a particular item.
            To access the function, select an HTTP request anywhere within Burp, or any part of the Target <a href="../tools/target/site-map/index.html">site map</a>, and choose "Find references" within "Engagement tools" in the
            context menu.
        </p>
        <p>
            The search results window shows responses (from all Burp tools) that link to the selected item. When you
            view an individual search result, the response is automatically highlighted to show where the linking
            reference occurs.
        </p>
        <p>
            Note that this feature treats the original URL as a prefix when searching for links, so if you select
            a host, you will find all references to that host; if you select a folder, you will find all references to
            items within that folder or deeper.
        </p>
    </div>
</section>
</body>
</html>