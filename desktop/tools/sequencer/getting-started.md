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
            <a href="getting-started.html">Getting Started</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Getting Started With Burp Sequencer</h1>
        <p>
            Burp Sequencer is a tool for analyzing the quality of randomness in an application's session tokens and
            other important data items that are intended to be unpredictable.
        </p>
        <div class="rounded-corner-box">
            <p>
                <strong>Note:</strong> Using Burp Sequencer may result in unexpected effects in some applications. Until
                you are fully familiar with its functionality and settings, you should only use Burp Sequencer against
                non-production systems.
            </p>
        </div>
        <p>
            To start getting to know Burp Sequencer, carry out the following steps:
        </p>
        <ol>
            <li>
                First, ensure that Burp is <a href="../../getting-started/index.html#启动-burp">installed and running</a>, that
                you have <a href="../../getting-started/projects.html"> configured your browser</a> to work with Burp, and
                that you have browsed your target application to <a href="../proxy/getting-started.html"> populate your
                Proxy history</a>.
            </li>
            <li>
                Find a response in the Proxy history that issues a session token or other similar item, whether in a
                Set-Cookie header, in a form field, or anywhere else. (You can sort on the Cookies column in the
                history, to quickly find issued cookies.) Use the context menu to send the item to Burp Sequencer.
            </li>
            <li>
                Go to the Sequencer tab, and in the "Select Live Capture Request" section, select the item that you have
                just sent.
            </li>
            <li>
                In the "Token Location Within Response" section, select the location in the response where the token
                appears. If the token appears in a custom location (i.e. not in a Set-Cookie header or a form field),
                then select the "Custom location" option, and in the dialog, select the token in the response, then
                click "OK".
            </li>
            <li>
                In the "Select Live Capture Request" section, click the "Start live capture" button. This will cause
                Burp to issue the original request repeatedly, and extract all of the tokens received in responses. The
                live capture session opens a new window showing the progress of the capture, and the number of tokens
                that have been obtained. When a few hundred tokens have been obtained, pause the live capture session
                and click the "Analyze now" button.
            </li>
            <li>
                When the analysis is complete, the tabs will show the results of the randomness tests. These show an
                overall summary of the estimated amount of entropy within the sample, together with detailed results for
                each type of test that was performed. There is brief documentation for each test within the results
                themselves.
            </li>
            <li>
                In some situations, you may have already obtained a suitable sample of tokens. You can load this sample
                manually into Sequencer and perform the same analysis. To do this, in the main Burp UI, go to the
                Sequencer tab, and the Manual load sub-tab. You can paste your tokens from the clipboard or load them
                from file, and use the "Analyze now" button to start the analysis of the loaded sample.
            </li>
        </ol>
        <div class="rounded-corner-box">
            <p>
                Use the links below for further help on starting to use Burp Sequencer:
            </p>
            <ul class="link-list">
                <li>
                    <a href="index.html">Burp Sequencer help</a>
                </li>
                <li>
                    <a href="tests.html">How the randomness tests work</a>
                </li>
                <li>
                    <a href="results.html">Interpreting the results</a>
                </li>
                <li>
                    <a href="../../penetration-testing/index.html">Using Burp Suite</a>
                </li>
            </ul>
        </div>
    </div>
</section>
</body>
</html>