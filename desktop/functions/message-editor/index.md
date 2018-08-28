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
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Message Editor</h1>
        <p>
            The message editor is used throughout Burp for viewing and editing HTTP requests and responses, and
            WebSockets messages. As well as displaying the raw messages themselves, the editor includes a large number
            of functions to help you quickly analyze the messages further, drive Burp's core <a href="../../penetration-testing/index.html">workflow</a>, and carry out other useful tasks.
        </p>
        <h2 id="message-analysis-tabs">Message Analysis Tabs</h2>
        <p>
            The editor uses various tabs to display and analyze different types of messages. The tabs that are shown
            depend on the type and contents of the currently displayed message.
        </p>
        <h3 id="raw">Raw</h3>
        <p>
            This tab displays the message in raw form in a <a href="text-editor.html">text
            editor</a>. The text editor includes various useful functions including <a href="text-editor.html#syntax-analysis"> syntax analysis</a>, <a href="text-editor.html#text-editor-hotkeys">hotkeys</a> and <a href="text-editor.html#quick-search"> text search</a>.
        </p>
        <h3 id="params">Params</h3>
        <p>
            This tab applies only to HTTP requests, and displays the request parameters in tabular form. If the message
            is editable, then you can edit each parameter's name and value directly in the table, and also change the
            parameter type. You can also add, move and reorder parameters.
        </p>
        <p>
            Where applicable, parameter names and values are displayed in the table in their URL-decoded form, for
            easier viewing. When you double-click an item for editing, it will be shown in its original form. If, while
            editing, you enter any relevant metacharacters in their literal form (such as an ampersand or equals
            character), these will be automatically URL-encoded when you finish editing.
        </p>
        <p>
            You can select a single cell and use Ctrl+C to copy its value. If you select multiple rows, then all the
            selected values are copied, with tab/newline delimiters, allowing you to easily paste the content into other
            software, such as a spreadsheet.
        </p>
        <h3 id="headers">Headers</h3>
        <p>
            This tab applies to any HTTP message containing headers after the first line. It displays the header names
            and values in tabular form. If the message is editable, then you can edit each header's name and value
            directly in the table. You can also add, move and reorder headers.
        </p>
        <p>
            If the message has a non-empty body, this will be displayed in the lower half of the headers tab, in its own <a href="text-editor.html">text editor</a>.
        </p>
        <h3 id="hex">Hex</h3>
        <p>
            This tab displays the message in raw form in a hex editor. You can edit individual bytes directly by
            double-clicking values in the table. Values must be given in two-digit hexadecimal form, from 00 through
            FF.
        </p>
        <p>
            The context menu for this tab additionally has the following items:
        </p>
        <ul>
            <li>
                <strong>Insert byte</strong> - This inserts a single new byte before the selected byte.
            </li>
            <li>
                <strong>Insert bytes</strong> - This inserts the requested number of new bytes before the selected byte.
            </li>
            <li>
                <strong>Insert string</strong> - This inserts the specified string before the selected byte.
            </li>
            <li>
                <strong>Delete byte</strong> - This deletes the selected byte.
            </li>
            <li>
                <strong>Delete bytes</strong> - This deletes the requested number of bytes starting at the selected
                byte.
            </li>
        </ul>
        <h3 id="html">HTML</h3>
        <p>
            This tab applies to HTTP responses containing HTML content in the message body. The tab displays only the
            HTML (no headers), and shows this in a prettified form, with the content laid out and indented according to
            the HTML tag hierarchy. The main use of this tab is to make badly formatted HTML (as shown in the <a href="#raw">Raw tab</a>) more easily readable.
        </p>
        <h3 id="xml">XML</h3>
        <p>
            This tab applies to HTTP responses containing XML content in the message body. The tab displays only the XML
            (no headers), and shows this in a prettified form, with the content laid out and indented according to the
            XML tag hierarchy. The main use of this tab is to make badly formatted XML (as shown in the <a href="#raw">Raw tab</a>) more easily readable.
        </p>
        <h3 id="render">Render</h3>
        <p>
            This tab applies to HTTP responses containing HTML or image content. It attempts to render the contents of
            the message body in the form it would appear when displayed in a browser.
        </p>
        <h3 id="viewstate">ViewState</h3>
        <p>
            This tab applies to HTTP messages containing an ASP.NET ViewState (either as a parameter in requests, or as
            a form field in responses). The contents of the ViewState are unpacked and displayed in a tree structure
            (unless the ViewState is encrypted). The raw data itself is shown in a panel below the tree (in a text
            editor for ViewState v1.0 and in a hex editor for v2.0).
        </p>
        <p>
            If the message is editable, then you can edit the raw data in the lower panel to modify the ViewState. (The
            tree itself is not editable.) When you have finished editing the raw data, if you select another tab in the
            message editor, and then re-select the ViewState tab, then the tree will be redrawn with your updated
            content. Note that if the ViewState is MAC-enabled, then editing it is unlikely to achieve anything, because
            the server-side platform will reject the modified data.
        </p>
<h2 id="context-menu-commands">Context Menu Commands</h2>
<p>
    Right-clicking on the message editor produces a context menu that can be used to perform various actions,
    depending on the message type. These are described below.
</p>
<p>
    <strong>Note:</strong> The context menu may also include additional items that are specific to the tool in which the editor appears
    (for example, in <a href="../../tools/repeater/index.html">Repeater</a>, the context menu has options to paste a URL as a
    request, and add the current item to the site map).
</p>
    <h4>Scan / send to ...</h4>
<p>
    You can send any message, or a selected portion of the message, to
    other Burp tools, to perform further attacks or analysis. The ability to send requests between tools
    forms the core of Burp's <a href="../../penetration-testing/index.html">user-driven workflow</a>.
</p>
    <h4>Show response in browser</h4>
<p>
    You can use this to render the selected response in your
    browser, to avoid the limitations of Burp's built-in <a href="#render">HTML renderer</a>. When you
    select this option, Burp gives you a unique URL that you can paste into your browser (configured to use
    the current instance of Burp as its proxy), to render the response. The resulting browser request is
    served by Burp with the exact response that you selected (the request is not forwarded to the original
    web server), and yet the response is processed by the browser in the context of the originally requested
    URL. Hence, relative links within the response will be handled properly by your browser. As a result,
    your browser may make additional requests (for images, CSS, etc.) in the course of rendering the
    response - these will be handled by Burp in the usual way.
</p>
    <h4>Request in browser</h4>
<p>
    You can use this to re-issue the selected request in your browser
    (configured to use the current instance of Burp as its proxy). The following sub-options are available:
</p>
<ul>
                    <li>
                        <strong>In original session</strong> - This causes Burp to issue the request using the exact
                        Cookie header that appeared in the original request.
            </li>
                    <li>
                        <strong>In current browser session</strong> -&nbsp;&nbsp; This causes Burp to issue the request
                        using the cookies supplied by your browser. You can use this feature to facilitate testing of
                        access controls, by selecting requests within Burp that were generated within one user context
                        (e.g. an administrator), and reissuing the requests within a different user context that you are
                        now logged in as (e.g. an ordinary user). When you are dealing with complex, multi-stage
                        processes, this methodology, of manually pasting a series of URLs from Burp into your browser,
                        is normally a lot easier than repeating a multi-stage process over and over, and modifying
                        cookies manually using the Proxy.
                    </li>
        </ul>
    <h4>Engagement tools</h4>
<p>
    <span class="pro-edition-feature-label">Professional</span>
    This submenu contains various useful functions for carrying out
    engagement-related tasks:
</p>
<ul>
                    <li>
                        <strong>Find references</strong> - You can use the <a href="../search.html#find-references">Find references</a> function to search all of
                        Burp&#39;s tools for HTTP responses that link to the currently displayed item.
            </li>
                    <li>
                        <strong>Discover content</strong> -You can use the <a href="../content-discovery.html">Discover content</a> function to discover
                        content and functionality that is not linked from visible content which you can browse to or
                        spider.
                    </li>
                    <li>
                        <strong>Schedule task</strong> - You can use the <a href="../task-scheduler.html">Schedule
                        task</a> function to create tasks that will run automatically at defined times and intervals.
                    </li>
                    <li>
                        <strong>Generate CSRF PoC</strong> - You can use the <a href="../generate-csrf-poc.html">Generate
                        CSRF PoC</a> function to create some HTML which, when viewed in a browser, will cause the
                        current request to be issued.
                    </li>
        </ul>
    <h4>Change request method</h4>
<p>
    For requests, you can automatically switch the request method
    between GET and POST, with all relevant request parameters suitably relocated within the request. This
    option can be used to quickly test the application&#39;s tolerance of parameter location, e.g. to bypass
    input filters or fine-tune a cross-site scripting attack.
</p>
    <h4>Change body encoding</h4>
<p>
    For requests, you can switch the encoding of any message body
    between standard URL-encoded and multipart.
</p>
    <h4>Copy URL</h4>
<p>
    This function copies the full current URL to the clipboard.
</p>
    <h4>Copy as curl command</h4>
<p>
    This function copies to the clipboard a curl command that can be
    used to generate the current request.
</p>
    <h4>Copy to file</h4>
<p>
    This function allows you to select a file and copy the contents of the
    current message to the file. This is handy for binary content, when copying via the clipboard may cause
    problems. Copying operates on the selected text or, if nothing is selected, the whole message.
</p>
    <h4>Paste from file</h4>
<p>
    This function allows you to select a file and paste the contents of
    the file into the message. This is handy for binary content, when pasting via the clipboard may cause
    problems. Pasting replaces the selected text or, if nothing is selected, inserts at the cursor position.
</p>
    <h4>Save item</h4>
<p>
    This function lets you specify a file to save the selected request and
    response in XML format, including all relevant metadata such as response length, HTTP status code and
    MIME type.
</p>
    <h4>Convert selection</h4>
<p>
    This applies to the <a href="#raw">Raw tab</a> only. The
    submenu items enable you to perform quick encoding or decoding of the selected text in a variety of
    schemes. If the message is editable, then the conversion is performed in-place to the selected text. If
    the message is not editable, then the result of the conversion is shown in a dialog. The following types
    of conversion are available:
</p>
<ul>
                    <li>
                        <strong>URL</strong> - These options perform URL encoding or decoding. You can optionally encode
                        just key HTTP metacharacters, or all characters, or all characters using 2-byte Unicode-encoding
                        (e.g. %u0041 for A).
            </li>
                    <li>
                        <strong>HTML</strong> - These options perform HTML encoding or decoding. You can optionally
                        encode just key HTML metacharacters, or all characters, or all characters using numeric entities
                        (e.g. &amp;#65; for A), or all characters using hex entities (e.g. &amp;#x41; for A).
                    </li>
                    <li>
                        <strong>Base64</strong> - These options perform Base64 encoding or decoding.
                    </li>
                    <li>
                        <strong>Construct string</strong> - These options generate code in various interpreted languages
                        to dynamically construct the selected string. It can be useful for delivering certain attacks
                        like SQL injection, where it is necessary to dynamically build a string to evade input filters.
                        The available options are JavaScript, and SQL on the Microsoft, Oracle and MySQL platforms.
                    </li>
        </ul>
    <h4>URL-encode as you type</h4>
<p>
    This applies to the <a href="#raw">Raw tab</a> only. If
    this option is turned on then characters like &amp; and = will be automatically replaced with their
    URL-encoded equivalents as you type.
</p>
    </div>
</section>
</body>
</html>