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
            <a href="index.html">Scanning Web Sites</a>
        </li>
        <li>
            <a href="crawl-options.html">Crawl Options</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Crawl Options</h1>
        <p>
            Numerous options are available to configure the behavior of Burp Scanner during crawl-based scans. These can be configured on-the-fly when <a href="../scanning/scan-launcher.html">launching a scan</a>, or can be maintained in Burp's <a href="../getting-started/configuration.html#configuration-library">configuration library</a>.
        </p>
        <h2 id="crawl-optimization">Crawl optimization</h2>
        <p>
            These settings control the behavior of the crawl logic to reflect the objectives of the crawl and the nature of the application.
        </p>
        <h3 id="maximum-link-depth">Maximum link depth</h3>
        <p>
            The maximum link depth represents the maximum number of navigational transitions (clicking links and submitting forms) that the crawler will make from the start URL(s). Modern applications tend to build a mass of navigation into every response, in locations like menus and the page footer. For this reason, it is normally possible to reach the vast majority of an application's content and functionality within a small number of hops from the start URL. Fully covering multi-stage processes (like viewing an item, adding it to a shopping cart, and checking out) will require more hops.
        </p>
        <p>
            Some applications contain extremely long navigational sequences that don't lead to interestingly different functionality. For example, a shopping application might have a huge number of product categories, sub-categories, and view filters. To a crawler, this can appear as a very deep nested tree of links, all returning different content. In this situation, there are clearly diminishing returns to crawling deeply into the navigational structure, &nbsp;so it is sensible to limit the maximum link depth to a small number, such as 8.
        </p>
        <h3 id="crawl-strategy">Crawl strategy</h3>
        <p>
            Real-world applications differ hugely in the way they organize content and navigation, the volatility of their responses, and the extent and complexity of application state. At one extreme, an application might employ a unique and stable URL for each distinct function, return deterministic content in each response, and contain no server-side state. At the other extreme, an application might employ ephemeral URLs that change each time a function is accessed, overloaded URLs that reach different functions through different navigational paths, volatile content that changes non-deterministically, and heavily stateful functions where user actions cause changes in the content and behavior that is subsequently observed.
        </p>
        <p>
            Burp's crawler can handle both of these extremes. Where required, it can handle <a href="../../scanner/crawling.html#core-approach">ephemeral and overloaded URLs</a>, <a href="../../scanner/crawling.html#crawling-volatile-content">volatile content</a>, and <a href="../../scanner/crawling.html#detecting-changes-in-application-state">changes in application state</a>. However, fully handling these cases imposes a material overhead in the quantity of work that is involved in the crawl. You can use the crawl strategy setting to tune the approach that is taken to specific applications. In practice, this setting represents a trade-off between the speed of the crawl and the completeness of coverage that is achieved. The default strategy&nbsp;represents a trade-off between speed and coverage that is appropriate for typical applications. You can select a strategy that is more optimized for speed, when crawling an application with more stable and unique URLs, and no stateful functionality. Or you can select a strategy that is more optimized for completeness, when crawling an application with more volatile or overloaded URLs, or more complex stateful functionality.
        </p>
        <h2 id="crawl-limits">Crawl limits</h2>
        <p>
            Crawling modern applications is sometimes an open-ended exercise, due to the amount of stateful functionality, volatile content, and unbounded navigation. Burp's crawler uses various techniques to maximise discovery of unique content early in the crawl. The settings for crawl limits let you impose a limit on the extent of the crawl, as it reaches the point of diminishing returns. It is generally sensible to configure a limit to the extent of the crawl, based on your knowledge of the application being scanned.
        </p>
        <p>
            You can choose to limit the crawl based on:
        </p>
        <ul>
            <li>
                The time taken.
            </li>
            <li>
                The number of unique locations discovered. A location represents a distinct unit of content or functionality, based on the chosen <a href="#crawl-strategy">crawl strategy</a>.
            </li>
            <li>
                The number of HTTP requests that are made.
            </li>
        </ul>
        <h2 id="login-functions">Login functions</h2>
        <p>
            These settings control how the crawler will interact with any login functionality that is encountered during the crawl.
        </p>
        <p>
            There are separate settings for <a href="../scanning/scan-launcher.html#application-login-options">application login</a> which let you specify some existing account credentials that should be submitted to login functions, to access authenticated content behind the login. Here, you can configure:
        </p>
        <ul>
            <li>
                Whether the crawler should attempt to self-register a user. This can be useful in many applications, by removing the need to manually set up a user account before the crawl.
            </li>
            <li>
                Whether the crawler should trigger login failures using invalid usernames. This can be useful to reach account recovery features that are accessed when invalid credentials are submitted. Note that Burp's crawler will not deliberately submit any of the configured <a href="../scanning/scan-launcher.html#application-login-options">application login </a>accounts using invalid passwords, so as not to trigger account lockout on those accounts.
            </li>
        </ul>
<h2 id="handling-application-errors-during-crawl">Handling application errors during crawl</h2>
<p>
    These settings control how Burp Scanner <a href="../../scanner/auditing.html#handling-application-errors">handles application errors</a> (connection failures and transmission timeouts) that arise during the crawl phase of the scan.
</p>
<p>
            You can configure the following options:
        </p>
        <ul>
            
            <li>
                The number of consecutive timed out requests, or the overall percentage of timed out requests, before pausing the task.
            </li>
            <li>
                The number of follow-up passes that are performed on completion of the crawl, to retry requests that timed out.
            </li>
        </ul>
        <p>
            You can leave any setting blank to disable it. &nbsp;
        </p>
    </div>
</section>
</body>
</html>