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
            <a href="index.html">Useful Functions</a>
        </li>
        <li>
            <a href="task-scheduler.html">Task Scheduler</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Task Scheduler</h1>
<p>
            You can use the task scheduler to automatically start and stop certain tasks at defined times and intervals.
            You can use the task scheduler to start and stop certain automated tasks out of hours while you are not
            working, and to save your work periodically or at a specific time.
        </p>
        <p>
            To access this function, select an HTTP request anywhere within Burp, or any part of the target <a href="../tools/target/site-map/index.html">site map</a>, and choose "Schedule task" within "Engagement tools" in the
            context menu. Alternatively, you can add a new task directly via the Scheduled Tasks panel within <a href="../options/misc-project.html#scheduled-tasks">miscellaneous project options</a>.
        </p>
        <p>
            Creating a new task will open a wizard that lets you configure the details of the task. The following types
            of tasks are available:
        </p>
        <ul>
            <li>
                Scan from a URL
            </li>
            <li>
                Pause active scanning
            </li>
            <li>
                Resume active scanning
            </li>
            <li>
                Spider from a URL
            </li>
            <li>
                Pause spidering
            </li>
            <li>
                Resume spidering
            </li>
            <li>
                Save state
            </li>
        </ul>
        <p>
            Depending on the type of task, you can also configure a URL (e.g. for scanning) or a file (e.g. to save
            state).
        </p>
        <p>
            Each task needs to have a start time configured. Optionally, you can configure the task to repeat at a
            defined interval.
        </p>
    </div>
</section>
</body>
</html>