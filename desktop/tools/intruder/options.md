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
            <a href="../index.html">Tools</a>
        </li>
        <li>
            <a href="index.html">Intruder</a>
        </li>
        <li>
            <a href="options.html">Options</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Attack Options</h1>
        <p>
            This tab contains Intruder attack options for <a href="#attack-request-headers">request headers</a>, the <a href="#request-engine">request engine</a>, <a href="#attack-results-options"> attack results</a>, <a href="#grep-match">grep
            match</a>, <a href="#grep-extract">grep extract</a>, <a href="#grep-payloads"> grep payloads</a>, and <a href="#handling-redirections-during-attacks">redirections</a>. You can edit these options in the main Intruder UI before launching
            an attack, and most settings can also be modified in the attack window when the attack is already running.
        </p>
        <h2 id="attack-request-headers">Attack request headers</h2>
        <p>
            These settings control whether Intruder updates the configured request headers during attacks. Note that you
            have full control over the request headers via the request template in the <a href="positions.html">payload positions</a> tab. These options can be used to update those
            headers per-request in ways that are normally helpful.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Update Content-Length header</strong> - This option causes Intruder to add or update the
                Content-Length header in each request, with the correct value for the length of the HTTP body of that
                particular request. This feature is usually essential for attacks that insert variable-length payloads
                into the body of the template HTTP request. If the correct value is not specified, then the target
                server may return an error, may respond to an incomplete request, or may wait indefinitely for further
                data to be received in the request.
            </li>
            <li>
                <strong>Set Connection: close</strong> - This option causes Intruder to add or update the Connection
                header with the value "close". In some cases (when the server does not itself return a valid
                Content-Length or Transfer-Encoding header), this option may allow attacks to be performed more quickly.
            </li>
        </ul>
        <h2 id="request-engine">Request Engine</h2>
        <p>
            These settings control the engine used for making HTTP requests in the Intruder attack. The following
            options are available:
        </p>
        <ul>
            <li>
                <span class="pro-edition-feature-label">Professional</span>
                <strong>Number of threads</strong> - This option controls the number of concurrent requests the attack
                is able to make.
            </li>
            <li>
                <strong>Number of retries on network failure</strong> - If a connection error or other network problem
                occurs, Burp will retry the request the specified number of times before giving up and moving on.
                Intermittent network failures are common when testing, so it is best to retry the request several times
                when a failure occurs.
            </li>
            <li>
                <strong>Pause before retry</strong> - When retrying a failed request, Burp will wait the specified time
                (in milliseconds) following the failure before retrying. If the server is being overwhelmed with
                traffic, or an intermittent problem is occurring, it is best to wait a short time before retrying.
            </li>
            <li>
                <strong>Throttle between requests</strong> - Optionally, Burp can wait a specified delay (in
                milliseconds) before every request. This option is useful to avoid overloading the application, or to be
                more stealthy. Alternatively, you can configure a variable delay (with a given start value and
                increment). This option can be useful to test the session timeout interval enforced by the application.
            </li>
            <li>
                <strong>Start time</strong> - This option lets you configure the attack to start immediately, or after a
                specified delay, or to start in a paused state. These alternatives can be useful if an attack is being
                configured which will be executed at some future point, or saved for future use.
            </li>
        </ul>
        <p>
            Careful use of these options lets you fine tune the attack engine, depending on the performance impact on
            the application, and on your own processing power and bandwidth. If you find that the attack is running
            slowly, but the application is performing well and your own CPU utilization is low, you can increase the
            number of threads to make your attack proceed faster. If you find that connection errors are occurring, that
            the application is slowing down, or that your own computer is locking up, you should reduce the thread
            count, and maybe increase the number of retries on network failure and the pause between retries.
        </p>
        <h2 id="attack-results-options">Attack results options</h2>
        <p>
            These settings control what information is captured in the <a href="attacks.html#attack-results"> attack
            results</a>. The following options are available:
        </p>
        <ul>
            <li>
                <strong>Store requests / responses</strong> - These options determine whether the attack will save the
                contents of individual requests and responses. Saving requests and responses consumes disk space in your
                temporary directory, but enables you to view these in full during an attack, repeat individual requests
                if necessary, and send them to other Burp tools.
            </li>
            <li>
                <strong>Make unmodified baseline request</strong> - If this option is selected, then in addition to the
                configured attack requests, Burp will issue the template request with all payload positions set to their
                base values. This request will show as item #0 in the results table. Using this option is useful to
                provide a base response against which to compare the attack responses.
            </li>
            <li>
                <strong>Use denial-of-service mode</strong> - If this option is selected, then the attack will issue
                requests as normal but will not wait to process any responses received from the server. As soon as each
                request is issued, the TCP connection will be closed. This function can be used to perform
                application-layer denial-of-service attacks against vulnerable applications, by repeatedly sending
                requests that initiate high-workload tasks on the server, while avoiding locking up local resources by
                holding sockets open waiting for the server to respond.
            </li>
            <li>
                <strong>Store full payloads</strong> - If this option is selected, Burp will store the full payload
                values for each result. This option consumes additional memory but may be required if you want to
                perform certain actions at runtime, such as modifying <a href="#grep-payloads">payload grep</a> settings,
                or reissuing requests with a modified request template.
            </li>
        </ul>
        <h2 id="grep-match">Grep - Match</h2>
        <p>
            These settings can be used to flag result items containing specified expressions in the response. For each
            item configured in the list, Burp will add a new results column containing a checkbox indicating whether the
            item was found in each response. You can then sort on this column (by clicking the column header) to group
            the matched results together.
        </p>
        <p>
            Using this option can be very powerful in helping to analyze large sets of results, and quickly identifying
            interesting items. For example, in password guessing attacks, scanning for phrases such as "password
            incorrect" or "login successful" can locate successful logins; in testing for SQL injection vulnerabilities,
            scanning for messages containing "ODBC", "error", etc. can identify vulnerable parameters.
        </p>
        <p>
            In addition to the list of expressions to match, the following options are available:
        </p>
        <ul>
            <li>
                <strong>Match type</strong> - This specifies whether the expressions are simple strings or regular
                expressions.
            </li>
            <li>
                <strong>Case sensitive match</strong> - This specifies whether the check for the expression should be
                case sensitive.
            </li>
            <li>
                <strong>Exclude HTTP headers</strong> - This specifies whether the HTTP response headers should be
                excluded from the check.
            </li>
        </ul>
        <h2 id="grep-extract">Grep - Extract</h2>
        <p>
            These settings can be used to extract useful information from responses into the attack results table. For
            each item configured in the list, Burp will add a new results column containing the text that was extracted
            for that item. You can then sort on this column (by clicking the column header) to order the extracted
            data.
        </p>
        <p>
            This option is useful for mining data from the application and can support a wide range of attacks. For
            example, if you are cycling through a range of document IDs, you can extract the page title of each document
            looking for interesting items. If you have found a function that returns details of other application users,
            you can iterate through user IDs and retrieve relevant fields about users looking for administrative
            accounts or even passwords. If a "forgotten password" function takes a username as a parameter and returns a
            user-configured password hint, you can run through a list of common usernames and harvest all the associated
            password hints, and then visually scan through the list looking for easily guessed passwords.
        </p>
        <p>
            If the same matching item is added multiple times in succession, then each server response will be searched
            for multiple occurrences of that expression, and the text immediately following each occurrence will be
            captured. This can be useful, for example when an HTML table contains useful information but there are no
            unique prefixes with which to automatically pick out each item.
        </p>
        <p>
            For details of configuring the details of items to extract, see the help on using the <a href="../../functions/response-extraction.html"> response extraction rule dialog</a>.
        </p>
        <p>
            Optionally, you can configure a maximum length that Burp should capture for each item.
        </p>
        <h2 id="grep-payloads">Grep - Payloads</h2>
        <p>
            These settings can be used to flag result items containing reflections of the submitted payload. If the
            option is enabled, Burp will add a new results column containing a checkbox indicating whether the value of
            the current payload was found in each response. (If more than one <a href="payloads/index.html">payload
            set</a> is used, a separate column will be added for each payload set.)
        </p>
        <p>
            This feature can be useful in detecting cross-site scripting and other response injection vulnerabilities,
            which can arise when user input is dynamically inserted into the application&#39;s response.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Case sensitive match</strong> - This specifies whether the check for the payload should be case
                sensitive.
            </li>
            <li>
                <strong>Exclude HTTP headers</strong> - This specifies whether the HTTP response headers should be
                excluded from the check.
            </li>
            <li>
                <strong>Match against pre-URL-encoded payloads</strong> - It is normal to configure Intruder to <a href="payloads/processing.html#payload-encoding">URL-encode</a> payloads within requests. However,
                these are normally decoded by the application and echoed in their original form. You can use this option
                to make Burp check responses for payloads in their pre-encoded form.
            </li>
        </ul>
        <h2 id="handling-redirections-during-attacks">Handling redirections during attacks </h2>
        <p>
            These settings control how Burp handles redirections when performing attacks. It is often necessary to
            follow redirections to achieve the objectives of your attack. For example, in a password guessing attack,
            the result of each attempt might only be displayed by following a redirection. When fuzzing, relevant
            feedback might only appear in an error message that is returned after an initial redirection response.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Follow redirections</strong> - This setting controls the targets of redirections that are
                followed.
            </li>
            <li>
                <strong>Process cookies in redirections</strong> - If this option is selected, then any cookies set in
                the redirection response will be resubmitted when the redirection target is followed. For example, this
                option may be necessary if you are attempting to brute force a login challenge that always returns a
                redirection to a page indicating the login result, and a new session is created in response to each
                login attempt.
            </li>
        </ul>
        <p>
            Burp will follow up to 10 chained redirections if necessary. A column in the results table will indicate
            whether a redirect was followed for each individual result, and the full requests and responses in the
            redirection chain are stored with each result item. The types of redirection that Burp will process (3xx
            status code, Refresh header, etc.) are configured in the suite-wide <a href="../../options/http.html#redirections">redirection
            options</a>.
        </p>
        <p>
            Some further points are worth noting in relation to redirections:
        </p>
        <ul>
            <li>
                In some situations it may be necessary to use only a single-threaded attack when following redirections.
                This arises when the application stores the result of the initial request within your session, and
                retrieves this when delivering the redirection response.
            </li>
            <li>
                Automatically following redirections may sometimes cause problems for your attack - for example, if the
                application responds to some malicious requests with a redirection to the logout page, then following
                redirections may result in your session being terminated when it would not otherwise do so.
            </li>
        </ul>
    </div>
</section>
</body>
</html>