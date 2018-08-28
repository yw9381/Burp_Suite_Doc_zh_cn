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
            <a href="index.html">Tools</a>
        </li>
        <li>
            <a href="collaborator-client.html">Collaborator Client</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Burp Collaborator Client</h1>
        <p>
            Burp Collaborator client is a tool for making use of <a href="../../collaborator/index.html">Burp Collaborator</a> during manual testing. You can use the Collaborator client to generate payloads for use in manual testing,
            and poll the Collaborator server for any network interactions that result from using those payloads.
        </p>
        <p>
            To run Burp Collaborator client, go to the Burp menu and select "Burp Collaborator client".
        </p>
        <p>
            The following functions are available:
        </p>
        <ul>
            <li>
                You can generate a specified number of Collaborator payloads and copy these to the clipboard. You can
                use these in manual testing, for example using <a href="intruder/index.html">Burp Intruder</a> or <a href="repeater/index.html">Repeater</a>.
            </li>
            <li>
                You can choose whether the generated payloads include the full Collaborator server location, or only the
                unique interaction ID.
            </li>
            <li>
                You can poll the Collaborator server to retrieve details of any network interactions resulting from your
                payloads, either at a regular interval or on demand.
            </li>
        </ul>
        <p>
            Please take note of the following when using the Burp Collaborator client:
        </p>
        <ul>
            <li>
                Each Collaborator client window opens in a separate context in which payloads can be generated and
                polled for. There is no cross-talk of payloads or interactions between separate client windows. Hence,
                if you close a client window, there is no way to retrieve any further interactions resulting from its
                payloads.
            </li>
            <li>
                Each Collaborator client window is tied to the <a href="../options/misc-project.html#burp-collaborator-server"> Collaborator server configuration</a> that was in place at the time the window was opened. If you modify
                your Collaborator server settings (for example, to use a different private Collaborator server) you will
                need to open a new client window to use that configuration.
            </li>
        </ul>
    </div>
</section>
</body>
</html>