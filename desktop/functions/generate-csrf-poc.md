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
            <a href="generate-csrf-poc.html">Generate CSRF PoC</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Generate CSRF PoC</h1>
        <p>
            This function can be used to generate a proof-of-concept (PoC) cross-site request forgery (CSRF) attack for
            a given request.
        </p>
        <p>
            To access this function, select a URL or HTTP request anywhere within Burp, and choose "Generate CSRF PoC"
            within "Engagement tools" in the context menu.
        </p>
        <p>
            When you execute this function, Burp shows the full request you selected in the top panel, and the generated
            CSRF HTML in the lower panel. The HTML uses a form and/or JavaScript to generate the required request in the
            browser.
        </p>
        <p>
            You can edit the request manually, and click the "Regenerate" button to regenerate the CSRF HTML based on
            the updated request.
        </p>
        <p>
            You can test the effectiveness of the generated PoC in your browser, using the "Test in browser" button.
            When you select this option, Burp gives you a unique URL that you can paste into your browser (configured to
            use the current instance of Burp as its proxy). The resulting browser request is served by Burp with the
            currently displayed HTML, and you can then determine whether the PoC is effective by monitoring the
            resulting request(s) that are made through the Proxy.
        </p>
        <p>
            Some points should be noted regarding CSRF techniques:
        </p>
        <ul>
            <li>
                The cross-domain XmlHttpRequest (XHR) technique only works on modern HTML5-capable browsers that support
                cross-origin resource sharing (CORS). The technique has been tested on current versions of Firefox,
                Internet Explorer and Chrome. The browser must have JavaScript enabled. Note that with this technique,
                the application's response is not processed by the browser in the normal way, so it is not suitable for
                making cross-domain requests to deliver reflected cross-site scripting (XSS) attacks. Cross-domain XHR
                is subject to various restrictions which may prevent it from working with some request features. Burp
                will display a warning in the CSRF PoC generator if this is liable to occur.
            </li>
            <li>
                Some requests have bodies (e.g. XML or JSON) that can only be generated using either a form with plain
                text encoding, or a cross-domain XHR. In the former case, the resulting request will include the header
                "Content-Type: text/plain". In the latter case, the request can include any Content-Type header, but
                will only qualify as a "simple" cross-domain request (and so avoid the need for a pre-flight request
                which typically breaks the attack) if the Content-Type header has one of the standard values that may be
                specified for normal HTML forms. In some cases, although the message body exactly matches that required
                for the attack request, the application may reject the request due to an unexpected Content-Type header.
                Such CSRF-like conditions might not be practically exploitable. Burp will display a warning in the CSRF
                PoC generator if this is liable to occur.
            </li>
            <li>
                If you <a href="#csrf-poc-options">manually select</a> a CSRF technique that cannot be used to produce the
                required request, Burp will generate a best effort at a PoC and will display a warning.
            </li>
            <li>
                If the CSRF PoC generator is using plain text encoding, then the request body must contain an equals
                character in order for Burp to generate an HTML form which results in that exact body. If the original
                request does not contain an equals character, then you may be able to introduce one into a suitable
                position in the request, without affecting the server's processing of it.
            </li>
        </ul>
        <h2 id="csrf-poc-options">CSRF PoC options</h2>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>CRSF technique</strong> - This option lets you specify the type of CSRF technique to use in the
                HTML that generates the CSRF request. The "Auto" option is generally preferred, and causes Burp to
                select the most appropriate technique capable of generating the required request.
            </li>
            <li>
                <strong>Include auto-submit script</strong> - Using this option causes Burp to include a script in the
                HTML that causes a JavaScript-enabled browser to automatically issue the CSRF request when the page is
                loaded.
            </li>
        </ul>
    </div>
</section>
</body>
</html>