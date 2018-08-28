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
            <a href="scan-launcher.html">Scan Launcher</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Scan Launcher</h1>
<p>
            You can launch scans via the "New scan" button on the Burp Dashboard or the "Scan" option on the context menu that appears throughout Burp. Using one of these methods will display the scan launcher, which lets you configure various details of the scan.
        </p>
        <h2 id="scan-details">Scan details</h2>
        <p>
            The "Scan details" section of the scan launcher lets you select the scan type, and the details of what will be scanned.
        </p>
        <h4>Scan type</h4>
        <p>
            The following scan types can be selected:
        </p>
        <ul>
            <li>
                Crawl and audit.&nbsp;This will perform a crawl from one or more starting URLs, and then audit the discovered content for vulnerabilities.
            </li>
            <li>
                Crawl. This will perform a crawl from one or more starting URLs.
            </li>
            <li>
                Audit selected items. This option is only available when the launcher was initiated by selecting one or more requests/responses within Burp, and choosing the "Scan" option on the context menu.
            </li>
        </ul>
        <p>
            Depending on the scan type that is selected, the scan launcher will show options for the scope of the scan or the individual items to be scanned.
        </p>
        <h4>URLs to Scan</h4>
        <p>
            This section is displayed for "Crawl and audit" and "Crawl" scan types. You can configure one or more URLs from which Burp will perform the crawl. These URLs will be the starting point of the crawl, and Burp will follow links from there into the application.
        </p>
        <p>
            By default, the scope of the crawl will be restricted to the configured URLs truncated to the final folder (if any). For example, if you specify a start URL of
            <span class="InlineCode">https://example.org/myapp/welcome.php</span>
            then the crawler will begin at this URL, and will crawl content within the path
    <span class="InlineCode">https://example.org/myapp/</span>
            .
        </p>
        <p>
            You can override the default behavior and provide a different scope configuration by opening the "Detailed scope configuration" toggle. This lets you define the scope of the crawl using either URL prefixes or advanced matching rules, as for Burp's <a href="../tools/target/scope.html">Target scope</a>. Note that you still need to specify the URLs to scan, since these are the starting points for the crawl, and the URLs to scan must fall within the defined scope.
        </p>
        <h4>Items to Scan </h4>
        <p>
            This section is displayed for the "Audit selected items" scan type. The URLs of the selected items are listed. Note that the same URL will appear more than once if there are multiple requests to the same URL with different parameters.
        </p>
        <p>
            If you have made a large selection of items to scan, it is often useful to consolidate the selected items to improve the efficiency of the scan. Clicking "Consolidate items" displays a wizard that lets you choose whether to remove items with various features:
        </p>
        <ul>
            <li>
                Duplicate items in the selection (those with matching URL and parameter names)
            </li>
            <li>
                Out-of-scope items (based on the current suite scope)
            </li>
            <li>
                Items with no parameters
            </li>
            
            <li>
                Items with specific file extensions
            </li>
        </ul>
        <p>
            For each item, Burp shows the number of affected items. If
            any option would result in none or all of the items being removed, then this option will be
            unavailable.
        </p>
        <p>
            The consolidation wizard then displays the full list of items that will be scanned. You can double-click any item in the
            list to view full request and response. You can manually remove any further items that you do not
            wish to scan.
        </p>
        <h2 id="scan-configuration">Scan configuration</h2>
        <p>
            The "Scan configuration" section of the scan launcher lets you select configurations to control how the scan is carried out.
        </p>
        <p>
            You can select multiple configurations, and these will be applied in turn to determine the final configuration that is used for the scan. This allows you to apply a general configuration first (for example, your prefered general scan settings), followed by a more specific configuration (for example, some specific options that are useful for this particular application). If no configurations are selected, then Burp Scanner's default settings will be used.
        </p>
        <p>
            You can create new configurations on the fly, or select existing configurations from your <a href="../getting-started/configuration.html#configuration-library">library</a>, or import from a configuration file.
        </p>
        <h2 id="application-login-options">Application login options</h2>
        <p>
            The "Application login" section of the scan launcher lets you specify account credentials that should be submitted to any login functions. The crawler will use these to discover authenticated content behind login functions. The crawler will also attempt to self-register accounts, and use these credentials in addition to those provided.
        </p>
        <p>
            This section is not available when "Audit selected items" is selected as the scan type, because no crawling is performed.
        </p>
        <h2 id="resource-pool-options">Resource pool options</h2>
        <p>
            The "Resource pool" section of the scan launcher lets you specify the resouce pool in which the scan will be run. Resource pools are used to manage the usage of system resources across multiple tasks. Each resource pool can be configured with different settings for the maximum number of concurrent requests, and throttling between requests.
        </p>
    </div>
</section>
</body>
</html>