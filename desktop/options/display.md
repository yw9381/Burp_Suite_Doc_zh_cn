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
            <a href="index.html">Options</a>
        </li>
        <li>
            <a href="display.html">Display</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Options: Display</h1>
        <p>
            This tab contains settings for Burp's <a href="#user-interface">user interface</a>, HTTP <a href="#http-message-display">message
            display</a>, <a href="#character-sets"> character set</a> handling, and <a href="#html-rendering">HTML rendering</a>.
        </p>
        <h2 id="user-interface">User Interface</h2>
        <p>
            These settings let you control the appearance of Burp's user interface. You can configure the font size that
            is used throughout the UI (except for display of <a href="#http-message-display">HTTP messages</a>), and also the
            Java look-and-feel. Changes to these settings will take effect when Burp is restarted.
        </p>
        <h2 id="http-message-display">HTTP Message Display</h2>
        <p>
            These settings let you control how HTTP messages are displayed within the <a href="../functions/message-editor/index.html">HTTP message editor</a>. You can configure the font face and
            point size, and whether font smoothing is used.
        </p>
        <p>
            The following additional options are available:
        </p>
        <ul>
            <li>
                <strong>Highlight request syntax</strong> - This controls whether syntax colorizing is done for request
                parameters.
            </li>
            <li>
                <strong>Highlight response syntax</strong> - This controls whether syntax colorizing is done for
                response syntax.
            </li>
        </ul>
        <h2 id="character-sets">Character Sets</h2>
        <p>
            These settings control how Burp handles different character sets when displaying raw HTTP messages. The
            available options are:
        </p>
        <ul>
            <li>
                Recognize the character set of each message automatically, based on the message headers. This is the
                default option, and lets you work concurrently on messages that use different character sets.
            </li>
            <li>
                Use the platform default character set for all messages.
            </li>
            <li>
                Display messages as raw bytes (using ASCII encoding), without processing any extended characters.
            </li>
            <li>
                Use a specific character set for all messages.
            </li>
        </ul>
        <p>
            HTTP headers are always displayed in raw form - the charset encoding options only apply to the message
            body.
        </p>
        <p>
            Note that the glyphs required for some character sets are not supported by all fonts. If you need to use an
            extended or unusual character set, you should first try a system font such as Courier New or Dialog.
        </p>
        <h2 id="html-rendering">HTML Rendering</h2>
        <p>
            The <a href="../functions/message-editor/index.html#render">Render tab</a> within the <a href="../functions/message-editor/index.html">HTTP message editor</a> displays HTML content approximately as
            it would appear in your browser. This option controls whether Burp will make any additional HTTP requests
            that are required to fully render HTML content (for example, for embedded images). Use of this option
            involves a trade-off between the speed and the quality of HTML rendering, and whether you wish to avoid
            making any further requests to the target application.
        </p>
</div>
</section>
</body>
</html>