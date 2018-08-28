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
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Options: Sessions</h1>
        <p>
            This tab contains settings for <a href="#session-handling-rules"> session handling rules</a>, the <a href="#cookie-jar">cookie jar</a>, and <a href="#macros"> macros</a>.
        </p>
        <p>
            <strong>Note:</strong> Burp Scanner automatically handles sessions during crawling and crawl-driven auditing. Session handling rules will not be applied to requests made by these kind of scans.
        </p>
        <h2 id="session-handling-challenges">Session Handling Challenges</h2>
        <p>
            When performing any kind of testing of web applications, you may encounter challenges relating to session
            handling and state. For example:
        </p>
        <ul>
            <li>
                The application may terminate the session being used for testing, either defensively or for other
                reasons, so that subsequent requests are ineffective until the session is restored.
            </li>
            <li>
                Some functions may use changing tokens that must be supplied with each request (for example, to hinder
                request forgery attacks).
            </li>
            <li>
                Some functions may require a series of other requests to be made before the request being tested, to get
                the application into a suitable state for it to accept the request being tested.
            </li>
        </ul>
        <p>
            These challenges may arise when carrying out automated testing tasks, such as fuzzing or scanning, and may
            also arise when you are testing manually.
        </p>
        <p>
            Burp's session handling functionality contains a range of features to help in all of these situations,
            letting you continue your manual and automated testing while Burp takes care of the problems for you in the
            background.
        </p>
        <h2 id="session-handling-rules">Session Handling Rules</h2>
        <p>
            Burp lets you define a list of session handling rules, giving you very fine-grained control over how Burp
            deals with an application's session handling mechanism and related functionality.
        </p>
        <p>
            Each rule comprises a scope (what the rule applies to) and actions (what the rule does). For every outgoing
            request that Burp makes, it determines which of the defined rules are in-scope for the request, and performs
            all of those rules' actions in order (unless a condition-checking action determines that no further actions
            should be applied to the request).
        </p>
        <p>
            The scope for each rule can be defined based on any or all of the following features of the request being
            processed:
        </p>
        <ul>
            <li>
                The Burp <a href="rule-editor.html#tools-scope">tool</a> that is making the request.
            </li>
            <li>
                The <a href="rule-editor.html#url-scope">URL</a> of the request.
            </li>
            <li>
                The names of <a href="rule-editor.html#parameter-scope">parameters</a> within the request.
            </li>
        </ul>
        <p>
            Each rule can perform one or more <a href="rule-editor.html#rule-actions">actions</a>, such as:
        </p>
        <ul>
            <li>
                Updating cookies from Burp's cookie jar.
            </li>
            <li>
                Validating the current session.
            </li>
            <li>
                Running a macro (predefined sequence of requests).
            </li>
        </ul>
        <p>
            By creating multiple rules with different scopes and actions, you can define a hierarchy of behavior that
            Burp will apply to different applications and functions. For example, on a particular test you could define
            the following rules:
        </p>
        <ul>
            <li>
                For all requests, add cookies from Burp's cookie jar.
            </li>
            <li>
                For requests to a specific domain, validate that the current session with that application is still
                active, and if not, run a macro to log back in to the application, and update the cookie jar with the
                resulting session token.
            </li>
            <li>
                For requests to a specific URL containing the
                <span class="InlineCode">__csrftoken</span>
                parameter, first run a macro to obtain a valid
                <span class="InlineCode">__csrftoken</span>
                value, and use this when making the request.
            </li>
        </ul>
        <p>
            For more details of configuring session handling rules, see the <a href="rule-editor.html"> Session handling rule editor</a> help.
        </p>
        <h3 id="session-handling-tracer">Session Handling Tracer</h3>
        <p>
            The configuration needed to apply Burp's session handling functionality to the features of real-world
            applications is often complex, and mistakes are easily made. You can use the session handling tracer to
            assist with troubleshooting your session handling configuration.
        </p>
        <p>
            The tracer shows a listing of every request that has been handled by the session handling functionality
            (that is, where at least one session rule has been applied). For each handled request, the tracer shows the
            sequence of rules and actions that were carried out, and the changes made to the current request at each
            step in the sequence.&nbsp;
        </p>
        <p>
            Note that the session handling tracer imposes a processing and storage overhead on all affected HTTP
            requests. You should only use the tracer when troubleshooting issues with session handling rules, and should
            not leave it running generally.
        </p>
        <h2 id="cookie-jar">Cookie Jar</h2>
        <p>
            Burp maintains a cookie jar that stores all of the cookies issued by web sites you visit. The cookie jar is
            shared between all of Burp's tools.
        </p>
        <p>
            You can configure which tools the cookie jar should monitor in order to update cookies. By default, the
            cookie jar is updated based on traffic from the Proxy and Spider tools. Burp monitors responses received by
            the configured tools, and updates the cookie jar with any new cookies that are set. In the case of the
            Proxy, incoming requests from the browser are also inspected. This is useful where an application has
            previously set a persistent cookie which is present in your browser, and which is required for proper
            handling of your session. Having Burp update its cookie jar based on requests through the Proxy means that
            all the necessary cookies will be added to the cookie jar even if the application does not update the value
            of this cookie during your current visit.
        </p>
        <p>
            You can also view the contents of the cookie jar and edit cookies manually, using the "Open cookie jar"
            button.
        </p>
        <p>
            The cookie jar can be used by <a href="#session-handling-rules"> session handling rules</a> and <a href="#macros">macros</a> to automatically update outgoing requests with cookies from the cookie jar.
        </p>
        <p>
            The cookie jar honors the domain and path scope of cookies, in a way that mimics Internet Explorer's
            interpretation of cookie handling specifications.
        </p>
        <h2 id="macros">Macros</h2>
        <p>
            A macro is a predefined sequence of one or more requests. You can use macros within <a href="#session-handling-rules">session
            handling rules</a> to perform various tasks. Typical use cases for macros include:
        </p>
        <ul>
            <li>
                Fetching a page of the application (such as the user's home page) to check that the current session is
                still valid.
            </li>
            <li>
                Performing a login to obtain a new valid session.
            </li>
            <li>
                Obtaining a token or nonce to use as a parameter in another request.
            </li>
            <li>
                When scanning or fuzzing a request in a multi-step process, performing the necessary preceding requests,
                to get the application into a state where the targeted request will be accepted.
            </li>
            <li>
                In a multi-step process, after the "attack" request, completing the remaining steps of the process, to
                confirm the action being performed, or obtain the result or error message from the conclusion of that
                process.
            </li>
        </ul>
        <p>
            As well as the basic sequence of requests, each macro includes some important configuration about how
            cookies and parameters in the sequence should be handled, and any interdependencies between items.
        </p>
        <p>
            For more details of configuring macros, see the <a href="macro-editor.html"> Macro
            editor</a> help.
        </p>
        <h2 id="integration-with-burp-tools">Integration With Burp Tools</h2>
        <p>
            Burp's session handling features interact with Burp's other functionality in some important ways:
        </p>
        <ul>
            <li>
                There is a default session handling rule that updates requests made by the Scanner with
                cookies from Burp's cookie jar, except when the Scanner is managing its own sessions (during crawling and crawl-driven auditing). If this is not the behavior you
                require, you should disable the default session handling rule before performing any scanning.
            </li>
            <li>
                In cases where session handling rules modify a request before it is made (for example, to update a
                cookie or other parameter), some of Burp's tools will show the final, updated request, for purposes of
                clarity. This applies to the Intruder, Repeater and Spider tools. Requests that are shown within
                reported Scanner issues continue to show the original request, to facilitate clear comparison with the
                base request, where necessary. To observe the final request for a scan issue, as modified by the session
                handler, you can send the request to Burp Repeater and issue it there (provided you have the same
                session handling rules enabled for Repeater as for Scanner).
            </li>
            <li>
                When the Scanner or Intruder makes a request that manipulates a cookie or parameter that is affected by
                a session handling action, the action is not applied to that request, to avoid interfering with the test
                that is being performed. For example, if you are using Intruder to fuzz all the parameters in a request,
                and you have configured a session handing rule to update the "sessid" cookie in that request, then the
                "sessid" cookie will be updated when Intruder is fuzzing other parameters. When Intruder is fuzzing the
                "sessid" cookie itself, Burp will send the Intruder payload string as the "sessid" value, and the
                session handling rule will not update the cookie as is done normally.
            </li>
        </ul>
    </div>
</section>
</body>
</html>