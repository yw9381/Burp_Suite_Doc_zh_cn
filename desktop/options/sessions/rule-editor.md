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
            <a href="rule-editor.html">Rule Editor</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Options: Session Handling Rule Editor</h1>
        <p>
            The session handling rule editor lets you configure all the details of a <a href="index.html#session-handling-rules">session handling rule</a>.
        </p>
        <h2 id="rule-description">Rule Description</h2>
        <p>
            This provides a free-form text field in which to describe the rule. The description will appear in the
            ordered table of configured rules.
        </p>
        <h2 id="rule-actions">Rule Actions</h2>
        <p>
            Each rule can specify one or more actions to be carried out. When the rule is applied, these actions will be
            performed in sequence, unless one action determines that no further actions should be applied to the
            request.
        </p>
        <div class="rounded-corner-box">
            <p>
                The following types of actions are available:
            </p>
            <ul class="link-list">
                <li>
                    <a href="#use-cookies-from-the-session-handling-cookie-jar">Add cookies from the session handling cookie jar.</a>
                </li>
                <li>
                    <a href="#set-a-specific-cookie-or-parameter-value">Set a specific cookie or parameter value.</a>
                </li>
                <li>
                    <a href="#check-session-is-valid">Check whether the current session is valid, and perform sub-actions
                    conditionally on the result.</a>
                </li>
                <li>
                    <a href="#prompt-for-in-browser-session-recovery">Prompt the user for in-browser session recovery.</a>
                </li>
                <li>
                    <a href="#run-a-macro">Run a macro.</a>
                </li>
                <li>
                    <a href="#run-a-post-request-macro">Run a post-request macro (this issues the current request, and then
                    executes a further macro).</a>
                </li>
                <li>
                    <a href="#invoke-a-burp-extension">Invoke a Burp extension.</a>
                </li>
            </ul>
        </div>
        <p>
            All of these actions are highly configurable, and can be combined in arbitrary ways to handle virtually any
            session handling mechanism. For example, being able to run arbitrary macros (defined request sequences), and
            update specified cookie and parameter values based on the result, allows you to automatically log back in to
            an application part way through an automated scan or Intruder attack. Being able to prompt for in-browser
            session recovery enables you to work with login mechanisms that involve keying a number from a physical
            token, or solving a CAPTCHA-style puzzle.
        </p>
        <h3 id="use-cookies-from-the-session-handling-cookie-jar">Use Cookies From the Session Handling Cookie Jar</h3>
        <p>
            This action updates the request with the relevant cookies from Burp's <a href="index.html#cookie-jar">cookie jar</a>. You can configure the action to update all cookies
            (optionally, with specific exclusions), or only to update certain specific cookies.
        </p>
        <h3 id="set-a-specific-cookie-or-parameter-value">Set a Specific Cookie or Parameter Value</h3>
        <p>
            This action updates the request and sets a specific value in a named parameter or cookie. If it is not
            already present, you can specify the type of parameter that should be added.
        </p>
        <h3 id="check-session-is-valid">Check Session Is Valid</h3>
        <p>
            This action checks whether the current session is valid, and if not, optionally performs a further action to
            obtain a new valid session.
        </p>
        <h4>Make request(s) to validate session</h4>
        <p>
            To determine the validity of the current session, Burp issues one or more requests. It can either:
        </p>
        <ul>
            <li>
                Issue the current request that is being processed by the rule.
            </li>
            <li>
                Run a <a href="index.html#macros">macro</a>.
            </li>
        </ul>
        <p>
            If the current request is issued, and the rule determines that the session is valid, then no further actions
            can be performed on the current request.
        </p>
        <p>
            Optionally, you can configure Burp to only validate the session every X requests. This is useful to avoid
            making superfluous requests in cases where the application only rarely invalidates your session.&nbsp;
        </p>
        <h4>Inspect responses to determine session validity</h4>
        <p>
            Having made the configured request(s), Burp examines the response to determine the validity of the session.
            If a macro was run, then Burp examines the response from the final request in the macro.
        </p>
        <p>
            To determine session validity, Burp checks whether or not the response contains a specified expression. Burp
            can be configured to search:
        </p>
        <ul>
            <li>
                HTTP response headers
            </li>
            <li>
                Response body
            </li>
            <li>
                The URL of any redirection target
            </li>
        </ul>
        <p>
            The search can be configured to use a literal string or a regular expression, and can be case sensitive or
            insensitive.
        </p>
        <h4>Define behavior dependent on session validity</h4>
        <p>
            You can configure how Burp behaves, dependent on the validity of the session.
        </p>
        <p>
            If the session is valid, you can specify that Burp should not process any further rules or actions for the
            current request. This option is mandatory if Burp is configured to validate the session by issuing the
            current request.
        </p>
        <p>
            If the session is invalid, you can specify that Burp should perform one of the following actions, to obtain
            a new valid session:
        </p>
        <ul>
            <li>
                <a href="#run-a-macro">Run a macro</a>
            </li>
            <li>
                <a href="#prompt-for-in-browser-session-recovery">Prompt for in-browser session recovery</a>
            </li>
        </ul>
        <h3 id="prompt-for-in-browser-session-recovery">Prompt For In-Browser Session Recovery</h3>
        <p>
            This action causes Burp to prompt you to recover a valid session using your browser. The browser must be
            configured to use the same instance of Burp as its proxy, so that Burp can monitor your browser's requests,
            and any new cookies that are set.
        </p>
        <p>
            The cookies set by the application will be added to Burp's session handling cookie jar, and optionally can
            be updated in the current request. You can configure the action to update all cookies (optionally, with
            specific exclusions), or only to update certain specific cookies.
        </p>
        <h3 id="run-a-macro">Run a Macro</h3>
        <p>
            This action runs a predefined macro (sequence of requests). Macros are <a href="index.html#macros">defined separately</a> within Burp's session options, and are
            available to be used within session handling rules.
        </p>
        <p>
            After running the macro, Burp can optionally update parameters and cookies in the request currently being
            processed, based on the final macro response.
        </p>
        <p>
            Parameters in the current request can be updated using values derived from the final macro response. The
            derivation of parameter values works in the same way as for <a href="macro-editor.html#parameter-handling">macro parameters</a> generally. For derived
            parameters, the following options are available:
        </p>
        <ul>
            <li>
                URL-encode matched parameter values. This option is required for most types of request parameter.
            </li>
            <li>
                Tolerate URL mismatch when matching parameters. Normally, when deriving parameters from a prior
                response, Burp requires both the parameter name and URL that is inferred from the response to match the
                parameter name and URL in the subsequent request. Using this option lets you tell Burp to tolerate a
                mismatch in the URL. This option is useful if the application employs CSRF tokens that are URL agnostic
                - that is, which can be obtained from one location in the application and reused in another. Using this
                option can considerably simplify the required session handling rules by letting you define a rule which
                runs on any request containing the CSRF token parameter, and which runs a single macro to obtain a new
                token from a fixed location.
            </li>
        </ul>
        <p>
            For both parameters and cookies derived from the macro, you can configure the action to update all items in
            the current request (optionally, with specific exclusions), or only to update certain specific items.
        </p>
        <h3 id="run-a-post-request-macro">Run a Post-Request Macro</h3>
        <p>
            This action issues the request that is currently being processed, and then runs a further macro (sequence of
            requests). Macros are <a href="index.html#macros">defined separately</a> within Burp's session
            options, and are available to be used within session handling rules. After this action has been performed,
            no further rules or actions will be carried out on the request that is currently being processed.
        </p>
        <p>
            Post-request macros are useful if the request you are testing appears within a multi-stage process, and you
            need to step through the remaining stages to update the application's state and determine the effects of the
            request you are targeting.
        </p>
        <p>
            After issuing the current request, Burp can optionally update parameters in the first macro request, based
            on the response to the current request. The derivation of parameter values works in the same way as for <a href="macro-editor.html#parameter-handling"> macro parameters</a> generally. You can
            configure the action to update all parameters in the first macro request (optionally, with specific
            exclusions), or only to update certain specific parameters.
        </p>
        <p>
            You can configure the action to pass back to the invoking tool either the response from the current request,
            issued prior to executing the macro, or the final response from the macro. The latter option is useful in
            cases where you are scanning or fuzzing input at one step in a multi-stage process, and any resulting error
            message is displayed at a later step in that process.
        </p>
        <h3 id="invoke-a-burp-extension">Invoke a Burp Extension</h3>
        <p>
            This action invokes a <a href="../../tools/extender.html">Burp extension</a> to process the current request. The
            extension must have registered a session handling action handler. You can select the required handler from
            the list of available handlers that have been registered by currently loaded extensions.
        </p>
        <h2 id="tools-scope">Tools Scope</h2>
        <p>
            You can specify which Burp tools each rule should be applied to. A rule will only be processed for requests
            made by tools that are included in the tools scope.
        </p>
        <h2 id="url-scope">URL Scope</h2>
        <p>
            You can specify which URLs each rule should be applied to. You can include all URLs (useful for a generic
            rule to use cookies from Burp's cookie jar), or use the suite-wide <a href="../../tools/target/scope.html"> target
            scope</a> (useful for an application-wide rule, such as to validate the current session), or to use a
            specific custom scope (useful for a rule affecting a single request).
        </p>
        <p>
            For more details, see help on <a href="../../functions/url-matching.html"> configuring URL scope</a>.
        </p>
        <h2 id="parameter-scope">Parameter Scope</h2>
        <p>
            You can optionally specify that the rules should only apply to requests containing specific named
            parameters. For example, this setting is useful for an application-wide rule affecting all requests
            containing a certain parameter that needs to be updated, such as a CSRF token.
        </p>
    </div>
</section>
</body>
</html>