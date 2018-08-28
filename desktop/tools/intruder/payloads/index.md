<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../../../../../styles/css/ps.css">
</head>
<body>
<section class="container ps-breadcrumbs">
    <ol>
        <li>
            <a href="https://support.portswigger.net/">Support Center</a>
        </li>
        <li>
            <a href="../../../../index.html">Documentation</a>
        </li>
        <li>
            <a href="../../../index.html">Desktop Editions</a>
        </li>
        <li>
            <a href="../../index.html">Tools</a>
        </li>
        <li>
            <a href="../index.html">Intruder</a>
        </li>
        <li>
            <a href="index.html">Payloads</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Payloads</h1>
        <p>
            This tab is used to configure one or more payload sets. The number of payload sets depends on the attack
            type defined in the <a href="../positions.html#attack-type">Positions tab</a>. For many common tasks,
            such as fuzzing parameters, brute force guessing a user's password, or cycling through page identifiers,
            only a single payload set is needed.
        </p>
        <p>
            The configuration steps needed to configure a payload set are as follows:
        </p>
        <ul>
            <li>
                Select the payload set that you wish to configure from the drop-down list.
            </li>
            <li>
                Select the <a href="types.html">payload type</a> to use from the drop-down list. A large number of payload types
                are available, and these are highly configurable, allowing you to quickly automate the generation of
                payloads for virtually any situation.
            </li>
            <li>
                Configure the <a href="types.html">payload options</a> for the
                selected payload type.
            </li>
            <li>
                Configure any further required required <a href="processing.html">payload processing</a>, including payload processing<a href="processing.html#payload-processing-rules"> rules</a> to manipulate the generated payloads in various ways, and payload <a href="processing.html#payload-encoding"> encoding</a> to ensure that the correct characters are URL-encoded for safe transmission over
                HTTP.
            </li>
        </ul>
    </div>
</section>
</body>
</html>