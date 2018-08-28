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
            <a href="tests.html">Randomness Tests</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>How the Randomness Tests Work</h1>
        <p>
            Burp Sequencer employs standard statistical tests for randomness. These are based on the principle of
            testing a hypothesis against a sample of evidence, and calculating the probability of the observed data
            occurring, assuming that the hypothesis is true:
        </p>
        <ul>
            <li>
                The <strong>hypothesis</strong> to be tested is: that the tokens are randomly generated.
            </li>
            <li>
                Each <strong>test</strong> observes specific properties of the sample that are likely to have certain
                characteristics if the tokens are randomly generated.
            </li>
            <li>
                The <strong>probability</strong> of the observed characteristics occurring is calculated, working on the
                assumption that the hypothesis is true.
            </li>
            <li>
                If this probability falls below a certain level (the &quot;<strong> significance level </strong>&quot;)
                then the hypothesis is rejected and the tokens are deemed to be non-random.
            </li>
        </ul>
        <p>
            The significance level is a key parameter in this methodology. Using a lower significance level means that
            stronger evidence is required to reject the hypothesis that the tokens are randomly generated, and so
            increases the chance that non-random data will be treated as random. There is no universally &quot;right&quot;
            significance level to use for any particular purpose: scientific experiments often use significance levels
            in the region of 1% to 5%; the standard FIPS tests for randomness (which are implemented within Burp
            Sequencer) use significance levels in the region of 0.002% to 0.03%. Burp Sequencer lets you choose what
            significance level you wish to use to interpret its findings:
        </p>
        <ul>
            <li>
                Each individual test reports the computed probability of the observed data occurring, assuming that the
                hypothesis is true. This probability represents the boundary significance level at which the hypothesis
                would be rejected, based solely upon this test.
            </li>
            <li>
                Aggregated results from multiple tests are presented in terms of the number of bits of effective entropy
                within the token at various significance levels, ranging from 0.001% to 10%. This summary enables you to
                see how your choice of significance level affects the &quot;quantity&quot; of randomness deemed to exist
                within the sample. In typical cases, this summary demonstrates that the choice of significance level is
                a moot point because the tokens possess either a clearly satisfactory or clearly unsatisfactory amount
                of randomness for any of the significance levels that you may reasonably choose.
            </li>
        </ul>
        <p>
            Some important caveats arise with any statistical-based test for randomness. The results may contain false
            negatives and positives for the following reasons:
        </p>
        <ul>
            <li>
                Data that is generated in a completely deterministic way may be deemed to be random by statistical
                tests. For example, a well-designed linear congruential pseudo-random number generator, or an algorithm
                which computes the hash of a sequential number, may produce seemingly random output even though an
                attacker who knows the internal state of the generator can extrapolate its output with complete
                reliability in both forwards and reverse directions.
            </li>
            <li>
                Data that is deemed to be non-random by statistical-based tests may not actually be predictable in a
                practical situation because the patterns that are discernible within the data do not sufficiently narrow
                down the range of possible future outputs to a range that can be viably tested.
            </li>
        </ul>
        <p>
            Because of these caveats, the results of using Burp Sequencer should be interpreted only as an indicative
            guide to the randomness of the sampled data.
        </p>
        <p>
            The tests performed by Burp Sequencer divide into two levels of analysis: <a href="#character-level-analysis">character-level</a> and <a href="#bit-level-analysis">bit-level</a>.
        </p>
        <h2 id="character-level-analysis">Character-Level Analysis</h2>
        <p>
            The character-level tests operate on each character position of the token in its raw form. First, the size
            of the character set at each position is counted - this is the number of different characters that appear at
            each position within the sample data. Then, the following tests are performed using this information:
        </p>
        <ul>
            <li>
                <strong>Character count analysis</strong>. This test analyzes the distribution of characters used at
                each position within the token. If the sample is randomly generated, the distribution of characters
                employed is likely to be approximately uniform. At each position, the test computes the probability of
                the observed distribution arising if the tokens are random.
            </li>
            <li>
                <strong>Character transition analysis</strong>. This test analyzes the transitions between successive
                tokens in the sample. If the sample is randomly generated, a character appearing at a given position is
                equally likely to be followed in the next token by any one of the characters that is used at that
                position. At each position, the test computes the probability of the observed transitions arising if the
                tokens are random.
            </li>
        </ul>
        <p>
            Based on the above tests, the character-level analysis computes an overall score for each character position
            - this is the lowest probability calculated at each position by each of the character-level tests. The
            analysis then counts the number of bits of effective entropy for various significance levels. Based on the
            size of its character set, each position is assigned a number of bits of entropy (2 bits if there are 4
            characters, 3 bits if there are 8 characters, etc.), and the total number of bits at or above each
            significance level are calculated.
        </p>
        <h2 id="bit-level-analysis">Bit-Level Analysis</h2>
        <p>
            The bit-level tests are more powerful than the character-level tests. To enable bit-level analysis, each
            token is converted into a set of bits, with the total number of bits determined by the size of the character
            set at each character position. If any positions employ a character set whose size is not a round power of
            two, the sample data at that position is translated into a character set whose size is the nearest smaller
            round power of two. The partial bit of data at the position is effectively merged into the whole bits
            derived from that position. This translation is done in a way that is designed to preserve the randomness
            characteristics of the original sample, without introducing or removing any bias. However, no process of
            this type can be perfect, and it is likely the process of analyzing samples with non-round character set sizes will introduce some inaccuracies into the
            analysis results.
        </p>
        <p>
            When each token has been converted into a sequence of bits, the following tests are performed at each bit
            position:
        </p>
        <ul>
            <li>
                <strong>FIPS monobit test</strong>. This test analyzes the distribution of ones and zeroes at each bit
                position. If the sample is randomly generated, the number of ones and zeroes is likely to be
                approximately equal. At each position, the test computes the probability of the observed distribution
                arising if the tokens are random. For each of the FIPS tests carried out, in addition to reporting the
                probability of the observed data occurring, Burp Sequencer also records whether each bit passed or
                failed the FIPS test. Note that the FIPS pass criteria are recalibrated within Burp Sequencer to work
                with arbitrary sample sizes, while the formal specification for the FIPS tests assumes a sample of
                exactly 20,000 tokens. Hence, if you wish to obtain results that are strictly compliant with the FIPS
                specification, you should ensure that you use a sample of 20,000 tokens.
            </li>
            <li>
                <strong>FIPS poker test</strong>. This test divides the bit sequence at each position into consecutive,
                non-overlapping groups of four, and derives a four-bit number from each group. It then counts the number
                of occurrences of each of the 16 possible numbers, and performs a chi-square calculation to evaluate
                this distribution. If the sample is randomly generated, the distribution of four-bit numbers is likely
                to be approximately uniform. At each position, the test computes the probability of the observed
                distribution arising if the tokens are random.
            </li>
            <li>
                <strong>FIPS runs tests.</strong> This test divides the bit sequence at each position into runs of
                consecutive bits which have the same value. It then counts the number of runs with a length of 1, 2, 3,
                4, 5, and 6 and above. If the sample is randomly generated, the number of runs with each of these
                lengths is likely to be within a range determined by the size of the sample set. At each position, the
                test computes the probability of the observed runs occurring if the tokens are random.
            </li>
            <li>
                <strong>FIPS long runs test</strong>. This test measures the longest run of bits with the same value at
                each bit position. If the sample is randomly generated, the longest run is likely to be within a range
                determined by the size of the sample set. At each position, the test computes the probability of the
                observed longest run arising if the tokens are random. Note that the FIPS specification for this test
                only records a fail if the longest run of bits is overly long. However, an overly short longest run of
                bits also indicates that the sample is not random. Therefore some bits may record a significance level
                that is below the FIPS pass level even though they do not strictly fail the FIPS test.
            </li>
            <li>
                <strong>Spectral tests</strong>. This test performs a sophisticated analysis of the bit sequence at each
                position, and is capable of identifying evidence of non-randomness in some samples that pass the other
                statistical tests. The test works through the bit sequence and treats each series of consecutive numbers
                as coordinates in a multi-dimensional space. It plots a point in this space at each location determined
                by these co-ordinates. If the sample is randomly generated, the distribution of points within this space
                is likely to be approximately uniform; the appearance of clusters within the space indicates that the
                data is likely to be non-random. At each position, the test computes the probability of the observed
                distribution occurring if the tokens are random. The test is repeated for multiple sizes of number
                (between 1 and 8 bits) and for multiple numbers of dimensions (between 2 and 6).
            </li>
            <li>
                <strong>Correlation test</strong>. Each of the other bit-level tests operates on individual bit
                positions within the sampled tokens, and so the amount of randomness at each bit position is calculated
                in isolation. Performing only this type of test would prevent any meaningful assessment of the amount of
                randomness in the token as a whole: a sample of tokens containing the same bit value at each position
                may appear to contain more entropy than a sample of shorter tokens containing different values at each
                position. Hence, it is necessary to test for any statistically significant relationships between the
                values at different bit positions within the tokens. If the sample is randomly generated, a value at a
                given bit position is equally likely to be accompanied by a one or a zero at any other bit position. At
                each position, this test computes the probability of the relationships observed with bits at other
                positions arising if the tokens are random. To prevent arbitrary results, when a degree of correlation
                is observed between two bits, the test adjusts the significance level of the bit whose significance
                level is lower based on all of the other bit-level tests.
            </li>
            <li>
                <strong>Compression test</strong>. This test does not use the statistical approach employed by the other
                tests, but rather provides a simple intuitive indication of the amount of entropy at each bit position.
                The test attempts to compress the bit sequence at each position using standard ZLIB compression. The
                results indicate the proportional reduction in the size of the bit sequence when it was compressed. A
                higher degree of compression indicates that the data is less likely to be randomly generated.
            </li>
        </ul>
        <p>
            Based on the above tests, the bit-level analysis computes an overall score for each bit position - this is
            the lowest probability calculated at each position by each of the bit-level tests. The analysis then counts
            the number of bits of effective entropy for various significance levels.
        </p>
    </div>
</section>
</body>
</html>