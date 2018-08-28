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
            <a href="index.html">Tools</a>
        </li>
        <li>
            <a href="decoder.html">Decoder</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Burp Decoder</h1>
        <p>
            Burp Decoder is a simple tool for transforming encoded data into its canonical form, or for transforming raw
            data into various encoded and hashed forms. It is capable of intelligently recognizing several encoding
            formats using heuristic techniques.
        </p>
        <h2 id="loading-data-into-decoder">Loading data into Decoder</h2>
        <p>
            You can load data into Decoder in two ways:
        </p>
        <ul>
            <li>
                Type or paste it directly into the top editor panel.
            </li>
            <li>
                Select data anywhere within Burp, and choose "Send to Decoder" from the context menu.
            </li>
        </ul>
        <p>
            You can use the "Text" and "Hex" buttons to toggle the type of editor to use on your data.
        </p>
        <h2 id="transformations">Transformations</h2>
        <p>
            Different transformations can be applied to different parts of the data. The following decode and encode
            operations are available:
        </p>
        <ul>
            <li>
                URL
            </li>
            <li>
                HTML
            </li>
            <li>
                Base64
            </li>
            <li>
                ASCII hex
            </li>
            <li>
                Hex
            </li>
            <li>
                Octal
            </li>
            <li>
                Binary
            </li>
            <li>
                GZIP
            </li>
        </ul>
        <p>
            Additionally, various common hash functions are available, dependent upon the capabilities of your Java
            platform.
        </p>
        <p>
            When a part of the data has a transformation applied, the following things happen:
        </p>
        <ul>
            <li>
                The part of the data to be transformed is colorized accordingly. (View the <a href="#working-manually">manual
                drop-down lists</a> to see the colors used.)
            </li>
            <li>
                A new editor is opened showing the results of all the applied transformations. Any parts of the data
                that have not been transformed are copied into the new panel in their raw form.
            </li>
        </ul>
        <p>
            The new editor enables you to work recursively, applying multiple layers of transformations to the same
            data, to unpack or apply complex encoding schemes. Further, you can edit the transformed data in any of the
            editor panels, not only the top panel. So, for example, you can take a complex data structure, perform URL
            and HTML decoding on it, edit the decoded data, and then reapply the HTML and URL encoding (in reverse
            order), to generate modified but validly formatted data to use in an attack.&nbsp;
        </p>
        <h2 id="working-manually">Working Manually</h2>
        <p>
            To perform manual decoding and encoding, use the drop-down lists to select the required transformation. The
            chosen transformation will be applied to the selected data, or to the whole data if nothing is
            selected.
        </p>
        <h2 id="smart-decoding">Smart Decoding</h2>
        <p>
            On any panel within Decoder, you can click the &quot;Smart Decode&quot; button. Burp will then attempt to
            intelligently decode the contents of that panel by looking for data that appears to be encoded in
            recognizable formats such as URL-encoding or HTML-encoding. This action is performed recursively, continuing
            until no further recognizable data formats are detected. This option can be a useful first step when you
            have identified some opaque data, and want to take a quick look to see if it can be easily decoded into a
            more recognizable form. The&nbsp; decoding that is applied to each part of the data is indicated using the
            usual colorization.
        </p>
        <p>
            Because Burp Decoder makes a &quot;best guess&quot; attempt to recognize some common encoding formats, it
            will sometimes make mistakes. When this occurs, you can easily see all of the stages involved in the
            decoding, and the transformation that was applied at each position. You can then manually fix any incorrect
            transformations using the <a href="#working-manually">manual controls</a>, and continue the decoding manually or
            smartly from this point.
        </p>
    </div>
</section>
</body>
</html>