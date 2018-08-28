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
            <a href="issue-activity.html">Issue Activity</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Issue Activity</h1>
<p>
            The issue activity tab contains a sequential record of the Scanner's activity in finding new issues and
            updating existing issues. This is useful for various purposes:
        </p>
        <ul>
            <li>
                Monitoring the results of a scan in progress.
            </li>
            <li>
                Manually reviewing new issues as they are reported.
            </li>
            <li>
                Viewing details of deferred interactions with the <a href="../../collaborator/index.html">Burp Collaborator</a> server.
            </li>
        </ul>
        <p>
            Each item in the issue activity table contains the following details:
        </p>
        <ul>
            <li>
                An index number for the item, reflecting the order in which items were added.
            </li>
            <li>
                The time that the activity occurred.
            </li>
            <li>
                The action that was performed (e.g. "Issue found" or "Evidence added").
            </li>
            <li>
                The issue type.
            </li>
            <li>
                The host and URL path for the issue.
            </li>
            <li>
                The insertion point for the issue, where applicable.
            </li>
            <li>
                The severity and confidence of the issue.
            </li>
        </ul>
        <p>
            You can select an item in the table to view the full details of the associated issue.
        </p>
        <p>
            <strong>Note:</strong> When an item is selected, the issue is displayed with all of its current details.
            These may differ from the original details at the time that the activity was recorded - for example, if the
            user has modified the issue's severity or confidence, or if additional evidence for the issue was
            subsequently captured.
        </p>
        <p>
            You can use the context menu on the issue activity table to perform various actions on the selected
            item(s):
        </p>
        <ul>
            <li>
                <strong>Add comment</strong> - You can use this function to add a comment to the selected item(s). See <a href="#issue-activity-annotations"> Annotations</a> for more details.
            </li>
            <li>
                <strong>Highlight</strong> - You can use this function to apply a highlight to the selected item(s). See <a href="#issue-activity-annotations"> Annotations</a> for more details.
            </li>
            <li>
                <strong>Set severity</strong> - This lets you reassign the severity level of the issue. You can set the
                severity to high, medium, low, or informational. You can also flag the issue as a false positive.
            </li>
            <li>
                <strong>Set confidence</strong> - This lets you reassign the confidence level of the issue. You can set
                the confidence to certain, firm or tentative.
            </li>
            <li>
                <strong>Report selected issues</strong> - This starts Burp Scanner's <a href="../scanning/reporting-results.html">reporting
                wizard</a>, to generate a formal report of the selected issues.
            </li>
        </ul>
        <h2 id="issue-activity-annotations">Issue activity annotations</h2>
        <p>
            You can annotate issue activity items by adding comments and highlights. This can be useful to flag up
            interesting items for further investigation.
        </p>
        <p>
            You can add highlights in two ways:
        </p>
        <ul>
            <li>
                You can highlight individual items using the drop-down menu on the left-most table column.
            </li>
            <li>
                You can highlight one or more selected items using the "Highlight" item on the context menu.
            </li>
        </ul>
        <p>
            You can add comments in two ways:
        </p>
        <ul>
            <li>
                You can double-click the relevant entry, within the Comment column, to add or edit a comment in-place.
            </li>
            <li>
                You can comment one or more selected items using the "Add comment" item on the context menu.
            </li>
        </ul>
    </div>
</section>
</body>
</html>