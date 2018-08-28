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
            <a href="projects.html">Burp Projects</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Working With Burp Projects</h1>
        <p>
            Burp projects are used to manage your work on different tasks or target applications. You can create two
            types of Burp projects:
        </p>
        <ul>
            <li>
                <strong>Temporary projects</strong> are useful for quick tasks where your work doesn't need to be saved.
                All data is held in memory, and is lost when Burp exits.
            </li>
            <li>
                <strong>Disk-based projects</strong> allow you to save your work and resume it later. All data is held
                on disk in a project file.
            </li>
        </ul>
        <h2 id="project-files">Project Files</h2>
        <p>
            Burp project files hold all of the data and configuration for a particular piece of work. Data is saved
            incrementally into the file as you work. There is no need to specifically "save" your work when you are
            finished.
        </p>
        <p>
            You can reopen an existing project when Burp starts, using the <a href="index.html#startup-wizard">startup wizard</a> or <a href="launching-from-command-line.html#command-line-arguments"> command line arguments</a>. Burp will reload the
            project's data and configuration, and you can resume working where you left off.
        </p>
        <p>
            <strong>Note:</strong> Testing of some applications can generate significant amounts of data, and so Burp
            project files can potentially grow to be very large (e.g. several gigabytes in size). You should ensure that
            you have sufficient free disk space available when using Burp project files.
        </p>
        <h3 id="saving-a-copy-of-a-project">Saving a Copy of a Project</h3>
        <p>
            You can save a copy of the current project into a new project file by selecting "Save copy of project" from
            the Burp menu.
        </p>
        <p>
            You can choose the tools whose data you want to be included in the new project file, and whether you only
            want to save <a href="../tools/target/scope.html">in-scope items</a>.
        </p>
        <p>
            This feature can be useful to create a smaller project file after you have refined your project scope, or
            deleted some unwanted data.
        </p>
        <p>
            You can continue using Burp while the new project is being saved, although you may experience some brief
            delays if you try to perform an operation on data that Burp is in the process of saving, to prevent any data
            corruption.
        </p>
        <h3 id="saving-the-burp-collaborator-identifier">Saving the Burp Collaborator Identifier</h3>
        <p>
            When saving a copy of a project, you will be prompted whether to include within the project file the unique
            identifier that Burp uses to retrieve any ongoing <a href="../../collaborator/index.html">Burp Collaborator</a> interactions that are associated with the project. If two instances of Burp share the same identifier in
            ongoing work, then some Collaborator-based issues may be missed or incorrectly reported. You should not
            include the Collaborator identifier if you plan to pass the project file on to someone else and you do not
            want them to be able to receive details of any ongoing Collaborator interactions that are associated with
            your testing.
        </p>
        <h3 id="importing-projects">Importing Projects</h3>
        <p>
            If you are using a disk-based project, then you can import another project into the current project by
            selecting "Import project" from the Burp menu.
        </p>
        <p>
            You can choose the tools whose data you want to import from the project file.
        </p>
        <p>
            You can continue using Burp while the project is being imported, although you may experience some brief
            delays if you try to perform an operation on data that Burp is in the process of importing, to prevent any
            data corruption.
        </p>
    </div>
</section>
</body>
</html>