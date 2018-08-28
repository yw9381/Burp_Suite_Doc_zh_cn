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
            <a href="index.html">Getting Started</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Getting Started With Burp Suite</h1>
<div class="rounded-corner-box">
            <p>
                Also in the <a href="https://support.portswigger.net/">Burp Suite Support Center</a>:
            </p>
            <ul class="link-list">
                <li>
                    <a href="https://support.portswigger.net/customer/portal/articles/1816883-getting-started-with-burp-suite"> Getting started with Burp Suite</a>
                </li>
            </ul>
        </div>
        <p>
            <strong>Note:</strong> Using Burp Suite may result in unexpected effects in some applications. Until you are
            fully familiar with its functionality and settings, you should only use Burp Suite against non-production
            systems.
        </p>
        <h2 id="launching-burp">Launching Burp</h2>
        <p>
            Download the Burp Suite installer for your required platform (Windows, MacOS, or Linux) from the <a href="https://portswigger.net/burp/releases">PortSwigger.net</a> website.
        </p>
        <p>
            Run the installer and select any desired options within the installation wizard.
        </p>
        <p>
            Launch Burp Suite by clicking the installed application shortcut. On Linux, the shortcut is located in the installation path that was displayed/selected during installation.
        </p>
        <p>
            You can also <a href="launching-from-command-line.html">launch Burp Suite from the command line</a> to specify additional options and <a href="launching-from-command-line.html#command-line-arguments">command line arguments</a>.
        </p>

        <h2 id="startup-wizard">Startup Wizard</h2>
        <p>
            When Burp launches, the startup wizard is displayed. This lets you choose what Burp project to open, and
            what project configuration to use.
        </p>
        <h3 id="selecting-a-project">Selecting a Project</h3>
        <p>
            You can choose from the following options to create or open a project:
        </p>
        <ul>
            <li>
                <strong>Temporary project</strong> - This option is useful for quick tasks where your work doesn't need
                to be saved. All data is held in memory, and is lost when Burp exits.
            </li>
            <li>
                <strong>New project on disk</strong> - This creates a new project that will store its data in a <a href="projects.html">Burp project file</a>. This file will hold all of the
                data and configuration for the project, and data is saved incrementally as you work. You can also
                specify a name for the project.
            </li>
            <li>
                <strong>Open existing project</strong> - This reopens an existing project from a <a href="projects.html">Burp project file</a>. A list of recently opened
                projects is shown for quick selection. When this option is selected, the Spider and Scanner tools will
                be automatically paused when the project reopens, to avoid sending any unintentional requests to
                existing configured targets. You can deselect this option if preferred.
            </li>
        </ul>
        <p>
            <strong>Note:</strong> You can rename a project later via the Burp menu.
        </p>
        <h3 id="selecting-a-configuration">Selecting a Configuration</h3>
        <p>
            You can choose from the following options for the project configuration:
        </p>
        <ul>
            <li>
                <strong>Use Burp defaults</strong> - This will open the project using Burp's default options.
            </li>
            <li>
                <strong>Use options saved with project</strong> - This is only available when reopening an existing
                project, and will open the project using the options that were saved in the <a href="projects.html">project file</a>.
            </li>
            <li>
                <strong>Load from configuration file</strong> - This will open the project using the options contained
                in the selected <a href="configuration.html"> Burp configuration file</a>. Note that
                only <a href="../options/index.html"> project-level options</a> in the configuration file will be reloaded, and
                any user-level options will be ignored. A list of recently used configuration files is shown for quick
                selection.
            </li>
        </ul>
        <h3 id="opening-a-project-from-a-different-burp-installation">Opening a Project From a Different Burp Installation</h3>
        <p>
            If you open an existing project that was created by a different installation of Burp, then Burp will prompt
            you to decide whether to take full ownership of the project.
        </p>
        <p>
            This decision is needed because Burp stores within the project file an identifier that is used to retrieve
            any ongoing <a href="../../collaborator/index.html">Burp Collaborator</a> interactions that are associated with the
            project. If two instances of Burp share the same identifier in ongoing work, then some Collaborator-based
            issues may be missed or incorrectly reported. You should only take full ownership of a project from a
            different Burp installation if no other instance of Burp is working on that project.
        </p>
        <h2 id="display-settings">Display Settings</h2>
        <p>
            The first time you run Burp, it is worth taking a moment to check your display settings. Burp lets you
            select different sized fonts for different parts of the UI, and you may want to change these settings,
            depending on your screen resolution.
        </p>
        <p>
            First, look at the text shown in Burp's menus, tab captions, buttons and other text. If you want to change
            the main UI font size, go to the Options tab, then go to the Display sub-tab, and edit the font size in the <a href="index.html">User Interface</a> section. Then restart Burp and check whether the new
            font is suitable.
        </p>
        <p>
            Second, go to the Repeater tab and look at the HTTP message shown in the request panel. If you want to
            change the font size for HTTP messages, go to the Options tab, then go to the Display sub-tab, and edit the
            font size in the <a href="index.html">HTTP Message Display</a> section. Then go
            back to the Repeater tab and check whether the new font is suitable (there is no need to restart).
        </p>
<h2 id="next-steps">Next Steps</h2>
            <p>
                Use the links below for further help on starting to use Burp:
            </p>
            <ul class="link-list">
		    <li>
		        <a href="../scanning/index.html"> Scan a website </a>
	        </li>
		    <li>
		        <a href="../penetration-testing/index.html">Use Burp Suite for penetration testing</a>
		        </li>
		    <li>
		        <a href="configuration.html">Working with Burp's configuration </a>
		        </li>
		    <li>
                <a href="../troubleshooting.html">Troubleshooting common problems</a>
                </li>
            </ul>
    </div>
</section>
</body>
</html>