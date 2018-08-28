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
            <a href="index.html">Dashboard</a>
        </li>
        <li>
            <a href="task-execution-settings.html">Task Execution Settings</a>
        </li>
    </ol>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Task Execution Settings</h1>
<p>
            Burp Suite lets you configure multiple automated tasks simultaneously. Executing a large volume of work in parallel is liable to cause problems, either in your own machine (by exhausting CPU, memory, or your network connection) or in the applications being tested. Burp helps to avoid this happening by managing the execution of tasks and the way in which resources are assigned to them.
        </p>
        <p>
            The task execution settings can be accessed by clicking the gear icon at the top of the Tasks panel on the Burp <a href="index.html">Dashboard</a>.
        </p>
        <h2 id="task-auto-start">Task auto-start</h2>
        <p>
            You can individually pause and resume tasks in Burp's <a href="index.html">Dashboard</a>. You can also configure whether to automatically start new tasks as they are created. The following options are available:
        </p>
        <ul>
            <li>
                Create new tasks paused.
            </li>
            <li>
                Create new tasks running.
            </li>
        </ul>
        <h2 id="resource-pools">Resource pools</h2>
        <p>
            A resource pool is a grouping of tasks that share a quota of network resources. Each resource pool can be configured with its own throttling settings which control the number of requests that can be made concurrently, or the rate at which requests can be made, or both.
        </p>
        <p>
            Each task is assigned to a resource pool when it is created, and tasks can be moved between resource pools at any time.
        </p>
        <p>
            Using resource pools is particularly useful if you are testing different applications that tolerate automated requests at different rates. They are also useful to prioritize different areas of your testing. For example, you might create one task performing a full crawl and audit of an application, and let this run in the background with a small number of concurrent requests; you might create another task for auditing specific individual requests that you select, and let this run with a larger number of concurrent requests to give it priority.
        </p>
    </div>
</section>
</body>
</html>