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
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Scanning Web Sites</h1>
        <p>
            Burp Scanner automates the task of scanning web sites for content and vulnerabilities. Depending on configuration, the Scanner can <a href="../../scanner/crawling.html">crawl the application</a> to discover its content and functionality, and <a href="../../scanner/auditing.html">audit the application</a> to discover vulnerabilities.
        </p>
        <ul class="link-list">
		    <li>
		        <a href="../../scanner/index.html">Read more about how Burp Scanner works</a>
	        </li>
	    </ul>
		<h2 id="launching-scans">Launching Scans</h2>
		<p>
		    Scans can be launched in a variety of ways:
	    </p>
		<ul>
		    <li>
		        <strong> Scan from specific URLs</strong>. This performs a scan by crawling the content within one or more provided URLs, and optionally auditing the crawled content. To do this, go to the <a href="../dashboard/index.html">Burp Dashboard</a>, and click the "New scan" button. This will open the <a href="scan-launcher.html">scan launcher</a> which lets you configure details of the scan.
	        </li>
		    <li>
		        <strong>Scan selected items</strong>. This lets you perform an audit-only scan (no crawling) of specific HTTP requests. To do this, select one or more requests anywhere within Burp, and select "Scan" from the context menu. This will open the <a href="scan-launcher.html">scan launcher</a> which lets you configure details of the scan.
	        </li>
		    <li>
		        <strong>Live scanning</strong>. You can use <a href="live-scans.html">live scans</a> to automatically scan requests that are processed by other Burp tools, such as the <a href="../tools/proxy/index.html">Proxy</a> or <a href="../tools/repeater/index.html">Repeater</a> tools. &nbsp;You can configure precisely which requests are processed, and whether they should be scanned to identify content or audit for vulnerabilities. To do this, go to the <a href="../dashboard/index.html">Burp Dashboard</a>, and click the "New live task" button. This will open the <a href="live-scans.html">live scan</a> launcher which lets you configure details of the task.
	        </li>
		</ul>
        <h3 id="configuring-scans">Configuring scans</h3>
<p>
    You can launch multiple scans in parallel, and each scan has its own configuration options that determine exactly how the scan is carried out. There are two key areas of configuration:
</p>
<ul>
    <li>
        <strong> Crawl options</strong>. These options control behavior like maximum link depth, how the crawler optimizes for speed versus coverage, and limits on the extent of the crawl. <a href="crawl-options.html" class="chevron-after">Read more</a>
    </li>
    <li>
        <strong>Audit options</strong>. These options control behavior like the handling of insertion points and what detection methods are employed. These options are very important in controlling what type of audit activity will be performed, from a lightweight purely passive analysis through to a heavyweight invasive scan. <a href="audit-options.html" class="chevron-after">Read more</a>
    </li>
</ul>
<h2 id="monitoring-scan-activity"> Monitoring Scan Activity </h2>
<p>
    You can monitor the progress and results of a scan in various ways:
</p>
<ul>
    <li>
        The <a href="../dashboard/index.html">Burp Dashboard</a> shows metrics about the progress of each task, and the <a href="../dashboard/issue-activity.html">issue activity log</a> shows the issues that are reported by all scanning tasks.
    </li>
    <li>
        You can open the <a href="../dashboard/task-details.html">task details window</a> for an individual scan, to view the <a href="../dashboard/issue-activity.html">issue activity log</a> for only that scan, and a detailed view of the <a href="audit-items.html">audit items</a> for applicable tasks.
    </li>
    <li>
        The <a href="../tools/target/site-map/index.html">Target site map</a> shows all of the content and issues that have been identified, organized by domain and URL.
    </li>
</ul>
<h2 id="reporting"> Reporting</h2>
<p>
    You can <a href="reporting-results.html">generate reports</a> of issues found via Burp Scanner in HTML format. You can also export issues in XML format suitable for importing into other tools.
</p>
</div>
</section>
</body>
</html>