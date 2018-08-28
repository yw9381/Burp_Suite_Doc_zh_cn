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
            <a href="using.html">Using</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Using the Target Tool</h1>
        <p>
            The Target tool gives you an overview of your target application's content and functionality, and lets you
            drive key parts of your testing workflow. The key steps that are typically involved in using the Target tab
            are described below.
        </p>
        <h2 id="manual-application-mapping">Manual Application Mapping</h2>
<p>
            First, map the target application manually. To do this, carry out the following steps:
        </p>
        <ul>
            <li>
                <a href="../proxy/using.html#getting-set-up"> Set up your browser and Burp Proxy</a> to work together.
            </li>
            <li>
                Turn off <a href="../proxy/using.html#intercepting-requests-and-responses">Proxy interception</a>, and browse the entire
                application manually.
            </li>
            <li>
                Follow every link, submit every form, step through every multi-stage process, and log in to all
                protected areas.
            </li>
        </ul>
        <p>
            This manual mapping process will populate the Target <a href="site-map/index.html">site map</a> with all of
            the content requested via the Proxy, and also (via <a href="../../scanning/live-scans.html#live-passive-crawl">live passive
            crawling</a>) any further content that can be inferred from application responses (via links, forms, etc.).
            This manual mapping process will build up a fairly complete record in the site map of all the visible
            application content, and also fully familiarize you with the application.
        </p>
        <p>
            <strong>Note:</strong> For some use cases, Burp's <a href="../../../scanner/crawling.html">automated crawler</a> is superior to manual application mapping, because it captures the navigational paths through the application in a way that lets Burp Scanner automatically maintain session when <a href="../../../scanner/auditing.html">auditing</a> the application. Manual mapping, on the other hand, allows a human user to guide the process, avoiding potentially dangerous functionality, and verifying that navigational actions have the expected results. The choice of manual versus automated mapping very much depends on the nature of the application and your intended use of the results.
        </p>
<h2 id="defining-target-scope">Defining Target Scope</h2>
        <p>
            When the initial application mapping is completed, this is a good time to define your <a href="scope.html">Target scope</a>, by selecting branches within the site map and using the "Add
            to scope" / "Remove from scope" commands on the context menu. You can then configure suitable display
            filters on the <a href="site-map/index.html#site-map-display-filter">site map</a> and <a href="../proxy/history.html#proxy-history-display-filter">Proxy
            history</a>, to hide from view items that you are not currently interested in.
        </p>
        <h2 id="reviewing-unrequested-items">Reviewing Unrequested Items</h2>
        <p>
            Review the site map for any items in your target that have been detected via passive spidering but have not
            yet been requested. These items are shown in gray in the site map. You can also quickly locate unrequested
            items by selecting the whole application in the tree view, and sorting the table view on the "Time
            requested" column (by clicking the column header) - unrequested items will then be grouped together. You
            should manually review these items (for example, by copying each URL into your browser) to confirm whether
            they contain any further interesting content.
        </p>
<h2 id="discovering-hidden-content">Discovering Hidden Content</h2>
        <p>
            Having mapped all of the application's visible content (i.e. that which can be observed by browsing the
            application and following all links), you can optionally carry out some automated actions to identify
            further "hidden" content that is not linked from visible content:
        </p>
        <ul>
            <li>
                You can select folders in the site map and use Burp's <a href="../../functions/content-discovery.html">Content
                discovery</a> function to try to guess further items.
            </li>
            <li>
                You can send items in the site map to Burp Intruder to carry out <a href="../intruder/using.html#enumerating-identifiers">customized content discovery</a>.
            </li>
        </ul>
        <h2 id="analyzing-the-attack-surface">Analyzing The Attack Surface</h2>
        <p>
            When you are satisfied that you have mapped all of the application's content and functionality, you should
            review the contents of the <a href="site-map/index.html">site map</a> (together with the <a href="../proxy/history.html">Proxy history</a>) to understand the attack surface that the application
            exposes. You can use the following site map features to support this task:
        </p>
        <ul>
            <li>
                You can select branches of the site map tree and use the <a href="../../functions/target-analyzer.html">Target
                analyzer</a> function to identify all of the dynamic URLs and parameters.
            </li>
            <li>
                You can use the <a href="site-map/index.html#site-map-display-filter"> display filter</a>, and sortable <a href="site-map/index.html#target-information"> table view</a>, to systematically work through a complex site map
                and understand where different kinds of interesting content reside.
            </li>
            <li>
                You can <a href="site-map/index.html#site-map-annotations">annotate</a> items with highlights and comments, to
                describe their purpose or identify interesting items to come back to later.
            </li>
        </ul>
        <h2 id="target-tool-testing-workflow">Target tool testing workflow</h2>
        <p>
            Having fully mapped the application and assessed its attack surface, you can drive your detailed <a href="../../penetration-testing/index.html">vulnerability testing workflow</a> from the site map:
        </p>
        <ul>
            <li>
                You can select branches and items and use the context menu to send these to other Burp tools to carry
                out particular tasks, such as <a href="../../scanning/index.html#launching-scans"> automated vulnerability
                scanning</a> using Burp Scanner, <a href="../intruder/using.html#fuzzing-for-vulnerabilities">fuzzing using Burp
                Intruder</a>, or manually testing using <a href="../repeater/using.html">Burp Repeater</a>.
            </li>
            <li>
                You can request the site map again in a different <a href="../../options/sessions/index.html#session-handling-rules">session
                context</a>, and <a href="site-map/comparing.html">compare the site maps</a> to help identify
                access control vulnerabilities.
            </li>
            <li>
                You can search branches of the site map for <a href="../../functions/search.html#text-search">specific
                expressions</a>, <a href="../../functions/search.html#find-comments-and-scripts">scripts and comments</a>.
            </li>
        </ul>
    </div>
</section>
</body>
</html>