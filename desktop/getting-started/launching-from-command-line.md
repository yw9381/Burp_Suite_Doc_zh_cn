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
            <a href="launching-from-command-line.html">Command Line</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
    <span class="pro-edition-feature-label">Professional</span>
    &nbsp;
    <span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Launching Burp Suite From the Command Line</h1>
        <p>
            To launch Burp Suite from the command line, you should download the plain JAR file version of Burp. The JAR file can be executed using Java, and there is no need to unpack the contents of the JAR file itself.
        </p>
        <p>
            First check whether Java is installed:
        </p>
        <ul>
            <li>
                At a command prompt, type:
                <span class="InlineCode">java -version</span>
            </li>
            <li>
                If Java is installed, you will see a message like:
                <span class="InlineCode">java version "1.8.0_162"</span>
                . To run Burp, you will need a version of Java that is 1.8 or later.
            </li>
            <li>
                If Java is not installed, or if your version of Java is older than 1.8, you will need to install Java. <a href="http://www.oracle.com/technetwork/java/javase/downloads/"> Download the latest Java
                Runtime Environment (JRE)</a>, run the installer, and then open a new command prompt and start
                again.
            </li>
        </ul>
        <p>
            With Java installed, in your
            command prompt type a command like:
        </p>
        <p class="InlineCode">
            java -jar -Xmx4g /path/to/burp.jar
        </p>
        <p>
            where
            <span class="InlineCode">4</span>
            is the amount of memory (in Gb) that you want to assign to Burp, and
            <span class="InlineCode"> /path/to/burp.jar </span>
            is the location of the Burp JAR file on your computer.
        </p>
        <p>
            If everything is working, a splash screen should display for a few seconds, and then the main startup wizard
            window should appear. If nothing happens, or if an error message appears, please refer to the <a href="../troubleshooting.html">troubleshooting help</a>.
        </p>
        <h2 id="command-line-arguments">Command Line Arguments</h2>
        <p>
            Various command line arguments are available to control Burp's behavior on startup. For example, you can
            tell Burp to prevent reloading of <a href="../tools/extender.html">extensions</a>, open a particular <a href="projects.html#project-files"> Burp project file</a>, or load a particular <a href="configuration.html">configuration file</a>.
        </p>
        <p>
            You can view a list of available options using the command line argument
            <span class="InlineCode">--help</span>
            .
        </p>
    </div>
</section>
</body>
</html>