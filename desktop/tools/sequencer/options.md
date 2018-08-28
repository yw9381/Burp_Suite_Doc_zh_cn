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
            <a href="options.html">Analysis Options</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Analysis Options</h1>
        <p>
            The "Analysis options" tab lets you configure how tokens are <a href="#token-handling">handled</a>, and which
            types of tests are performed during the <a href="#token-analysis">analysis</a>.
        </p>
        <h2 id="token-handling">Token Handling</h2>
        <p>
            These settings control how tokens are handled during analysis. The following options are available:
        </p>
        <ul>
            <li>
                <strong>Pad short tokens at start / end</strong> - If the tokens produced by the application have
                variable length, these will need to be padded to enable the statistical tests to be performed. You can
                choose whether the padding should be applied at the start or the end of each token. In most cases,
                padding tokens at the start is most appropriate.
            </li>
            <li>
                <strong>Pad with</strong> - You can specify the character that will be used for padding. In most cases,
                for numeric or ASCII hex-encoded tokens, padding with the "0" character is most appropriate.
            </li>
            <li>
                <strong>Base64-decode before analyzing</strong> - If the tokens are Base64-encoded, you can configure
                Burp to decode these before analyzing, which will generally improve the accuracy of the analysis.
            </li>
        </ul>
        <h2 id="token-analysis">Token Analysis</h2>
        <p>
            These options control the types of analyses that are performed. You can individually enable or disable each
            type of character-level and bit-level test. Sometimes, after performing an initial analysis with all tests
            enabled, you may want to disable certain tests to reflect your better understanding of the tokens'
            characteristics, or to isolate the effects of any unusual characteristics manifested by your sample.
        </p>
        <p>
            In the results window, after modifying any of the analysis options you can click the "Redo analysis" button
            to re-perform the analysis with your new settings, and update the results.
        </p>
    </div>
</section>
</body>
</html>