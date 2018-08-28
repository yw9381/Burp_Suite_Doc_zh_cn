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
            <a href="extender.html">Extender</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Burp Extender</h1>
        <p>
            Burp Extender lets you use Burp extensions, to extend Burp's functionality using your own or third-party
            code. You can <a href="#loading-and-managing-extensions"> load and manage extensions</a>, <a href="#extension-details">view details</a> about
            installed extensions, install extensions from the <a href="#bapp-store">BApp Store</a>, view the current <a href="#burp-extender-api">Burp Extender API</a>, and configure <a href="#extender-options">options</a> for how extensions are
            handled.
        </p>
        <p>
            Burp extensions can customize Burp's behavior in numerous ways, such as modifying HTTP requests and
            responses, customizing the UI, adding custom Scanner checks, and accessing key runtime information,
            including the <a href="proxy/history.html"> Proxy history</a>, <a href="target/site-map/index.html">Target site
            map</a> and <a href="target/site-map/index.html#issues-view">Scanner issues</a>.
        </p>
        <p>
            For help on creating your own Burp extensions, see the main <a href="https://portswigger.net/burp/extender">extensibility
            documentation</a>.
        </p>
        <h2 id="loading-and-managing-extensions">Loading and Managing Extensions</h2>
        <p>
            The table shows a list of any installed extensions. You can add, remove and reorder extensions using the
            buttons by the extensions table. Please note:
        </p>
        <ul>
            <li>
                The order that extensions are shown is the order in which any registered listeners and other extension
                resources will be invoked.
            </li>
            <li>
                Extensions can be unloaded but retained in the table to enable easy reloading at a later time.To toggle
                an extension's loaded state without removing it from the list, click on the checkbox in the "Loaded"
                column or in the <a href="#extension-details">extension details</a> panel. <strong>Note:</strong> You can
                fast-reload an extension by Ctrl+clicking the "Loaded" checkbox. This will unload and reload the
                extension without showing a confirmation dialog.
            </li>
            <li>
                To run extensions written in Python, you will first need to configure the location of the Jython
                standalone JAR, in the <a href="#python-environment">Python environment options</a>.
            </li>
        </ul>
        <h2 id="extension-details">Extension Details</h2>
        <p>
            Selecting an item in the extensions table shows information about that extension in the lower panel.
        </p>
        <p>
            The <strong>Details</strong> tab shows the following information:
        </p>
        <ul>
            <li>
                Whether the extension is currently loaded. You can click on the checkbox to load or unload the selected
                extension.
            </li>
            <li>
                The extension name. Extensions can programmatically set their preferred name which appears in the UI.
                You can manually edit this name if required.
            </li>
            <li>
                The type of the extension (Java or Python).
            </li>
            <li>
                The file from which the extension was loaded.
            </li>
            <li>
                Details of methods, listeners, and other resources in use by the extension.
            </li>
        </ul>
        <p>
            The <strong>Output</strong> tab contains details of the extension's standard output stream, and the <strong>Error</strong> tab contains the same information about the standard error stream. For each stream, you can configure
            whether the application's output should be directed to the system console, or saved to file, or displayed in
            the UI. Please note:
        </p>
        <ul>
            <li>
                The UI-based output window is limited in size and is not intended for heavy duty logging.
            </li>
            <li>
                Extensions are responsible for directing their output and error messages to the correct streams which
                Burp has assigned to them, and which are programmatically available via the extensibility API.
                Extensions that do not honor this may direct output directly to the system console regardless of the
                settings specified here.
            </li>
        </ul>
        <h2 id="bapp-store">BApp Store</h2>
        <p>
            The BApp Store contains Burp extensions that have been written by users of Burp Suite, to extend Burp's
            capabilities.
        </p>
        <p>
            You can view the list of available BApps, install specific BApps, and submit user ratings for those you have
            installed.
        </p>
        <p>
            If you do not have Internet access from the machine that is running Burp, you can download BApp files from
            the <a href="https://portswigger.net/bappstore">BApp Store web site</a>, and manually install them into
            Burp.
        </p>
        <p>
            Some BApps are written in Python or Ruby, and require you to download Jython or JRuby, and <a href="#extender-options">configure Burp</a> with the location of the relevant language interpreters. Some BApps
            may require a more recent version of Burp, or a different edition of Burp.
        </p>
        <h2 id="burp-extender-api">Burp Extender API</h2>
        <p>
            This tab contains details of the APIs that are available for creating Burp extensions. The listing shows the
            APIs that are available in the version of Burp that is running. Select the name of an interface from the
            list to show the interface code in full.
        </p>
        <p>
            You can also use the "Save interface files" and "Save Javadoc files" buttons to save local copies of these
            files, for use when developing extensions.
        </p>
        <h2 id="extender-options">Extender options</h2>
        <p>
            This tab contains options for <a href="#settings"> extension settings</a>, the <a href="#java-environment">Java environment</a>, the <a href="#python-environment">Python environment</a>,
            and the <a href="#ruby-environment">Ruby environment</a>.
        </p>
        <h3 id="settings">Settings</h3>
        <p>
            The following settings are available:
        </p>
        <ul>
            <li>
                Whether to automatically reload extensions on startup. <strong>Note:</strong> If Burp was shut down with
                this setting selected, and you nonetheless want to restart Burp without automatically reloading any
                extensions then you can start Burp with the command line flag
                <span class="InlineCode">--disable-extensions</span>
                . This will prevent Burp from automatically reloading any extensions.
            </li>
            <li>
                Whether to automatically update installed BApps on startup.
            </li>
        </ul>
        <h3 id="java-environment">Java Environment</h3>
        <p>
            These settings let you configure the environment for executing extensions that are written in Java. If your
            extensions use any libraries, you can specify a folder from which libraries will be loaded. Burp will search
            this folder and any subfolders for JAR files, and will include these in the classpath of the classloader
            that is used to load Java extensions.
        </p>
        <h3 id="python-environment">Python Environment</h3>
        <p>
            These settings let you configure the environment for executing extensions that are written in Python. To use
            Python extensions, you will need to download Jython, which is a Python interpreter implemented in Java. The
            following options are available:
        </p>
        <ul>
            <li>
                <strong>Location of the Jython standalone JAR file</strong> - This is the location where you have
                downloaded Jython. You must download the standalone version of Jython.
            </li>
            <li>
                <strong>Folder for loading modules</strong> - This setting is optional and can be used to specify a
                folder from which the Python interpreter should attempt to load modules that are required for your
                extensions. If configured, this option causes Burp to update the Python
                <span class="InlineCode">sys.path</span>
                variable with the specified location. Using this option is useful if you have created your own set of
                Python libraries for use in multiple separate extensions.
            </li>
        </ul>
        <p>
            <strong>Note:</strong> Because of the way in which Jython dynamically generates Java classes, you may
            encounter memory problems if you load several different Python extensions, or if you unload and reload a
            Python extension multiple times. If this happens, you will see an error like:
        </p>
        <p class="InlineCode">java.lang.OutOfMemoryError: PermGen space
        </p>
        <p>
            You can avoid this problem by configuring Java to allocate more PermGen storage, by adding a
            <span class="InlineCode">-XX:MaxPermSize</span>
            option to the command line when starting Burp. For example:
        </p>
        <p class="InlineCode">java -XX:MaxPermSize=1G -jar burp.jar
        </p>
        <h3 id="ruby-environment">Ruby Environment</h3>
        <p>
            These settings let you configure the environment for executing extensions that are written in Ruby. To use
            Ruby extensions, you will need to download JRuby, which is a Ruby interpreter implemented in Java. Note that
            you can either configure the location of the JRuby JAR file here, or you can load the JAR file on startup
            via the Java classpath.
        </p>
        <p>
            <strong>Note:</strong> If you load several Ruby extensions, the same issue may arise with PermGen storage as
            is described for the <a href="#python-environment">Python environment</a>, and the issue can be resolved in
            the same way.
        </p>
    </div>
</section>
</body>
</html>