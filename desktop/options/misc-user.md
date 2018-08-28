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
            <a href="misc-user.html">Misc User Options</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Misc User Options</h1>
        <p>
            This tab contains settings for <a href="#hotkeys">hotkeys</a>, <a href="#automatic-project-backup">automatic
                project backup</a>, <a href="#proxy-interception">Proxy interception</a>, <a href="#rest-api-options">REST API</a>, <a href="#proxy-interception">Proxy
                    history logging</a>, location of <a href="#temporary-files-location">temporary files</a>, and <a href="#performance-feedback">performance
                        feedback</a>.
        </p>
        <h2 id="hotkeys">Hotkeys</h2>
        <p>
            These settings let you configure hotkeys for common actions. Numerous types of actions can be assigned a
            hotkey, in the following categories:
        </p>
        <ul>
            <li>
                Actions specific to an individual HTTP request or response, such as "Send to Repeater".
            </li>
            <li>
                Global actions, such as "Switch to Proxy".
            </li>
            <li>
                In-editor actions, such as "Cut" and "Undo".
            </li>
        </ul>
        <p>
            A number of hotkeys are configured by default. Note that very many more actions are available to have a
            hotkey assigned, if you use them frequently.
        </p>
        <p>
            All hotkeys must use the Control key (or the Command key on OSX), and may also use Shift and other available
            modifiers. Note that on some Windows installations the Ctrl+Alt combination is treated by Windows as
            equivalent to AltGr, and so may result in typed characters appearing when pressed in text fields.&nbsp;
        </p>
        <h2 id="automatic-project-backup">Automatic Project Backup</h2>
        <p>
            Automatic project backup saves a copy of the Burp project file periodically in the background. The following
            options are available:
        </p>
        <ul>
            <li>
                Whether to perform automatic backup, and how frequently.
            </li>
            <li>
                Whether to include in-scope items only.
            </li>
            <li>
                Whether to show a progress dialog during backups.
            </li>
            <li>
                Whether to delete the backup file on clean shutdown of Burp.
            </li>
        </ul>
<h2 id="rest-api-options">REST API options</h2>
        <p>
            The REST API can be used by other tools to integrate with Burp Suite.
        </p>
        <p>
            <strong>Note:</strong> The REST API exposes sensitive functionality and data. You should not enable the REST API service on untrusted network interfaces, and you should use separate API keys for each client that you grant access to.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                The URL on which the service runs. You can select the port number and interface to bind to. You should not bind to non-loopback interfaces when connected to untrusted networks.
            </li>
            <li>
                Whether the service is currently running.
            </li>
            <li>
                Whether to allow access without an API key. This option is <strong>not recommended</strong>. It means that anyone with network access to the service endpoint is able to trigger actions within Burp and access its data. This includes CSRF requests from untrusted websites that you browse on the same machine as Burp, so API keys should always be used even when the service is listening only the loopback interface.
            </li>
            <li>
                The API keys for use by clients. You can create separate API keys for different purposes, and selectively enable or disable them. API keys are secrets and should be handled carefully. Note that you can only retrieve the value of an API key at the time that it is created.
            </li>
        </ul>
        <p>
            Once the service is configured, you can browse the API documentation and interact with the API at [Service URL]/[API key].
        </p>
<h2 id="proxy-interception">Proxy Interception</h2>
        <p>
            This option lets you configure whether Proxy interception should be enabled when Burp is started up. You can
            choose to always enable interception, always disable interception, or to restore the setting from when Burp
            was last closed.
        </p>
        <h2 id="proxy-history-logging">Proxy History Logging</h2>
        <p>
            This option controls whether adding items to Target scope will automatically set the <a href="../tools/proxy/options/index.html#miscellaneous">Proxy option</a> to stop sending out-of-scope items to the history or
            other Burp tools. Setting Burp to do this is useful to avoid accumulating project data for out-of-scope
            items.
        </p>
        <h2 id="temporary-files-location">Temporary Files Location</h2>
        <p>
            These settings let you configure where Burp stores its temporary files.
        </p>
        <p>
            By default, Burp creates a directory within the temporary file location provided by the platform. You can
            modify this behavior to use a custom directory - for example, on a different volume, or which is not
            world-readable.
        </p>
        <p>
            On Mac OS X, you may find that the default temporary file location is sometimes cleared following system
            hibernation, causing Burp to lose its temporary files. You can resolve this problem by configuring a custom
            location for Burp to store its temporary files.
        </p>
        <p>
            Changes to this setting take effect the next time Burp starts up.
        </p>
        <h2 id="performance-feedback">Performance Feedback</h2>
        <p>
            You can help improve Burp by submitting anonymous feedback about Burp's performance.
        </p>
        <p>
            Feedback only contains technical information about Burp's internal functioning, and does not identify you in
            any way. If you do report a bug, you can help us diagnose any problems that your instance of Burp has
            encountered by including your debug ID.
        </p>
</div>
</section>
</body>
</html>