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
            <a href="positions.html">Positions</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Payload Positions</h1>
        <p>
            This tab is used to configure the <a href="#request-template">request template</a> for the attack, together with <a href="#payload-markers">payload markers</a>, and the <a href="#attack-type"> attack type</a> (which determines the
            way in which payloads are assigned to payload positions).
        </p>
        <h2 id="request-template"> Request Template </h2>
        <p>
            The main request editor is used to define the request template from which all attack requests will be
            derived. For each attack request, Burp takes the request template, and places one or more <a href="payloads/index.html">payloads</a> into the positions defined by the <a href="#payload-markers">payload
            markers</a>.
        </p>
        <p>
            The easiest way to set up the request template is to select the request you want to attack anywhere within
            Burp, and choose the "Send to Intruder" option on the context menu. This will send the selected request to a
            new tab in Intruder, and will automatically populate the <a href="target.html">Target</a> and
            Positions tabs.&nbsp;
        </p>
        <h2 id="payload-markers"> Payload Markers </h2>
        <p>
            Payload markers are placed using the &#xA7; character, and function as follows:
        </p>
        <ul>
            <li>
                Each pair of markers designates a single payload position.
            </li>
            <li>
                A pair of markers may optionally enclose some text from the template request between them.
            </li>
            <li>
                When a payload position is assigned a payload, both the markers and any enclosed text are replaced with
                the payload.
            </li>
            <li>
                When a payload position does not have an assigned payload, the markers are removed but the enclosed text
                remains unchanged.
            </li>
        </ul>
        <p>
            To make the configuration easier, Intruder automatically highlights each pair of payload markers and any
            enclosed text between them.
        </p>
        <p>
            You can place payload markers manually or automatically. When you send a request to Intruder from elsewhere
            within Burp, Intruder makes a guess at where you are likely to want to place payloads, and sets payload markers accordingly. You can modify the default
            payload markers using the buttons next to the request template editor:
        </p>
        <ul>
            <li>
                <strong>Add &#xA7;</strong> - If no text is selected, this inserts a single payload marker at the cursor
                position. If you have selected some text, a pair of markers are inserted enclosing the selected text.
            </li>
            <li>
                <strong>Clear &#xA7;</strong> - This removes all position markers, either from the entire template or
                from the selected portion of the template.
            </li>
            <li>
                <strong>Auto §</strong> - This makes a guess as to where it might be useful to position payloads
                and places payload markers accordingly. This is useful to quickly mark positions suitable for <a href="using.html#fuzzing-for-vulnerabilities">fuzzing</a>, but manual positioning is required for more
                customized attacks. If you have selected some text, markers are placed within the selected text only;
                otherwise, they are placed throughout the whole request template. The automatic placement of markers
                places payloads into the value of various types of request parameter, including&nbsp;URL query string parameters, body parameters, cookies, multipart parameter attributes (e.g. the filename in file uploads),&nbsp;XML data and element attributes, and&nbsp;JSON parameters.
                You can configure whether the automatic payload positions will replace or append to the existing
                parameter values, via an option on the Intruder menu. Note that if a sub-portion of the request, but not
                the whole message body, contains data formatted using XML or JSON, you can automatically position
                payloads within this structure by manually selecting the exact block of formatted data, and using the
                "Auto" button to position payloads within it. This is useful, for example, when a multipart parameter
                value contains data in XML or JSON format.
            </li>
            <li>
                <strong>Refresh</strong> - This refreshes the syntax colorizing of the request template editor, if
                necessary.
            </li>
            <li>
                <strong>Clear</strong> - This deletes the entire request template.
            </li>
        </ul>
        <p>
            <strong>Note:</strong> You can also use Intruder's payload positions UI to configure custom <a href="../../../scanner/auditing.html#insertion-points"> insertion points</a> for <a href="../../scanning/index.html">scans</a> by Burp Scanner. To do this, configure the request
            template and payload markers in the usual way within Intruder, and then select "Audit defined
            insertion points" from the Intruder menu.
        </p>
        <h2 id="attack-type">Attack Type</h2>
        <p>
            Burp Intruder supports various attack types - these determine the way in which payloads are assigned to
            payload positions. The attack type can be selected using the drop-down above the request template editor.
            The following attack types are available:
        </p>
        <ul>
            <li>
                <strong>Sniper</strong> - This uses a single set of payloads. It targets each payload position in turn,
                and places each payload into that position in turn. Positions that are not targeted for a given request
                are not affected - the position markers are removed and any enclosed text that appears between them in
                the template remains unchanged. This attack type is useful for fuzzing a number of request parameters
                individually for common vulnerabilities. The total number of requests generated in the attack is the
                product of the number of positions and the number of payloads in the payload set.
            </li>
            <li>
                <strong>Battering ram</strong> - This uses a single set of payloads. It iterates through the payloads,
                and places the same payload into all of the defined payload positions at once. This attack type is
                useful where an attack requires the same input to be inserted in multiple places within the request
                (e.g. a username within a Cookie and a body parameter). The total number of requests generated in the
                attack is the number of payloads in the payload set.
            </li>
            <li>
                <strong>Pitchfork</strong> - This uses multiple payload sets. There is a different payload set for each
                defined position (up to a maximum of 20). The attack iterates through all payload sets simultaneously,
                and places one payload into each defined position. In other words, the first request will place the
                first payload from payload set 1 into position 1 and the first payload from payload set 2 into position
                2; the second request will place the second payload from payload set 1 into position 1 and the second
                payload from payload set 2 into position 2, etc. This attack type is useful where an attack requires
                different but related input to be inserted in multiple places within the request (e.g. a username in one
                parameter, and a known ID number corresponding to that username in another parameter). The total number
                of requests generated in the attack is the number of payloads in the smallest payload set.
            </li>
            <li>
                <strong>Cluster bomb</strong> - This uses multiple payload sets. There is a different payload set for
                each defined position (up to a maximum of 20). The attack iterates through each payload set in turn, so
                that all permutations of payload combinations are tested. I.e., if there are two payload positions, the
                attack will place the first payload from payload set 2 into position 2, and iterate through all the
                payloads in payload set 1 in position 1; it will then place the second payload from payload set 2 into
                position 2, and iterate through all the payloads in payload set 1 in position 1. This attack type is
                useful where an attack requires different and unrelated or unknown input to be inserted in multiple
                places within the request (e.g. when guessing credentials, a username in one parameter, and a password
                in another parameter). The total number of requests generated in the attack is the product of the number
                of payloads in all defined payload sets - this may be extremely large.
            </li>
        </ul>
    </div>
</section>
</body>
</html>