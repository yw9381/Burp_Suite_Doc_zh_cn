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
            <a href="results.html">Results</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Analysis Results</h1>
        <p>
            The results window contains full details of all of the tests performed.
        </p>
        <h2 id="summary">Summary</h2>
        <p>
            The Summary tab is the first place to look to get an overall conclusion about the degree of randomness in
            the sample. It includes a chart showing the number of bits of effective entropy at or above each
            significance level. This provides an intuitive verdict on the number of bits that pass the randomness tests
            for different possible significance levels.
        </p>
        <p>
            The tab also reports an estimate of the reliability of the results, based on the number of samples.
        </p>
        <h2 id="character-level-analysis-results"> Character-level Analysis results</h2>
        <p>
            The Character-level analysis tab shows the summary results from all character-level tests, and lets you
            drill down into the detail of each character-level test. It also contains charts showing the size of the
            character set at each position, and the maximum number of bits of entropy that can be contributed from each
            character position.
        </p>
        <p>
            Note that the character-level tests are not reliable if the size of character sets employed is too large
            relative to the number of samples. For example, if a token employs 64 different characters at each position,
            and you only capture 100 samples, there is nowhere near enough sample data to draw any reliable conclusions
            about the distribution of characters. For this reason, when there is a risk of unreliable results, Burp
            Sequencer will automatically disable the character-level tests, to prevent the character-level results from
            undermining the overall combined results from the analysis.
        </p>
        <h2 id="bit-level-analysis-results"> Bit-level Analysis results</h2>
        <p>
            The Bit-level analysis tab shows the summary results from all bit-level tests, and lets you drill down into
            the detail of each bit-level test. This can let you gain a deeper understanding of the properties of the
            sample, to identify the causes of any anomalies, and to assess the possibilities for token prediction.
        </p>
        <p>
            There is also a chart showing the number of bits contributed by each character position in the token. This
            will enable you cross-reference individual bits within the token back to the original character positions,
            if you need to.
        </p>
        <h2 id="results-analysis-options">Results analysis Options</h2>
        <p>
            The Analysis options tab shows the options that were configured for the analysis. You can modify these and
            redo the analysis if required.
        </p>
        <div class="rounded-corner-box">
            <p>
                See the following help for more details:
            </p>
            <ul class="link-list">
                <li>
                    <a href="options.html#token-handling">Token handling</a>
                </li>
                <li>
                    <a href="options.html#token-analysis">Token analysis</a>
                </li>
            </ul>
        </div>
    </div>
</section>
</body>
</html>