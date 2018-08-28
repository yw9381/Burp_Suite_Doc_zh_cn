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
            <a href="../index.html">Options</a>
        </li>
        <li>
            <a href="index.html">Sessions</a>
        </li>
        <li>
            <a href="macro-editor.html">Macro Editor</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Options: Macro Editor</h1>
        <p>
            The macro editor lets you configure all the details of a <a href="index.html#macros">macro</a>.
        </p>
        <h2 id="record-macro">Record Macro</h2>
        <p>
            Macros are recorded using your browser, which must be <a href="../../getting-started/projects.html">configured</a> to use the current instance of Burp as its proxy
            server.
        </p>
        <p>
            When recording a macro, Burp displays a view of the <a href="../../tools/proxy/history.html">Proxy history</a>, from
            which you can select the requests to be used for the macro. You can select from previously made requests, or
            record the macro afresh and select the new items from the history. Note that to record a new macro using
            your browser you will need to turn off <a href="../../tools/proxy/intercept.html">Proxy interception</a>.
        </p>
        <p>
            When you have selected the items you wish to include in the macro, click "OK", and the items are shown in
            the macro editor.
        </p>
        <h2 id="configuring-macro-items">Configuring Macro Items</h2>
        <p>
            The macro editor displays the list of items in the macro. You can modify these by changing the order,
            removing items, or re-recording the macro. You can modify any individual request by selecting it in the
            list, and editing it directly in in the request viewer.
        </p>
        <p>
            As well as the basic sequence of requests, each macro includes some important configuration about how items
            in the sequence should be handled, and any interdependencies between items. To edit the configuration of a
            macro item, select it in the list and click the "Configure item" button.
        </p>
        <h3 id="cookie-handling">Cookie Handling</h3>
        <p>
            You can configure:
        </p>
        <ul>
            <li>
                Whether cookies received in the response should be added to the session handling cookie jar.
            </li>
            <li>
                Whether cookies from the session handling cookie jar should be added to the request.
            </li>
        </ul>
        <h3 id="parameter-handling">Parameter Handling</h3>
        <p>
            For each parameter in the request, you can configure whether it should be assigned a fixed preset value, or
            a value derived from a previous response in the macro.
        </p>
        <p>
            The ability to derive a request parameter's value from a previous response in the macro is particularly
            useful in some multi-stage processes, and in situations where applications make aggressive use of CSRF
            tokens. Parameter derivation is based on the parameter name, and the URL being requested. If you specify
            that a parameter's value should be derived from a previous response, Burp will examine that response for any
            source of the named parameter being submitted to the relevant URL (for example, a form using the given
            action URL, and containing a field with the given name). If found, Burp will extract the parameter's value
            from that response, and update it in the request being processed.
        </p>
        <p>
            When a new macro is defined, Burp tries to automatically find any relationships of this kind, by identifying
            parameters whose values can be determined from the preceding response (form field values, redirection
            targets, query strings in links, etc.). You can manually override the automatic analysis as required.
        </p>
        <h3 id="custom-parameter-locations-in-response">Custom Parameter Locations In Response</h3>
        <p>
            Burp's matching of parameters between macro items works automatically for known "normal" parameter locations
            within responses, such as form field values, and query strings in links. In some cases, you need more
            flexibility than this, and the ability to specify an arbitrary location within a response as containing a
            parameter. For example, an application might define a CSRF token within a JavaScript string, and dynamically
            add this to a script-generated request. To create a macro capable of deriving this parameter, you will need
            to tell Burp the location of the parameter within the response containing the script, and the name used for
            that parameter in subsequent requests.
        </p>
        <p>
            Use the "Define custom parameter" dialog to specify the name of the custom parameter, its location within
            the response item being configured, and whether the value extracted from the response is URL-encoded. This
            is done using the <a href="../../functions/response-extraction.html"> response extraction rule dialog</a>.
            When this has been done, the named parameter will be available for use in subsequent macro requests (or the
            request being processed by a <a href="index.html#session-handling-rules">session handling rule</a>) in the
            normal way as described in <a href="#parameter-handling"> Parameter Handling</a>.
        </p>
        <p>
            It is important to configure whether the value extracted from the response is URL-encoded. This ensures that
            Burp can correctly encode the value when it is used in subsequent requests, reflecting whether the context
            into which it is being placed needs to be URL-encoded.
        </p>
        <h2 id="re-analyze-macro">Re-Analyze Macro</h2>
        <p>
            When a new macro is defined, Burp tries to automatically find any relationships between macro items, by
            identifying parameters whose values can be determined from the preceding response. If you have manually
            modified the items in the macro, you can repeat the automatic analysis using the "Re-analyze macro"
            button.
        </p>
        <h2 id="test-macro">Test Macro</h2>
        <p>
            When you have configured a macro, including any derivations of request parameters from earlier responses,
            you can use the "Test macro" feature to verify that the configuration is working as intended. This will
            issue the macro requests in sequence, and attempt to derive any parameter values according to your
            configuration. Burp will display all requests and responses, the values of any cookies received, and the
            details of any parameters whose values it succeeded or failed to derive.
        </p>
    </div>
</section>
</body>
</html>