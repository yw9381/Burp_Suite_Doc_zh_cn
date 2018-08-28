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
            <a href="index.html">Target</a>
        </li>
        <li>
            <a href="scope.html">Scope</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Target Scope</h1>
        <p>
            The target scope configuration lets you tell Burp, at a suite-wide level, exactly what hosts and URLs
            constitute the target for your current work. You can think of the target scope as, roughly, the items that
            you are currently interested in and willing to attack.
        </p>
        <p>
            This configuration affects the behavior of tools throughout the suite. For example:
        </p>
        <ul>
            <li>
                You can set display filters on the <a href="site-map/index.html#site-map-display-filter">target site map</a> and <a href="../proxy/history.html#proxy-history-display-filter">Proxy history</a> to show only in-scope items.
            </li>
            <li>
                You can tell the Proxy to <a href="../proxy/options/index.html#intercepting-http-requests-and-responses">intercept</a> only in-scope requests
                and responses.
            </li>
            <li>
                <span class="pro-edition-feature-label">Professional</span>
                With Burp Scanner, you can perform <a href="../../scanning/live-scans.html">automatic live scanning</a> of in-scope items.
            </li>
            <li>
                You can configure <a href="../intruder/options.html#handling-redirections-during-attacks">Intruder</a> and <a href="../repeater/options.html">Repeater</a> to follow redirections to any in-scope URLs.
            </li>
        </ul>
        <p>
            By telling Burp what your current target is, you can ensure that Burp carries out numerous such actions in
            an appropriate way, only targeting items that you are interested in and willing to attack. In all cases, you
            can additionally fine tune the target scope and the associated behavior at the level of individual tools,
            giving you fine-grained control over everything that Burp does, if you need it. However, the suite-wide
            scope definition provides a quick and easy way to tell Burp what is fair game and what is off limits, and is
            almost always worth configuring before you begin your work in earnest.
        </p>
        <p>
            The scope definition uses two lists of URL-matching rules - an "include" list and an "exclude" list. When
            Burp evaluates a URL to decide if it is within the target scope, it will be deemed to be in scope if the URL
            matches at least one "include" rule and does not match any "exclude" rules. This enables you to define
            specific hosts and directories as being generally within scope, and yet exclude from that scope specific
            subdirectories or files (such as logout or administrative functions).
        </p>
        <p>
            You can add or edit rules on the "include" and "exclude" lists using the <a href="../../functions/url-matching.html">URL-matching rule editor</a>. However, in most cases, by far the
            easiest way to define your target scope is via the <a href="site-map/index.html">site map</a>. As you map
            out the target application via Burp Proxy, the application's content will appear in the site map. You can
            then select one or more hosts and folders, and use the <a href="site-map/index.html#site-map-testing-workflow">context
            menu</a> to include or exclude these from the scope. This process is extremely easy and in most situations
            will let you quickly define all of the rules necessary for your testing.
        </p>
    </div>
</section>
</body>
</html>