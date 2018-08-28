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
        <li>
            <a href="configuration.html">Configuration</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Configuration</h1>
<p>
            You can use Burp's configuration library to manage different Burp configurations for particular tasks. For example,
            you might create different configurations for different types of scans. Or you might need to load a particular configuration when working on a particular client engagement. You can also save and load configurations in the form of configuration files.
        </p>
        <h2 id="configuration-library">Configuration library </h2>
<p>
            Burp's configuration library stores configuration options for different types of task, and makes these easily available when performing actions like <a href="../scanning/scan-launcher.html">launching scans</a>.
        </p>
        <p>
            The configuration library contains:
        </p>
        <ul>
            <li>
                <strong> Built-in configurations</strong> - These are predefined configurations that are useful for common purposes. For example, performing a fast crawl, or an audit only for critical vulnerabilities.
            </li>
            <li>
                <strong>Custom configurations</strong> - These are configurations defined and managed by the user.
            </li>
        </ul>
        <p>
            You can access Burp's configuration library via the Burp menu, and via other relevant functions like the <a href="../scanning/scan-launcher.html">scan launcher</a>.
        </p>
        <p>
            Each item in the configuration library applies to a specific function, such as "Crawling". When you create a new custom configuration or edit an existing one, Burp shows a configuration editor for the chosen function. There are typically multiple areas of configuration that can be defined for a given function. The configuration editor lets you choose which areas will be defined in that configuration. If a configuration does not define a particular area, then default or existing values will be used. This is useful because many Burp functions let you select multiple configurations; these are applied in sequence, allowing you to build up an effective configuration from multiple specific ones.
        </p>
        <p>
            Each configuration must be given a distinct name. You can export or import configurations as configuration files. These use a <a href="#configuration-file-format">JSON format</a> to represent the details of the configuration.
        </p>
        <h2 id="user-and-project-configuration-files">User and Project Configuration Files</h2>
        <p>
            Separate configuration files can be used to manage <a href="../options/index.html">user-level and project-level
            options</a>.
        </p>
        <p>
            User configuration files contain options relating to the individual user's environment and UI,
            including:
        </p>
        <ul>
            <li>
                Everything in the <a href="../options/index.html"> User options</a> tab.
            </li>
            <li>
                The <a href="../tools/extender.html">Extender</a> tool, including the list of configured extensions.
            </li>
            <li>
                UI-related options in other tools, such as the selected view of the <a href="../tools/target/site-map/index.html#site-map-views">Target site map</a>.
            </li>
        </ul>
        <p>
            Project configuration files contain options relating to the work that is being performed on a particular
            target application, including:
        </p>
        <ul>
            <li>
                Everything in the <a href="../options/index.html"> Project options</a> tab.
            </li>
            <li>
                Non-UI-related options in individual Burp tools, such as <a href="../tools/proxy/index.html">Proxy</a> and <a href="../../scanner/index.html">Scanner</a>.
            </li>
        </ul>
        <h2 id="loading-and-saving-configuration-files">Loading and Saving Configuration Files</h2>
        <p>
            You can load and save configuration files in various ways:
        </p>
        <ul>
            <li>
                In Burp's <a href="#configuration-library">configuration library</a>, you can export or import configurations as configuration files.
            </li>
            <li>
                From the Burp menu, you can load or save configuration files for all user-level or project-level
                options.
            </li>
            <li>
                From individual configuration panels throughout Burp, you can use the "Options" button to load or save
                the configuration for just that panel.
            </li>
            <li>
                In the <a href="index.html#startup-wizard"> startup wizard</a>, when creating or reopening
                a project, you can specify a configuration file from which to load project-level options.
            </li>
            <li>
                When starting Burp from the command line, you can use <a href="launching-from-command-line.html#command-line-arguments"> command line arguments</a> to specify one or more
                configuration files from which to load user-level or project-level options.
            </li>
            <li>
                <a href="../tools/extender.html">Burp extensions</a> can load or save configuration file contents via the API.
            </li>
        </ul>
        <h2 id="configuration-file-format">Configuration File Format</h2>
        <p>
            Configuration files use the JSON format. The structure and naming scheme used within the JSON correspond to
            the way that options are presented within the Burp UI. The easiest way to generate a configuration file for
            a particular purpose is to create the desired configuration within the Burp UI and <a href="#loading-and-saving-configuration-files">save a configuration file</a> from it. If preferred, you can also
            hand-edit an existing configuration file, since the contents are human-readable and self-documenting.
        </p>
</div>
</section>
</body>
</html>