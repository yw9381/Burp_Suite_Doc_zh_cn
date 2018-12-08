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
            <a href="getting-started.html">Getting Started</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Getting Started With Burp Intruder</h1>
        <p>
            Burp Intruder is a powerful tool for performing automated customized attacks against web applications. It is
            extremely flexible and configurable, and can be used to automate all kinds of tasks that arise when testing
            applications.
        </p>
        <div class="rounded-corner-box">
            <p>
                <strong>Note:</strong> Using Burp Intruder may result in unexpected effects in some applications. Until
                you are fully familiar with its functionality and settings, you should only use Burp Intruder against
                non-production systems.
            </p>
        </div>
        <p>
            To start getting to know Burp Intruder, carry out the following steps:
        </p>
        <ol>
            <li>
                First, ensure that Burp is <a href="../../getting-started/index.html#启动-burp">installed and running</a>, and
                that you have <a href="../../getting-started/projects.html"> configured your browser</a> to work with
                Burp.
            </li>
            <li>
                If you have not done so already, browse around some of your target application, to populate Burp's
                Target site map with details of the application's contents and functionality. Before doing so, to speed
                things up, go to the Proxy tab, then the Intercept sub-tab, and turn off Proxy interception (if the
                button says "Intercept is on" then click it to toggle the interception status to off).
            </li>
            <li>
                Go to the Proxy tab, and the History sub tab. Find an interesting-looking request to your target
                application, containing a number of parameters. Select this single request, and choose "Send to
                Intruder" from the context menu.
            </li>
            <li>
                Go to the Intruder tab. Burp Intruder lets you configure multiple attacks simultaneously. Each request
                that you send to Intruder opens in its own attack tab, and these are sequentially numbered by default.
                You can double click a tab header to rename the tab, drag tabs to reorder them, and also close and open
                new tabs.
            </li>
            <li>
                Within the Intruder attack tab that was created for the request that you sent, look at the Target and
                Positions tabs. These have been automatically populated with the details of the request that you sent.
            </li>
            <li>
                Burp Intruder essentially works by taking a base template request (the one that you sent there), cycling
                through a number of attack payloads, placing these payloads into defined locations within the base
                request, and issuing each resulting request. The Positions tab is used to configure the positions where
                payloads will be inserted into the base request. You can see that Burp has automatically made a guess at
                where you would like to position payloads. By default, payloads are placed into the values of all
                request parameters and cookies. Each pair of payload markers defines a single payload position, and may
                enclose some text from the base request, which will be replaced with the contents of the payload when
                that payload position is used. For further details, see the <a href="positions.html#payload-markers">Payload
                Markers</a> help.
            </li>
            <li>
                The buttons next to the request editor can be used to add and clear the payload markers. Try adding
                payload markers in new locations within the request, and removing other markers, and see the effects.
                When you have understood how the payload markers work, click the "Auto &#xA7;" button to revert to the
                default payload positions that Burp configured for you. If you have modified the text of the request
                itself, you can repeat step 3 to create a new Intruder attack tab with the original request in it.
            </li>
            <li>
                Go to the Payloads tab. This lets you define the payloads that will be placed into the defined payload
                positions. Keep the default setting (to use a "Simple list" of payloads), and add some test strings to
                the list. You can enter your own strings by typing into the "Enter a new item" box and clicking "Add".
            </li>
            <li>
                <span class="pro-edition-feature-label">Professional</span>
                You can use the "Add from list" drop-down and choose "Fuzzing - quick" from the list of built-in payload
                strings.
            </li>
            <li>
                You have now configured the bare minimum of options to launch an attack. Go to the Intruder menu, and
                select "Start attack".
            </li>
            <li>
                The attack opens in a new window containing a table in the Results tab. The results table contains an
                entry for each request that has been made, with various key details such as the payload used, HTTP
                status code, response length, etc. You can select any item in the table to view the full request and
                response. You can also sort the table by clicking on column headers, and filter the contents of the
                table using the filter bar. These features work in the same way as for the <a href="../proxy/history.html">Proxy
                history</a>.
            </li>
            <li>
                The attack window contains other tabs, which show the configuration that was used for the current
                attack. You can modify most of this configuration after the attack has started. Go to the Options tab,
                scroll down to "Grep - Match", and check the box "Flag result items with responses matching these
                expressions". This will cause Intruder to inspect responses for items matching each expression in the
                list, and flag those with matches. By default, the list shows some common error strings that are useful
                when fuzzing, but you can configure your own strings if you wish. Go back to the Results tab and see
                that Intruder has added a column for each item in the list, and these contain checkboxes indicating
                whether the expression was found in each response. If you are lucky, your basic fuzzing might have
                triggered an error message in some responses that indicates the presence of a bug.
            </li>
            <li>
                Now select any item in the table and look at the response for that item. Find an interesting string in
                the response (such as the page title, or an error message). Right-click the item in the table, and
                select "Define extract grep from response" from the context menu. In the dialog, select the interesting
                string in the response, and click "OK". The results table now contains a new column which extracts this
                piece of text from each response (which may be different in each case). You can use this feature to
                locate interesting data in large attacks with thousands of responses. Note that you can also configure
                "extract grep" items in the Options tab, prior to or during an attack.
            </li>
            <li>
                Select any item in the results table, and open the context menu. Choose "Send to Repeater", and go to
                the Repeater tab. You will see the selected request has been copied into the <a href="../repeater/using.html">Repeater</a> tool, for further testing. Many other useful options are
                available on the context menu. For more details on sending items between Burp tools, and the overall
                testing workflow, see <a href="../../penetration-testing/index.html"> Using Burp Suite</a>.
            </li>
            <li>
                You can use the "Save" menu in the results window to save either the results table or the entire attack.
                You can load the results table into other tools or a spreadsheet program. You can reload saved attacks
                via the Intruder menu on the main Burp UI.
            </li>
            <li>
                These steps have only described one simple use case for Burp Intruder, for fuzzing a request with some
                standard attack strings and grepping for error messages. You can use Intruder for many different types
                of attack, with numerous different payloads and attack options. For more details, see <a href="using.html#typical-uses"> Typical Uses for Burp Intruder</a>.
            </li>
        </ol>
        <div class="rounded-corner-box">
            <p>
                Use the links below for further help on starting to use Burp Intruder:
            </p>
            <ul class="link-list">
                <li>
                    <a href="using.html">Using Burp Intruder</a>
                </li>
                <li>
                    <a href="../../penetration-testing/index.html">Using Burp Suite</a>
                </li>
                <li>
                    <a href="../../troubleshooting.html">Troubleshooting common problems</a>
                </li>
            </ul>
        </div>
    </div>
</section>
</body>
</html>