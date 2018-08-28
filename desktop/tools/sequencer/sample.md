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
            <a href="index.html">Sequencer</a>
        </li>
        <li>
            <a href="sample.html">Samples</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Obtaining a Sample</h1>
        <p>
            To perform the randomness tests on an application's tokens, it is first necessary to obtain a suitable
            sample of those tokens. This can be done in two ways: by performing an automatic <a href="#live-capture">live
            capture</a> of tokens directly from the target, or by <a href="#manual-load">manually loading</a> a sample of
            tokens that you have already acquired.
        </p>
        <p>
            <strong>Note:</strong> Obviously, a larger sample size enables a more reliable analysis. Burp will let you
            perform an initial analysis with a sample of only 100 tokens, although this should not be considered
            reliable for any serious purpose. A sample of 5,000 tokens is sufficient to perform a reliable analysis for
            most purposes, although this may depend on the sample's characteristics. The maximum supported sample size
            is 20,000 tokens, which is sufficient to perform FIPS-compliant statistical tests.&nbsp;
        </p>
        <h2 id="live-capture">Live Capture</h2>
        <p>
            To perform a live capture, you need to locate a request within the target application that returns somewhere
            in its response the session token or other item that you want to analyze. You can do this by selecting a
            request anywhere within Burp and choosing the &quot;Send to Sequencer" option from the context menu. The
            steps needed to configure the live capture on this request are described below.
        </p>
        <h3 id="select-live-capture-request">Select Live Capture Request</h3>
        <p>
            The live capture request list shows the requests that you have sent to Sequencer from other Burp tools.
            Select the request that returns the token or other item that you want to analyze.
        </p>
        <h3 id="token-location-within-response">Token Location Within Response</h3>
        <p>
            Select the location within the application's response where the token appears. The following options are
            available:
        </p>
        <ul>
            <li>
                <strong>Cookie</strong> - If the response sets any cookies, this option will let you select a cookie to
                analyze. This is the most common method of passing session tokens to clients.
            </li>
            <li>
                <strong>Form field</strong> - If the response contains any HTML form fields, this option will let you
                select a form field value to analyze. This method is often used for transmitting anti-CSRF tokens and
                other per-page tokens to clients.
            </li>
            <li>
                <strong>Custom location</strong> - You can use this option to specify a specific custom location within
                the response containing the data you want to analyze. This is done using the <a href="../../functions/response-extraction.html"> response extraction rule dialog</a>.
            </li>
        </ul>
        <h3 id="live-capture-options">Live Capture Options</h3>
        <p>
            These settings control the engine used for making HTTP requests and harvesting tokens when performing the
            live capture. The following options are available:
        </p>
        <ul>
            <li>
                <strong>Number of threads</strong> - This option controls the number of concurrent requests the live
                capture is able to make.
            </li>
            <li>
                <strong>Throttle between requests</strong> - Optionally, the live capture can wait a specified delay (in
                milliseconds) before every request. This option is useful to avoid overloading the application, or to be
                more stealthy.
            </li>
            <li>
                <strong>Ignore token whose length deviates by X characters</strong> - You can optionally configure the
                live capture to ignore tokens whose length deviates by a given threshold from the average token length.
                This can be useful if the application occasionally returns an anomalous response containing a different
                item in the location where the token normally appears.
            </li>
        </ul>
        <h3 id="running-the-live-capture">Running the Live Capture</h3>
        <p>
            When you have fully configured the live capture, click the &quot;Start live capture" button to begin the
            live capture. Burp Sequencer will repeatedly issue your request and extract the relevant token from the
            application's responses.
        </p>
        <p>
            During the live capture, a progress bar is shown, with counters of the numbers of tokens, requests, and
            network errors. The following options are available:
        </p>
        <ul>
            <li>
                <strong>Pause / resume</strong> - This temporarily pauses, and resumes, the capture.
            </li>
            <li>
                <strong>Stop</strong> - This permanently stops the capture.
            </li>
            <li>
                <strong>Copy tokens</strong> - This copies the currently captured tokens to the clipboard, for use in
                other Burp attacks (such as in Intruder payloads) or tools.
            </li>
            <li>
                <strong>Save tokens</strong> - This saves the currently captured tokens to file.
            </li>
            <li>
                <strong>Auto-analyze</strong> - If this option is enabled, Burp will automatically perform token
                analysis and update the results periodically during the live capture.
            </li>
            <li>
                <strong>Analyze now</strong> - This is available when a minimum of 100 tokens have been captured, and
                causes Burp to analyze the current sample and update the results.
            </li>
        </ul>
        <h2 id="manual-load">Manual Load</h2>
        <p>
            This function allows you to load Sequencer with a sample of tokens that you have already obtained, and then
            perform the statistical analysis on the sample.
        </p>
        <p>
            To perform a manual load, you first need to obtain your own sample of tokens from the target application
            through some means, such as your own script or the output from an earlier live capture, or an <a href="../intruder/using.html#harvesting-useful-data">Intruder attack</a>. The tokens need to be in a simple
            newline-delimited text format.
        </p>
        <p>
            Use the Paste button to paste the tokens from the clipboard, or the Load button to load them from file. The
            loaded tokens, together with details of the shortest and longest lengths, are displayed for you to
            sense-check that the sample has loaded correctly.&nbsp;
        </p>
        <p>
            To perform the analysis of the loaded tokens, click the &quot;Analyze now&quot; button.
        </p>
    </div>
</section>
</body>
</html>