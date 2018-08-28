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
            <a href="index.html">Scanning Web Sites</a>
        </li>
        <li>
            <a href="audit-options.html">Audit Options</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Audit Options</h1>
        <p>
            Numerous options are available to configure the behavior of Burp Scanner during audit scans. These can be configured on-the-fly when <a href="../scanning/scan-launcher.html">launching a scan</a>, or can be maintained in Burp's <a href="../getting-started/configuration.html#configuration-library">configuration library</a>.
        </p>
<h2 id="audit-optimization">Audit Optimization</h2>
        <p>
            These settings let you tune the behavior of the audit logic to reflect the objectives of the audit and the nature of the target application.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Audit speed</strong> - This option determines how thorough certain audit checks will be when
                checking for vulnerabilities. The "Fast" setting makes fewer requests, and checks for fewer derivations
                of some vulnerabilities. The "Thorough" setting makes many more requests and checks for more derivative
                types of vulnerabilities. The "Normal" setting is mid-way between the two, and represents a suitable
                trade-off between speed and thoroughness for many applications.
            </li>
            <li>
                <strong>Audit accuracy</strong> - This option determines the amount of evidence that the Scanner will
                require before reporting certain types of vulnerabilities. Some issues can only be detected using
                "blind" techniques, in which Burp infers the probable existence of a vulnerability based on some
                observed behavior, such as a time delay or a differential response. Because these observed behaviors can
                occur anyway, in the absence of the associated vulnerability, the techniques are inherently more prone
                to false positives than other techniques, such as the observation of error messages. To attempt to
                reduce false positives, Burp repeats certain tests a number of times when a putative issue is inferred,
                to try to establish a reliable correlation between submitted inputs and observed behaviors. The
                accuracy option is used to control how many times Burp will retry these tests. The "Minimize false
                negatives" setting performs fewer retries, and so is more likely to report false positive issues, but is
                also less likely to miss genuine issues due to inconsistent application behavior. The "Minimize false
                positives" setting performs many more retries, and so is less likely to report false positive issues,
                but may as a result wrongly miss some genuine issues, because some of the retry requests might just
                happen to fail to return the result being tested for. The "Normal" setting is mid-way between the two,
                and represents a suitable trade-off between false positive and false negative issues for many
                applications.
            </li>
            <li>
                <strong>Skip checks unlikely to be effective due to insertion point&#39;s base value</strong> - This option makes scans more efficient by omitting
                checks that appear irrelevant given the base value of the parameter at each insertion point. For
                example, if a parameter&#39;s value contains characters that do not normally appear in filenames, Burp
                will skip file path traversal checks for this parameter. Using this option can speed up your scans, with
                a relatively low risk of missing actual vulnerabilities that exist.
            </li>
            <li>
                <strong>Conslidate frequently occurring passive issues</strong> - This option controls whether Burp will <a href="../../scanner/auditing.html#consolidation-of-frequently-occurring-passive-issues">consolidate frequently occurring passive issues</a>. Using this option considerably reduces noise when the same issue (such as Clickjacking) appears in many locations or even throughout an entire application.
            </li>
            <li>
                <strong>Automatically maintain session</strong> - This option controls whether Burp will <a href="../../scanner/auditing.html#automatic-session-handling">automatically maintain session</a> during the audit phase of the scan. This is only applicable to crawl-driven audits where the navigational pathways identified during the crawl phase can be used to maintain session during the audit phase. In modern applications, it is normally essential to maintain session to achieve good audit coverage. However, there is an overhead to maintaining session in terms of numbers of requests made, and you can disable this option if you know it is not necessary.
            </li>
            <li>
                <strong>Follow redirections where necessary</strong> -&nbsp; Some vulnerabilities can only be detected
                by following redirections (for example, cross-site scripting in an error message which is only returned
                after following a redirection). Because some applications issue redirections to third-party URLs that
                include parameter values that you have submitted, Burp protects you against inadvertently attacking
                third-party applications, by not following just any redirection which is received. If the request being
                scanned is within the defined <a href="../tools/target/scope.html">target scope</a> (i.e. you are using target
                scope to control what gets scanned), then Burp will only follow redirections that are within that same
                scope. If the request being scanned is not in scope (i.e. you have manually initiated a scan of an
                out-of-scope request), Burp will only follow redirections which (a) are to the same host/port as the
                request being scanned; and (b) are not explicitly covered by a suite-wide scope exclusion rule (e.g.
                "logout.aspx").
            </li>
        </ul>
        <h2 id="issues-reported">Issues Reported</h2>
        <p>
            These settings control which <a href="https://portswigger.net/kb/issues">issues</a> Burp will check for.
        </p>
        <p>
            You
            can select issue types individually, or according to the nature of the <a href="../../scanner/auditing.html#issue-types">audit activity</a> that is involved in detecting them. If you select individual issues, you can also select the detection methods that are used for some types of
            issues. Use the context menu on relevant issue types, and choose "Edit detection methods".
        </p>
        <p>
            Each check that is performed increases the number of requests made, and the overall time of the audit. You
            can turn individual issues on or off based on your knowledge of an application's technologies. For example,
            if you know that an application does not use any LDAP, you can turn off LDAP injection. Or if you know which
            back-end database the application uses, you can turn off SQL injection detection methods that are specific
            to other database types.
        </p>
        <p>
            <strong>Note:</strong> if any issues are enabled that are labelled "active", then Burp Scanner will send requests to the application designed to detect those issues. Depending on the issues selected, these requests might be reasonably viewed as malicious or might damage the application or its data.
        </p>
        <h2 id="handling-application-errors-during-audit">Handling Application Errors during audit</h2>
        <p>
            These settings control how Burp Scanner <a href="../../scanner/auditing.html#handling-application-errors">handles application errors</a> (connection failures and transmission timeouts) that arise during the audit phase of the scan.
        </p>
        <p>
            You can configure the following options:
        </p>
        <ul>
            
            <li>
                The number of consecutive failed audit checks before skipping the remaining checks in the current insertion point.
            </li>
            <li>
                The number of consecutive failed insertion points before skipping the remaining insertion points and flagging the audit item as failed.
            </li>
            
            <li>
                The number of consecutive failed audit items, or the overall percentage of failed audit items, before pausing the task.
            </li>
            <li>
                The number of follow-up passes that are performed on completion of each audit phase, to retry failed operations.
            </li>
        </ul>
		<p>You can leave any setting blank to disable it.</p>
        <h2 id="insertion-point-types">Insertion Point Types</h2>
        <p>
            These settings control how the Scanner places <a href="../../scanner/auditing.html#insertion-points">insertion points</a> into each HTTP request that is audited.
        </p>
        <p>
            Burp Scanner gives you fine-grained control over the placement of insertion points, and careful configuration of
            these options will let you tailor the audit to the nature of the application you are targeting. The
            configuration of insertion points also represents a trade-off between the speed and comprehensiveness of
            your scans.
        </p>
        <p>
            The following categories of insertion point can be selected:
        </p>
<ul>
            <li>
                <strong>URL parameter values</strong> - Standard parameter values within the URL query string.
            </li>
            <li>
                <strong>Body parameter values</strong> - Parameter values in the message body, including standard
                form-generated parameters, attributes of multipart-encoded parameters such as uploaded file names, XML
                parameter values and attributes, and JSON values.
            </li>
            <li>
                <strong>Cookie values</strong> - The values of HTTP cookies.
            </li>
            <li>
                <strong>Parameter name</strong> - The name of an arbitrarily added parameter. A URL parameter is always
                added, and a body parameter is also added to POST requests. Testing an added parameter name can often
                detect unusual bugs that are missed if only parameter values are tested.
            </li>
            <li>
                <strong>HTTP headers</strong> - The values of the Referer and User-Agent headers. Testing these
                insertion points can often detect issues like SQL injection or persistent XSS within logging
                functionality.
            </li>
            <li>
                <strong>Entire body</strong> - The whole of the request body. This applies
                to requests with XML or JSON content in the request body.
            </li>
            <li>
                <strong>URL path filename</strong> - The value of the filename part of the URL path (after the final
                path folder and before the query string).
            </li>
            <li>
                <strong>URL path folders</strong> - The values of all folder tokens within the URL path (before the
                filename part).
            </li>
</ul>
<p>
    <strong>Note:</strong> As well as letting Burp automatically assign insertion points, it is possible to
    fully customize these, so you can specify arbitrary locations within a request where attacks should be
    placed. To use this function, send the request to Intruder, use the <a href="../tools/intruder/positions.html">payload
        positions</a> tab to define the start and end of each insertion point in the usual way, and select the
    Intruder menu option &quot;Audit defined insertion points&quot;. You can also specify custom
    insertion point locations programmatically using <a href="../tools/extender.html">Burp Extender</a>.
</p>
<h2 id="modifying-parameter-locations-options">Modifying parameter locations options</h2>
<p>
    These settings let you configure the Scanner to <a href="../../scanner/auditing.html#modifying-parameter-locations">move parameters</a> to other locations within
        the request, in addition to testing them in their original position. For example, you can move each URL
    parameter into the message body and retest it there. Or you can move each body parameter into a cookie and
    retest it there.
</p>
<p>
            Moving parameters in this way can often bypass defensive filters. Many applications and application
            firewalls perform per-parameter input validation assuming that each parameter is in its expected location
            within the request. Moving the parameter to a different location can evade this validation. When the
            application code later retrieves the parameter to implement its main logic, it may do so using an API that
            is agnostic as to the parameter's location. If so, then moving the parameter may enable you to reach
            vulnerable code paths using input that would normally be filtered before being processed.
        </p>
        <p>
            The following options are available for changing parameter locations:
        </p>
        <ul>
            <li>
                URL to body
            </li>
            <li>
                URL to cookie
            </li>
            <li>
                Body to URL
            </li>
            <li>
                Body to cookie
            </li>
            <li>
                Cookie to URL
            </li>
            <li>
                Cookie to body
            </li>
        </ul>
        <p>
            Note that changing parameter locations results in many more scan requests, because each request parameter is
            effectively scanned multiple times.
        </p>
        <h2 id="ignored-insertion-points">Ignored insertion points</h2>
        <p>
            These settings let you specify request parameters for which Burp Scanner should skip certain audit checks. There are
            separate lists for skipping server-side injection checks (such as SQL injection) and for skipping all
            checks.
        </p>
        <p>
            Server-side injection checks are relatively time-consuming, because Burp sends multiple requests probing for
            various blind vulnerabilities on the server. If you believe that certain parameters appearing within
            requests are not vulnerable (for example, built-in parameters used only by the platform or web server), you
            can tell Burp not to test these. (Testing for client-side bugs like cross-site scripting involve much less
            overhead because testing each parameter imposes minimal overhead on the duration of the scan if the
            parameter is not vulnerable.)
        </p>
        <p>
            Skipping all checks may be useful if a parameter is handled by an application component that you do not wish
            to test, or if modifying a parameter is known to cause application instability.
        </p>
        <p>
            Each item in the list specifies the parameter type, the item to be matched (name or value), the match type
            (literal string or regex), and the expression to match.
        </p>
        <p>
            You can identify parameters within URL path folders by their position (slash-delimited) within the URL path.
            To do this, select &quot;URL path folder&quot; from the parameter drop-down, &quot;name&quot; from the item
            drop-down, and specify the index number (1-based) of the position within the URL path that you wish to
            exclude from testing. You can also specify URL path folder parameters by value.
        </p>
        <h2 id="frequently-occurring-insertion-points">Frequently occurring insertion points</h2>
        <p>
            These settings let you configure whether Burp Scanner will avoid duplication in <a href="../../scanner/auditing.html#handling-of-frequently-occurring-insertion-points">frequently occuring insertion points</a>. If configured, Burp will identify insertion points that have proven to be uninteresting (occurring frequently without any issues generated) and will drop to performing a more lightweight audit of those insertion points.
        </p>
        <p>
            You can select which insertion point types this optimization is applied to.
        </p>
        <h2 id="misc-insertion-point-options">Misc insertion point options</h2>
        <p>
            You can select whether to use <a href="../../scanner/auditing.html#nested-insertion-points">nested insertion points</a>. Nested insertion points are used when an insertion point's base value contains data in a recognized format.
            For example, a URL parameter might contain Base64-encoded data, and the decoded value might in turn contain
            JSON or XML data. With the option to use nested insertion points enabled, Burp will create suitable
            insertion points for each separate item of input at each level of nesting. Using this option imposes no overhead when scanning requests containing only conventional request
            parameters, but enables Burp to reach more of the attack surface of complex applications where data is
            encapsulated within different formats.
        </p>
<p>
            You can configure whether to set a limit on the number of insertion points that will be generated for each base
            request, thereby preventing your scans from becoming stalled if they encounter requests containing huge
            numbers of parameters. In cases where the number of insertion points is curtailed by this limit, the item&#39;s
            entry in the <a href="audit-items.html">audit items view</a> will indicate the number of insertion points
            that were skipped, enabling you to manually review the base request and decide if it is worth performing a
            full scan of all its possible insertion points.
        </p>
        <h2 id="javascript-analysis-options">JavaScript analysis options</h2>
        <p>
            These settings control how Burp Scanner detects DOM-based vulnerabilities in JavaScript. The following options are available:
        </p>
        <ul>
            <li>
                Whether to make HTTP requests for any missing JavaScript dependencies.
            </li>
            <li>
                Whether to use <a href="../../scanner/auditing.html#javascript-analysis">static or dynamic techniques</a> or both. Note that you can also configure per individual issue type whether to use static or dynamic techniques by editing the enabled <a href="#issues-reported">detection methods</a> for DOM-based issues. These settings allow you to globally disable static or dynamic techniques for all JavaScript analysis.
            </li>
            <li>
                The maximum time that Burp will spend on static analysis for each individual item that is scanned. This setting can be useful if Burp encounters items containing very large or complex scripts, which may cause the static analysis engine to consume excessive system resources. If the analysis of a particular item is truncated because the maximum time was reached, then Burp shows an alert identifying the item affected. You can specify zero or a blank value to indicate that no limit should be applied.
            </li>
        </ul>
        <div class="rounded-corner-box">
            <p>
                <strong>Note:</strong> JavaScript analysis can consume large amounts of memory and processing, and so it may
                be desirable to restrict the analysis to key targets of interest. Additionally, it may be necessary
                to <a href="../getting-started/index.html#launching-burp">launch Burp</a> with greater amounts of memory when
                performing JavaScript analysis.
            </p>
        </div>
</div>
</section>
</body>
</html>