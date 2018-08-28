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
            <a href="content-discovery.html">Content Discovery</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Content Discovery</h1>
        <p>
            This function can be used to discover content and functionality which is not linked from visible content
            that you can browse to or spider.
        </p>
        <p>
            To access this function, select an HTTP request anywhere within Burp, or any part of the Target <a href="../tools/target/site-map/index.html">site map</a>, and choose "Discover content" within "Engagement tools" in the
            context menu.
        </p>
        <p>
            Burp uses various techniques to discover content, including name guessing, web spidering, and extrapolation
            from naming conventions observed in use within the application. Discovered content is displayed within a
            special <a href="#site-map">site map</a> that is specific to the discovery session, and can also optionally
            be added to the main <a href="../tools/target/site-map/index.html">suite site map</a>.
        </p>
        <h2 id="control">Control</h2>
        <p>
            This tab shows you the current status of the discovery session.
        </p>
        <p>
            The toggle button indicates whether the session is running, and lets you pause and restart the session.
        </p>
        <p>
            The following information is displayed about the progress of the discovery session:
        </p>
        <ul>
            <li>
                Number of requests made
            </li>
            <li>
                Number of bytes transferred in server responses
            </li>
            <li>
                Number of network errors
            </li>
            <li>
                Number of discovery tasks queued
            </li>
            <li>
                Number of spider requests queued
            </li>
            <li>
                Number of responses queued for analysis
            </li>
        </ul>
        <p>
            The individual discovery tasks that are queued are shown in a table. The discovery engine works recursively,
            and when a new directory or file is discovered, further tasks are derived from this, depending on the
            configuration. For example, when a new directory is discovered, Burp might add tasks to look for
            sub-directories and files within that directory; or, when a new file is discovered, Burp might add a task to
            check for the same base filename with different file extensions. Newly added tasks are prioritized according
            to their likelihood of quickly discovering new content.
        </p>
        <h2 id="target">Target</h2>
        <p>
            These options let you define the start directory for the content discovery session, and whether files or
            directories should be targeted. The following options are available:
        </p>
        <ul>
            <li>
                <strong>Start directory</strong> - This is the location where Burp will start looking for content. Only
                items within this path and its subdirectories will be requested during the session.
            </li>
            <li>
                <strong>Discover</strong> - This option determines whether the session will look for files or
                directories or both. If you are checking for directories, you can choose whether and how deep to recurse
                into discovered subdirectories.
            </li>
        </ul>
        <h2 id="filenames">Filenames</h2>
        <p>
            These options let you configure the sources that Burp should use for generating filenames to test. The
            following options are available
        </p>
        <ul>
            <li>
                Built-in short file list
            </li>
            <li>
                Built-in short directory list
            </li>
            <li>
                Built-in long file list
            </li>
            <li>
                Built-in long directory list
            </li>
            <li>
                Custom file list
            </li>
            <li>
                Custom directory list
            </li>
            <li>
                Names discovered in use on the target site. If this option is selected, Burp will maintain a list of all
                directories and filename stems that have been discovered on the target site, and will also check for
                these in each new directory that is tested.
            </li>
            <li>
                Derivations based on discovered items. If this option is selected, Burp will attempt to guess item names
                based on those that have already been discovered. For example, if the directory AnnualReport2011 is
                discovered, Burp will also check for AnnualReport2012, AnnualReport2013, etc.
            </li>
        </ul>
        <h2 id="file-extensions">File Extensions</h2>
        <p>
            These settings control how the discovery session adds file extensions to file stems that are being tested.
            The file stems themselves are derived according to the <a href="#filenames">filenames</a> options. When each
            file stem is tested, Burp check for various different extensions, according to these settings. The following
            options are available:
        </p>
        <ul>
            <li>
                <strong>Test these extensions</strong> - This option lets you configure a list of extensions that Burp
                will always check for. You can fine-tune the default list based on the technologies known to be in use
                on the target application.
            </li>
            <li>
                <strong>Test all extensions observed on target site</strong> - If this option is selected, then Burp
                will automatically check for file extensions that have been observed in use on the target site. This
                option is useful when you don't know exactly what extensions or technologies are in use. You can also
                configure a list of extensions that you don't want to check for even if found to be in use (such as
                image files).
            </li>
            <li>
                <strong>Test these variant extensions on discovered files</strong> - This option lets you configure a
                list of extensions that Burp will additionally check for using the stems of discovered filenames. This
                option is useful to check for backup copies of existing files.
            </li>
            <li>
                <strong>Test file stems with no extension</strong> - If this option is selected, Burp will check for
                each file stem with no extension added.
            </li>
        </ul>
        <h2 id="discovery-engine">Discovery Engine</h2>
        <p>
            These settings control the engine used for making HTTP requests when discovering content, and interaction
            with the suite <a href="../tools/target/site-map/index.html">site map</a>. The following options are available:
        </p>
        <ul>
            <li>
                <strong>Case sensitivity</strong> - This setting controls whether Burp will handle filenames case
                sensitively. If "Auto-detect" is selected, then Burp will start by handling filenames case sensitively,
                and on discovering the first new item, will test the server's treatment of case variations. Depending on
                that treatment, Burp may revert to handling filenames case insensitively.
            </li>
            <li>
                <strong>Add discovered content to suite site map</strong> - If this option is selected, then new items
                identified in the current discovery session will be automatically added to the main <a href="../tools/target/site-map/index.html">suite site map</a>.
            </li>
            <li>
                <strong>Copy content from suite site map</strong> - If this option is selected, then the discovery
                session will copy any existing relevant content from the main <a href="../tools/target/site-map/index.html">suite site
                map</a> into the <a href="#site-map">discovery site map</a>, to provide a stronger starting basis for
                discovering new content.
            </li>
            <li>
                <strong>Spider from discovered content</strong> - If this option is selected, then the discovery session
                will perform conventional web spidering, and will process the responses to discovery requests looking
                for links to additional new content.
            </li>
            <li>
                <strong>Number of discovery threads</strong> - This option controls the number of concurrent requests
                the discovery engine is able to make.
            </li>
            <li>
                <strong>Number of spider threads</strong> - This option controls the number of concurrent requests the
                spidering function is able to make, if enabled.
            </li>
        </ul>
        <h2 id="site-map">Site Map</h2>
        <p>
            The discovery session employs its own site map, showing all of the content which has been discovered within
            the defined scope. If you have configured Burp to do so, newly discovered items will also be added to Burp&#39;s
            main <a href="../tools/target/site-map/index.html"> site map</a>.
        </p>
    </div>
</section>
</body>
</html>