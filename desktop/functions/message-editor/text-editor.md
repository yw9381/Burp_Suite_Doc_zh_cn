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
            <a href="../index.html">Useful Functions</a>
        </li>
        <li>
            <a href="index.html">Message Editor</a>
        </li>
        <li>
            <a href="text-editor.html">Text Editor</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Text Editor</h1>
        <p>
            The text editor is used by the <a href="index.html">HTTP message editor</a> for
            displaying requests and responses in <a href="index.html#raw">raw form</a>, and
            elsewhere within Burp for displaying plain text content. &nbsp;
        </p>
        <h2 id="syntax-analysis">Syntax Analysis</h2>
        <p>
            Syntax in HTTP requests and responses is automatically colorized to highlight interesting items, such as
            parameters in requests and HTML elements in responses. You can configure this behavior, and also the font,
            in <a href="../../options/display.html#http-message-display">message display options</a>.
        </p>
        <p>
            When syntax colorizing is enabled, the editor also displays mouse-over popups showing the decoded values of
            syntax items where appropriate. For HTTP requests, the popups perform URL-decoding, and for responses they
            perform HTML-decoding.
        </p>
        <h2 id="text-editor-hotkeys">Text editor hotkeys</h2>
        <p>
            The text editor supports hotkeys for various common actions. These can be configured in the <a href="../../options/misc-user.html#hotkeys">hotkeys options</a>, and the default hotkeys relevant to the text
            editor are as follows:
        </p>
        <ul>
            <li>
                Ctrl + A, select all
            </li>
            <li>
                Ctrl + X, cut selected text
            </li>
            <li>
                Ctrl + C, copy selected text
            </li>
            <li>
                Ctrl + V, paste
            </li>
            <li>
                Ctrl + S, find and highlight the selected text throughout the message
            </li>
            <li>
                Ctrl + Z, undo last edit
            </li>
            <li>
                Ctrl + Y, redo last undone edit
            </li>
            <li>
                Ctrl + U, URL-encode selected text (hold down Shift to decode)
            </li>
            <li>
                Ctrl + H, HTML-encode selected text (hold down Shift to decode)
            </li>
            <li>
                Ctrl + B, Base64-encode selected text (hold down Shift to decode)
            </li>
            <li>
                Ctrl + left, move to previous word
            </li>
            <li>
                Ctrl + right, move to next word
            </li>
            <li>
                Ctrl + up, move to previous paragraph
            </li>
            <li>
                Ctrl + down, move to next paragraph
            </li>
            <li>
                Ctrl + home, go to start of message
            </li>
            <li>
                Ctrl + end, go to end of message
            </li>
            <li>
                Ctrl + backspace, delete previous word
            </li>
            <li>
                Ctrl + del, delete next word
            </li>
        </ul>
        <h2 id="quick-search">Quick search</h2>
        <p>
            At the bottom of the text editor is a search bar that can be used to quickly find expressions within the
            displayed text. As you type into the search box, the editor will automatically highlight matching items in
            the text. The "&lt;" and "&gt;" buttons can be used to move the selection to the previous or next match. The
            "+" button displays the following options:
        </p>
        <ul>
            <li>
                <strong>Case sensitive</strong> - This specifies whether the search is case sensitive or insensitive.
            </li>
            <li>
                <strong>Regex</strong> - This specifies whether the search term is a regular expression or a literal
                string.
            </li>
            <li>
                <strong>Auto-scroll to match when text changes</strong> - This specifies whether the text editor should
                automatically scroll to the first highlighted match when new text is displayed. This is useful, for
                example, when stepping through items in the <a href="../../tools/proxy/history.html"> Proxy history</a> looking for
                a particular expression in responses. If this option is selected, then when you select a new item, the
                display will automatically scroll to the first search match.
            </li>
        </ul>
        <p>
            Note that in addition to search highlights, some Burp tools apply their own highlights to requests and
            responses. For example, <a href="../../../scanner/index.html">Burp Scanner</a> highlights relevant parts of HTTP messages
            in its <a href="../../tools/target/site-map/index.html#issues-view">issue advisories</a>. If you are not using the search
            function, you can use the "&lt;" and "&gt;" to move the selection between the tool-generated highlights.
        </p>
    </div>
</section>
</body>
</html>