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
            <a href="using.html">Using Burp Intruder</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Using Burp Intruder</h1>
        <p>
            Burp Intruder is a tool for automating customized attacks against web applications. It is extremely powerful
            and configurable, and can be used to perform a huge range of tasks, from simple brute-force guessing of web
            directories through to active exploitation of complex blind SQL injection vulnerabilities.
        </p>
        <div class="rounded-corner-box">
            <p>
                Also in the <a href="https://support.portswigger.net/">Burp Suite Support Center</a>:
            </p>
            <ul class="link-list">
                <li>
                    <a href="https://support.portswigger.net/customer/portal/topics/720250-burp-intruder/articles"> Using Burp Intruder</a>
                </li>
            </ul>
        </div>
        <h2 id="how-intruder-works">How Intruder Works</h2>
        <p>
            Burp Intruder works by taking an HTTP request (called the "base request"), modifying the request in various
            systematic ways, issuing each modified version of the request, and analyzing the application's responses to
            identify interesting features.
        </p>
        <p>
            For each attack, you must specify one or more sets of <a href="payloads/index.html">payloads</a>, and the <a href="positions.html">positions</a> in the base request where the payloads are to be placed.
            Numerous methods of generating payloads are available (including simple lists of strings, numbers, dates,
            brute force, bit flipping, and many others). Payloads can be placed into payload positions using <a href="positions.html#attack-type"> different algorithms</a>. Various tools are available to help
            analyze the results and identify interesting items for further investigation.
        </p>
        <h2 id="typical-uses">Typical Uses</h2>
        <p>
            Burp Intruder is a very flexible tool and can help automate all kinds of tasks when testing web
            applications. The most common use cases for Intruder fall into the following categories:
        </p>
        <ul>
            <li>
                <a href="#enumerating-identifiers">Enumerating identifiers</a>
            </li>
            <li>
                <a href="#harvesting-useful-data">Harvesting useful data</a>
            </li>
            <li>
                <a href="#fuzzing-for-vulnerabilities">Fuzzing for vulnerabilities</a>
            </li>
        </ul>
        <p>
            For a further discussion of the kinds of attacks that can be performed using Burp Intruder, see <a href="http://mdsec.net/wahh/"> The Web Application Hacker&#39;s Handbook</a> (chapter 13 in the <a href="http://mdsec.net/wahh/toc1e.html"> first edition</a>, and chapter 14 in the <a href="http://mdsec.net/wahh/toc2e.html">second edition</a>).
        </p>
        <h3 id="enumerating-identifiers">Enumerating Identifiers</h3>
        <p>
            Web applications frequently use identifiers to refer to items of data and resources; for example, usernames,
            document IDs, and account numbers. Often, you will need to cycle through a large number of potential
            identifiers to enumerate which ones are valid or worthy of further investigation. To do this in Burp
            Intruder, you need to perform the following steps:
        </p>
        <ul>
            <li>
                Find an application request that contains the identifier in a parameter, and where the response
                indicates whether the identifier is valid.
            </li>
            <li>
                Configure a single <a href="positions.html"> payload position</a> at the parameter's value.
            </li>
            <li>
                Use a suitable <a href="payloads/index.html">payload type</a> to generate potential identifiers to
                test, using the correct format or scheme.
            </li>
            <li>
                Identify a feature of the response from which valid identifiers can be reliably inferred, and configure
                Burp accordingly. For example, if a valid identifier returns a different HTTP status code or response
                length, you can <a href="attacks.html#results-table"> sort the attack results</a> on this
                attribute. Or if a valid identifier returns a response containing a specific expression, you can define
                a <a href="options.html#grep-match">match grep</a> item to pick out responses that match this
                expression.
            </li>
        </ul>
        <p>
            Some examples of real-world attacks of this type are as follows:
        </p>
        <ul>
            <li>
                If the application's login failure messages let you enumerate valid usernames, use the <a href="payloads/types.html#username-generator"> username generator</a> payload type to cycle
                through a long list of possible usernames and identify valid ones.
            </li>
            <li>
                Having identified a list of valid usernames, you can use the <a href="payloads/types.html#simple-list">simple list</a> payload type with a set of common
                passwords to attempt to guess user's passwords.
            </li>
            <li>
                If an application function lets you view details of any order, by submitting a valid order ID, you can
                use the <a href="payloads/types.html#custom-iterator">custom iterator</a> payload type to
                generate potential order IDs in the correct format, and trawl for other users' orders.
            </li>
            <li>
                If an application uses meaningful structured session tokens that are encrypted using a CBC cipher, you
                can use the <a href="payloads/types.html#bit-flipper">bit flipper</a> payload type to
                systematically modify a valid token to try to meaningfully tamper with its decrypted value.
            </li>
        </ul>
        <h3 id="harvesting-useful-data">Harvesting Useful Data</h3>
        <p>
            In many situations, rather than simply identifying valid identifiers, you need to extract some interesting
            data about each item, to help you focus your efforts on the most critical items, or to feed in to other
            attacks. To do this in Burp Intruder, you need to perform the following steps:
        </p>
        <ul>
            <li>
                Find an application request that contains an identifier in a parameter, and where the response contains
                the interesting data about the requested item.
            </li>
            <li>
                Configure a single <a href="positions.html"> payload position</a> at the parameter's value.
            </li>
            <li>
                Use a suitable <a href="payloads/index.html">payload type</a> to generate potential identifiers to
                test, using the correct format or scheme.
            </li>
            <li>
                Configure an <a href="options.html#grep-extract"> extract grep</a> item to retrieve the relevant
                data from each response, and list this in the <a href="attacks.html#attack-results">attack results</a>.
            </li>
        </ul>
        <p>
            Some examples of real-world attacks of this type are as follows:
        </p>
        <ul>
            <li>
                If the application has a "Forgotten password" feature that takes a username as a parameter and displays
                a password hint that was set by that user, you can cycle through a <a href="payloads/types.html#simple-list">simple list</a> of common usernames, and extract the
                password hint for each valid user. You can then quickly scan the listing of retrieved hints to locate
                ones that are easily guessed.
            </li>
            <li>
                If the application returns some content dynamically, via a single URL that contains a numeric page ID
                parameter, you can use the <a href="payloads/types.html#numbers">numbers</a> payload type to
                cycle through all possible identifiers and retrieve the HTML title tag for each page. You can then
                quickly review the list of available pages to identify any that are particularly interesting or which
                you should not be allowed to access.
            </li>
            <li>
                If application has a "User profile" page containing information about each user, including their role in
                the application, you can cycle through an already extracted list of usernames, and retrieve the role for
                each user, allowing you to quickly identify administrative accounts for further targeted attacks.
            </li>
        </ul>
        <h3 id="fuzzing-for-vulnerabilities">Fuzzing For Vulnerabilities</h3>
        <p>
            Many input-based vulnerabilities, such SQL injection, cross-site scripting, and file path traversal can be
            detected by submitting various test strings in request parameters, and analyzing the application's responses
            for error messages and other anomalies. Given the size and complexity of today's applications, performing
            this testing manually is a time consuming and tedious process.
        </p>
        <p>
            You can automate web application fuzzing with Burp Intruder, using the following steps:
        </p>
        <ul>
            <li>
                Configure payload positions at the values of all request parameters.
            </li>
            <li>
                Use the <a href="payloads/types.html#simple-list"> simple list</a> payload type.
            </li>
            <li>
                Configure the payload list using one of Burp's <a href="payloads/types.html#predefined-payload-lists"> predefined payload lists</a> containing
                common fuzz strings, or your own list of attack strings.
            </li>
            <li>
                Configure <a href="options.html#grep-match">match grep</a> items with various common error
                message strings. The default options in the match grep UI include a list of useful strings for this
                purpose.
            </li>
            <li>
                After <a href="#launching-an-attack">launching the attack</a>, review the <a href="attacks.html#attack-results">attack
                results</a> to identify interesting errors and other anomalies. You should sort the results table on
                each of the match grep columns, and also on other relevant columns such as response length, HTTP status
                code, response timers, etc.
            </li>
        </ul>
        <p>
            <strong>Note:</strong> When fuzzing, you will typically want to test a large number of requests using the
            same Intruder payloads and match grep configuration. To facilitate this, you can use the Intruder menu to
            configure the "New tab behavior" option to "Copy configuration from last tab". Then, when you have
            configured your payloads and grep strings for one request, subsequent requests that you send to Intruder
            will pick up the same configuration options within their tab. To fuzz multiple requests, you then simply
            need to send each one to Intruder, and choose "Start attack" from the Intruder menu.
        </p>
        <h2 id="configuring-an-attack">Configuring an Attack</h2>
        <p>
            The main Intruder UI lets you configure multiple attacks simultaneously, each in its own tab. When you send
            requests to Intruder, each one is opened in its own numbered tab. Each attack configuration tab contains
            several sub-tabs that are used to configure the attack. Use the links below for help on the details of each
            tab:
        </p>
        <ul>
            <li>
                <strong><a href="target.html">Target</a></strong> - This is used to configure the details of
                the target server for the attack.
            </li>
            <li>
                <strong><a href="positions.html">Positions</a></strong> - This is used to configure the request
                template for the attack, together with payload positions, and the attack type (this determines the way
                in which payloads are assigned to payload positions).
            </li>
            <li>
                <strong><a href="payloads/index.html">Payloads</a></strong> - This is used to configure one or more
                sets of payloads, which will be placed into payload positions during the attack.
            </li>
            <li>
                <strong><a href="options.html">Options</a></strong> - This is used to configure numerous other
                options affecting the attack.
            </li>
        </ul>
        <p>
            The easiest way to create a new Intruder attack is to select the relevant base request within another Burp
            tool (such as the <a href="../proxy/history.html">Proxy history</a> or Target <a href="../target/site-map/index.html">site
            map</a>), and use the &quot;Send to Intruder&quot; option on the context menu. This will create a new attack
            tab, and automatically populate the <a href="target.html">Target</a> and <a href="positions.html">Positions</a> tabs with the relevant details about the base request. You
            can then modify the automatic payload positions if required, and configure suitable <a href="payloads/index.html">payloads</a> and other attack <a href="options.html">options</a>.
        </p>
        <p>
            Burp Intruder has a number of functions to help you manage attack configurations. These functions are
            available via the Intruder menu:
        </p>
        <ul>
            <li>
                You can save the attack configuration for the current tab, and reload it later. When loading or saving,
                you can optionally include or exclude the payload positions settings. Including the payload positions
                settings lets you save the full configuration for a specific attack. Excluding the payload positions
                settings lets you save a generic attack configuration that can be reused for another base request
                template and payload positions - for example, your preferred configuration for fuzzing a particular type
                of request.
            </li>
            <li>
                You can copy attack configurations between two existing tabs, or into a new tab. Again, you can
                optionally include or exclude the payload positions settings.
            </li>
            <li>
                You can control how Intruder handles attack configurations when you open a new attack tab (by clicking
                on the right-most "..." tab, or sending a new request to Intruder). You can optionally use the default
                attack configuration, copy the configuration from the first open tab, or copy the configuration from the
                last open tab. Using the latter options lets you create a generic attack configuration (e.g. for
                fuzzing), and automatically apply this to each new request that you send to Intruder.
            </li>
        </ul>
        <p>
            The attack tabs themselves are easy to manage. You can:
        </p>
        <ul>
            <li>
                Rename tabs by double-clicking the tab header.
            </li>
            <li>
                Reorder tabs by dragging them.
            </li>
            <li>
                Open a new tab by clicking on the right-most "..." tab.
            </li>
            <li>
                Close tabs by clicking the X button in the tab header.
            </li>
        </ul>
        <h2 id="launching-an-attack">Launching an Attack</h2>
        <p>
            When your attack is fully <a href="#configuring-an-attack">configured</a>, you can launch the attack by selecting
            "Start attack" from the Intruder menu.
        </p>
        <p>
            Each attack runs in a new window, containing detailed <a href="attacks.html#attack-results">results</a>,
            with full requests and responses (if <a href="options.html#attack-results-options">configured</a>). There are
            various functions to help you <a href="attacks.html#results-table">analyze the results</a>, and
            identify interesting items for further investigation. You can:
        </p>
        <ul>
            <li>
                Sort the results columns to order the items according to different attributes (HTTP status code,
                response length, etc.).
            </li>
            <li>
                Unhide additional results <a href="attacks.html#columns-menu">columns</a> that are
                hidden by default.
            </li>
            <li>
                Define new <a href="options.html#grep-match">match grep</a> and <a href="options.html#grep-extract">extract grep</a> items when the attack is already underway,
                to perform further analysis based on the observed results.
            </li>
            <li>
                Set a <a href="attacks.html#intruder-attacks-display-filter">display filter</a> and <a href="attacks.html#annotations">annotate</a> results.
            </li>
            <li>
                <a href="attacks.html#save-menu">Save</a> the contents of the results table.
            </li>
            <li>
                Use the <a href="attacks.html#burp-intruder-testing-workflow"> context menu</a> to carry out other actions
                and integrate with your <a href="../../penetration-testing/index.html"> testing workflow</a>.
            </li>
            <li>
                <span class="pro-edition-feature-label">Professional</span>
                <a href="attacks.html#save-menu">Save</a> the entire attack. To later reload a saved
                attack, select "Open saved attack" on the Intruder menu.
            </li>
        </ul>
    </div>
</section>
</body>
</html>