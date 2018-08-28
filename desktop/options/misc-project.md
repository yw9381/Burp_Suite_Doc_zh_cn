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
            <a href="index.html">Options</a>
        </li>
        <li>
            <a href="misc-project.html">Misc Project Options</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Misc Project Options</h1>
        <p>
            This tab contains settings for <a href="#scheduled-tasks">scheduled tasks</a>, <a href="#burp-collaborator-server"> Burp Collaborator server</a>, and <a href="#logging">logging</a>.
        </p>
        <h2 id="scheduled-tasks">Scheduled Tasks</h2>
        <p>
        <span class="pro-edition-feature-label">Professional</span>
            See the <a href="../functions/task-scheduler.html">Task Scheduler documentation</a>.
        </p>
        <h2 id="burp-collaborator-server">Burp Collaborator Server</h2>
        <p>
            Burp Collaborator is an external service that Burp can use to help discover many kinds of vulnerabilities.
            For more details about the functionality and alternative methods of utilization of Burp Collaborator, see
            the main <a href="../../collaborator/index.html">Burp Collaborator documentation</a>.
        </p>
        <p>
            <strong>Note:</strong> The functionality of Burp Collaborator gives rise to issues that require careful
            consideration by users. Users should ensure that they fully understand the functionality and the alternative
            methods of utilization of Burp Collaborator, and have considered the consequences of utilization for
            themselves and their organization.
        </p>
        <p>
            The following options for using Burp Collaborator server are available:
        </p>
        <ul>
            <li>
                <strong>Use the default Collaborator server</strong> - This default option uses a public Collaborator
                server provided by PortSwigger. This server is shared between all Burp users who use it. If the public
                Collaborator server suffers from any service outage or degradation, then the efficacy of
                Collaborator-related functionality within Burp may be impaired. For this reason, PortSwigger makes no
                warranty about the availability or performance of this server.
            </li>
            <li>
                <strong>Don't use Burp Collaborator</strong> - With this option, none of the Collaborator-related
                capabilities within Burp will be available.
            </li>
            <li>
                <strong>Use a private Collaborator server</strong> - This option lets you use your own instance of the
                Collaborator server. See the documentation on <a href="../../collaborator/deploying.html">deploying a private
                Collaborator server</a> if you would like to do this.
            </li>
        </ul>
        <p>
            If you are using a private Collaborator server, you will need to configure Burp with the details of its
            location. The following options are available:
        </p>
        <ul>
            <li>
                <strong>Server location</strong> - This is the domain name or IP address of your server. If you specify
                the server by IP address, then Burp's Collaborator-related functionality that relies on DNS resolution
                will not be available. For more details, see the main <a href="../../collaborator/index.html">Burp Collaborator
                documentation</a>.
            </li>
            <li>
                <strong>Polling location (optional)</strong> - This optional field lets you specify the location where
                your private Collaborator server answers polling requests. Collaborator servers can be configured to
                receive interactions and answer polling requests on different network interfaces, if required. You can
                specify the polling location by hostname or IP address, with an optional port number separated by a
                colon. For example, 10.20.30.40:8008.
            </li>
        </ul>
        <p>
            The following further options are also available:
        </p>
        <ul>
            <li>
                <strong>Poll over unencrypted HTTP</strong> - By default, Burp polls the Collaborator server over HTTPS,
                and enforces SSL trust to prevent man-in-the-middle attacks. If your instance of Burp is unable to poll
                directly over HTTPS due to network or other limitations, you can opt to poll over unencrypted HTTP.
            </li>
            <li>
                <strong>Run health check</strong> - This button displays a dialog that performs a quick health check of
                your configured Collaborator server. It verifies whether it is possible to interact with the server
                using various network services, and whether Burp can retrieve the details of these interactions via
                polling. Based on these tests, you can determine whether Burp is likely to be able to make use of all,
                some, or none of the Collaborator's features.
            </li>
        </ul>
        <h2 id="logging">Logging</h2>
        <p>
            These settings control logging of HTTP requests and responses. Logging can be configured per-tool or for all
            Burp traffic.
        </p>
    </div>
</section>
</body>
</html>