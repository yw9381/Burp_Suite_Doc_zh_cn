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
            <a href="index.html">Scanning Web Sites</a>
        </li>
        <li>
            <a href="audit-items.html">Audit Items</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Audit Items View</h1>
<p>
            You can access the audit items view from the Burp <a href="../dashboard/index.html">dashboard</a> by opening the <a href="../dashboard/task-details.html">task details window</a> for a scanning task that includes auditing.
        </p>
<p>
            The following details about each item are shown:
        </p>
        <ul>
            <li>
                An index number for the item.
            </li>
            <li>
                The destination protocol, host and URL.
            </li>
            <li>
                The current status of the item.
            </li>
            <li>
                The progress completed for the various <a href="../../scanner/auditing.html#audit-phases">phases of the audit</a>, as applicable (passive, active, and JavaScript analysis).
            </li>
            <li>
                The number of <a href="../tools/target/site-map/index.html#issues-view">issues</a> identified for the item, categorized by severity.
            </li>
            <li>
                The number of requests made while auditing the item. Note that this is not a linear function of the
                number of insertion points - observed application behavior feeds back into subsequent requests,
                just as it would for a human tester.
            </li>
            <li>
                The number of network errors encountered.
            </li>
            <li>
                The number of <a href="../../scanner/auditing.html#insertion-points"> insertion points</a> created for the item.
            </li>
        </ul>
        <p>
            This information lets you easily monitor the progress of individual audit items. If you find that some scans
            are progressing too slowly, you can understand the reasons why, such as large numbers of insertion points,
            slowness in application responses, network errors, etc. Given this information, you can then take action to
            optimize your scans, by changing the configuration for <a href="audit-options.html#audit-optimization">audit optimization</a>, the <a href="audit-options.html#issues-reported">issues</a> being tested, or <a href="audit-options.html#insertion-point-types"> insertion points</a>.
        </p>
        <p>
            You can double-click any item to display the issues identified so far, and view the base
            request and response for the item.
        </p>
        <p>
            You can use the context menu to perform various actions to control the audit process.
            The exact options that are available depend upon the status of the selected item(s), and include:
        </p>
        <ul>
            <li>
                <strong>Show details</strong> - This opens a window showing the issues identified so far, and the base
                request and response for the item.
            </li>
            <li>
                <strong>Cancel</strong> - This cancels the selected item(s) so they will not be audited. If auditing is already in progress, there will typically be a short delay while the pending requests are completed, and
                the item is fully canceled.
            </li>
            <li>
                <strong>Audit again</strong> - This duplicates the selected item(s) and adds these to the end of the
                list.
            </li>
            <li>
                <strong>Add comment</strong> - You can use this function to add a comment to the selected item(s). See <a href="#audit-items-annotations"> Annotations</a> for more details.
            </li>
            <li>
                <strong>Highlight</strong> - You can use this function to apply a highlight to the selected item(s). See <a href="#audit-items-annotations"> Annotations</a> for more details.
            </li>
            <li>
                <strong>Send to ...</strong> - These options are used to send the base request for the selected item to
                other Burp tools.
            </li>
        </ul>
        <h2 id="audit-items-annotations">Audit items annotations</h2>
        <p>
            You can annotate audit items by adding comments and highlights. This can be useful to flag up
            interesting items for further investigation or to help manage your manual workflow.
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