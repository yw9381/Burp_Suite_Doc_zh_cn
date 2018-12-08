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
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Options</h1>
        <p>
            Burp contains a large number of Suite-wide options that affect the behavior of all tools. These are divided
            into project-level and user-level options.
        </p>
        <p>
            Some options can be defined at both the project and user level. For these options, you can configure your
            normal options at the user level, and then override these if required on a per-project basis. For example,
            you might normally use a corporate LAN proxy to connect to the Internet, and you can configure this in your
            user-level settings. For particular projects, when testing an internal application or on site at a
            particular client, you might need to use a different upstream proxy or none at all. You can configure this
            in your project-level settings for the relevant projects.
        </p>
        <h3>Project Options</h3>
        <p>
            Project-level options are stored within the <a href="../getting-started/projects.html#工程文件">Burp project
            file</a> for disk-based projects. They can also be saved and loaded from project <a href="../getting-started/configuration.html">configuration files</a>.
        </p>
        <div class="rounded-corner-box">
            <p>
                Use the links below for help on each group of project-level options:
            </p>
            <ul class="link-list">
                <li>
                    <a href="connections.html">Connections</a>
                </li>
                <li>
                    <a href="http.html">HTTP</a>
                </li>
                <li>
                    <a href="ssl.html">SSL</a>
                </li>
                <li>
                    <a href="sessions/index.html">Sessions</a>
                </li>
                <li>
                    <a href="misc-project.html">Misc</a>
                </li>
            </ul>
        </div>
        <h3>User Options</h3>
        <p>
            User-level options are stored within the local installation of Burp, and are automatically reloaded each
            time Burp starts. They can also be saved and loaded from <a href="../getting-started/configuration.html"> configuration files</a>.
        </p>
        <div class="rounded-corner-box">
            <p>
                Use the links below for help on each group of user-level options:
            </p>
            <ul class="link-list">
                <li>
                    <a href="connections.html">Connections</a>
                </li>
                <li>
                    <a href="ssl.html">SSL</a>
                </li>
                <li>
                    <a href="display.html">Display</a>
                </li>
                <li>
                    <a href="misc-user.html">Misc</a>
                </li>
            </ul>
        </div>
    </div>
</section>
</body>
</html>