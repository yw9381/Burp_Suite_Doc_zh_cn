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
            <a href="response-extraction.html">Response Extraction Rules</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Response Extraction Rules</h1>
        <p>
            Response extraction rules are used in various locations within Burp, to define the location within a
            response of a varying item that needs to be extracted. They are used to identify a custom <a href="../tools/sequencer/sample.html#token-location-within-response">session token</a> in Sequencer, define an <a href="../tools/intruder/options.html#grep-extract"> extract grep</a> item in Intruder, and specify the location of
            a <a href="../options/sessions/macro-editor.html#custom-parameter-locations-in-response"> custom parameter value</a> in a macro.
        </p>
        <p>
            Because response extraction rules are designed to extract the same item from multiple responses that may
            differ in various ways, Burp provides very flexible ways of specifying the item's location.
        </p>
        <p>
            The dialog to define an extraction rules shows the current configuration in the top panels, and a sample
            response in the lower panel. If the response has not yet been fetched from the target application, you can
            click the "Fetch response" to do this.
        </p>
        <p>
            The easiest way to specify the item's location is simply to select it within the sample response. Provided
            the box "Update config based on selection below" is checked, Burp will then automatically create a suitable
            configuration in the top panels.
        </p>
        <p>
            In some situations, you may need to modify the configuration manually, to ensure that it works when
            different responses are received. The available options are described below.
        </p>
            <h4>Define start and end</h4>
        <p>
            This option lets you define the start and end points of the item
            to be extracted:
        </p>
        <ul>
                    <li>
                        <strong>Start after expression</strong> - You can specify a literal expression that precedes the
                        item you want to extract. You can use escape sequences to represent non-printing characters: \r
                        represents CR, \n represents LF, \xNN represents the character with ASCII hex code NN, and \\
                        represents a literal backslash.
            </li>
                    <li>
                        <strong>Start at offset</strong> - You can specify a fixed offset into the response where the
                        item begins.
                    </li>
                    <li>
                        <strong>End at delimiter</strong> - You can specify a literal expression that follows the item
                        you want to extract. You can use the same escape sequences as described for "Start after
                        expression".
                    </li>
                    <li>
                        <strong>End at fixed length</strong> - You can specify a fixed length that should be extracted
                        from the start of the item.
                    </li>
        </ul>
            <h4>Define from regex group</h4>
        <p>
            You can specify a regular expression containing a group, and
            the contents of the group will be extracted, if matched. For example, you could extract the contents of
            the HTML title tag using:
        </p>
        <p class="InlineCode">&lt;title&gt;(.*?)&lt;/title&gt;</p>
        <p>
Or you could extract the first 6-digit number that appears in the response using:</p>
<p class="InlineCode">(\d\d\d\d\d\d)</p>
<h4>Testing your configuration</h4>
        <p>
            When you manually modify the configuration in the upper panels, Burp automatically highlights within the
            response the item that will be extracted (if any).
        </p>
        <p>
            When you have completed the configuration, you can click the "Refetch response" button a few times to test
            the configuration. Burp will then refetch the response and automatically highlight the item that will be
            extracted, so that you can confirm that the configuration is working as intended.
        </p>
    </div>
</section>
</body>
</html>