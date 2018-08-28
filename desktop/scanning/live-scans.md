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
            <a href="live-scans.html">Live Scans</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Live Scans</h1>
        <p>
            Live scans can be used to perform some scanning operations automatically on requests and responses that are processed by Burp's tools.
        </p>
        <p>
            You can use live scans to audit for vulnerabilities, or add observed resources to Burp's Target <a href="../tools/target/site-map/index.html">site map</a>.
        </p>
        <p>
            You can create live scans via the "New live task" button on the Burp <a href="../dashboard/index.html">Dashboard</a>. Some default live tasks are created automatically in new projects.
        </p>
        <h2 id="live-scan-configuration">Live scan configuration</h2>
        <p>
            All types of live scanning task must be configured with the following options:
        </p>
        <ul>
            <li>
                <strong>Tools scope</strong> - You can select the tools whose traffic will be inspected to select items that are processed by the live scan.
            </li>
            <li>
                <strong>URL scope</strong> - You can define which items are processed by the live scan, based on their URL. You can choose to include everything, only items that fall within the defined <a href="../tools/target/scope.html">suite scope</a>, or items within a custom scope.
            </li>
            <li>
                <strong>Deduplication</strong> - You can select whether items to be processed are deduplicated based on their URL and parameter names. This is particularly useful for <a href="#live-audit">live audit</a> tasks, where it might not be desirable to repeatedly scan the same item more than once.
            </li>
        </ul>
        <h2 id="live-audit">Live audit</h2>
        <p>
            This type of live task performs an <a href="../../scanner/auditing.html">audit</a> of the items that are selected by the <a href="#live-scan-configuration">live scan configuration</a>. You can select the <a href="../scanning/audit-options.html">audit configuration</a> to be used.
        </p>
        <p>
            Common uses for live audit tasks are to perform passive auditing of all traffic via the Proxy, or active auditing of only in-scope items.
        </p>
        <h2 id="live-passive-crawl">Live passive crawl </h2>
        <p>
            This type of live task analyses HTTP messages and adds entries to the Target <a href="../tools/target/site-map/index.html">site map</a>.
        </p>
        <p>
            In the task configuration, you can select which types of observed items to add: links and form submissions.
        </p>
        <p>
            You can also select which items are added based on URL. You can choose to include everything, the item itself, items on the same domain as the requested URL, and items within the defined <a href="../tools/target/scope.html">suite scope</a>, or items within a custom scope.
        </p>
</div>
</section>
</body>
</html>