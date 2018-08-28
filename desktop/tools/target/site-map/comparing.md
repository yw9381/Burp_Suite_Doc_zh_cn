<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../../../../../styles/css/ps.css">
</head>
<body>
<section class="container ps-breadcrumbs">
    <ol>
        <li>
            <a href="https://support.portswigger.net/">Support Center</a>
        </li>
        <li>
            <a href="../../../../index.html">Documentation</a>
        </li>
        <li>
            <a href="../../../index.html">Desktop Editions</a>
        </li>
        <li>
            <a href="../../index.html">Tools</a>
        </li>
        <li>
            <a href="../index.html">Target</a>
        </li>
        <li>
            <a href="index.html">Target Site Map</a>
        </li>
        <li>
            <a href="comparing.html">Comparing Site Maps</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>&nbsp;<span class="pro-edition-feature-label">Community</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Comparing Site Maps</h1>
<p>
            You can use this function to compare two site maps and highlight differences. This feature can be used in
            various ways to help find different types of access control vulnerabilities, and identify which areas of a
            large application warrant close manual inspection. Some typical use-cases for this functionality are as
            follows:
        </p>
        <ul>
            <li>
                You can map the application using accounts with different privilege levels, and compare the results to
                identify functionality that is visible to one user but not the other.
            </li>
            <li>
                You can map the application using a high-privileged account, and then re-request the entire site map
                using a low-privileged account, to identify whether access to privileged functions is properly
                controlled.
            </li>
            <li>
                You can map the application using two different accounts of the same type, to identify cases where
                user-specific identifiers are used to access sensitive resources, and determine whether per-user data is
                properly segregated.
            </li>
        </ul>
        <p>
            You can access the "Compare site maps" feature using the context menu on the main <a href="index.html">site map</a>. This opens a wizard that lets you configure the <a href="#site-map-sources">sources</a> of the site maps you want to compare, how requests should be <a href="#request-matching">matched</a> between the site maps, and how the <a href="#response-comparison">response
            comparison</a> should be done. Burp then carries out the comparison and displays the <a href="#comparison-results">results</a> for you to review.
        </p>
        <h2 id="site-map-sources">Site Map Sources</h2>
        <p>
            To perform a site map comparison, you need to select the sources of the site maps you want to compare. The
            following options are available:
        </p>
        <ul>
            <li>
                The current site map that appears in Burp's Target tab.
            </li>
            <li>
                <span class="pro-edition-feature-label">Professional</span>
                A site map loaded from a Burp project file or state file that you saved earlier. This option is useful
                when you have already mapped an application using accounts with different privilege levels.
            </li>
            <li>
                Either of the above, re-requested in a different session context. This option is useful when you have
                mapped an application using a high-privileged account, and want to re-request the entire site map using
                a low-privileged account, to identify whether access to privileged functions is properly controlled.
            </li>
        </ul>
        <p>
            You can choose to include all of the site map's contents, or you can restrict only to selected or in-scope
            items.
        </p>
        <p>
            If you are re-requesting a site map in a different session context, the following points should be
            noted:
        </p>
        <ul>
            <li>
                You must first create suitable <a href="../../../options/sessions/index.html#session-handling-rules">session handling rules</a> so that the requests made during the comparison occur within the desired session context. These rules
                must be configured to apply to requests made by the <a href="../index.html">Target</a> tool. In the
                simplest cases, you may be able to use a session handling rule that updates requests from the <a href="../index.html">Target</a> tool with cookies from Burp's <a href="../../../options/sessions/index.html#cookie-jar">cookie jar</a>, and use your browser to acquire the desired
                session context before performing the comparison. In other cases, you may need to create more complex
                session handling rules to validate the current session context and log in again when required - see the <a href="../../../options/sessions/index.html"> session handling help</a> for further details.
            </li>
            <li>
                It is generally desirable to exclude from the comparison any requests that are likely to disrupt the
                session context - for example, login, logout, user impersonation functions, etc. You can do this using
                the options to restrict the comparison only to selected or in-scope items.
            </li>
        </ul>
        <h2 id="request-matching">Request Matching</h2>
        <p>
            To perform the comparison, Burp works through each request in the first site map, and matches this with a
            request in the second site map, and vice versa. You can configure the details of how the request matching is
            done, to tailor this to features of the target application.
        </p>
        <p>
            You can select which of the following items are used for matching requests:
        </p>
        <ul>
            <li>
                <strong>URL file path</strong> - This must always be included in the matching process, and is the
                minimal basis for determining that two requests are equivalent.
            </li>
            <li>
                <strong>HTTP method</strong> - This should generally be included, since in most cases applications use
                GET and POST requests to the same URL for different purposes.
            </li>
            <li>
                <strong>URL query string</strong> - This should generally be included, since requests with different URL
                parameters are generally used for different application functions. The sub-option to <strong>match parameter names only</strong> causes Burp to match query
                strings with the same parameter names but different values. This is often desirable (for
                example, if parameter values contain user-specific or ephemeral data), but you should disable
                this option if, for example, parameter names are used to identify the application function that
                is being performed (e.g. action=CreateUser). The sub-option to <strong>ignore these parameters</strong> lets you specify parameters that should be completely
                ignored when matching query strings.
            </li>
            <li>
                <strong>Request body</strong> - This should generally be included, since requests with different body
                parameters are generally used for different application functions. The same sub-options are available as
                are described for URL query string parameters.
            </li>
            <li>
                <strong>Request headers</strong> - This option causes requests with different HTTP headers after the
                first line to be non-matched. This behavior is not usually desirable, because browsers may modify the
                headers in different requests for many reasons having nothing to do with application-level
                functionality. However, you can enable this option if, for example, the application uses
                script-generated requests with custom HTTP headers that are used to identify the function of requests.
            </li>
        </ul>
        <p>
            The default options will work well in most situations, and will match requests based on URL file path, HTTP
            method and the names of parameters in the query string and message body.
        </p>
        <h2 id="response-comparison">Response Comparison</h2>
        <p>
            The responses to matched requests are compared to identify any differences. You can configure the details of
            how the response comparison is done, to tailor this to features of the target application.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Response headers</strong> - You can optionally include all headers (except for specific
                exclusions), or include only specific headers. It is generally desirable to include response headers
                whose values reflect aspects of the application's functionality and state (such as Set-Cookie).
            </li>
            <li>
                <strong>Form field values</strong> - You can optionally include all form field values (except for
                specific exclusions), or include only specific values. Form field values often reflect differences that
                are relevant to identifying access control problems, and should generally be highlighted for manual
                review. You can then modify this setting to exclude irrelevant fields, and repeat the comparison.
            </li>
            <li>
                <strong>Whitespace</strong> - You can optionally ignore whitespace-only variations in responses, since
                these are not generally relevant to access control issues.
            </li>
            <li>
                <strong>MIME type</strong> - You can optionally skip comparisons of non-text content. This is generally
                desirable since such comparisons are computationally intensive, and these responses are likely to
                contain static content such as images, which are not relevant to access control issues.
            </li>
        </ul>
        <p>
            The default options will work in most situations. These options ignore various common HTTP headers and form
            fields that have ephemeral values, and also ignore whitespace-only variations in responses. The default
            options are designed to reduce the noise generated by inconsequential variations in responses, allowing you
            to focus attention on differences that are more likely to matter.
        </p>
        <h2 id="comparison-results">Comparison Results</h2>
        <p>
            The comparison results show both site maps together, with relevant differences highlighted in the tree and
            table views. Items that have been added, deleted or modified between the two maps are colorized accordingly.
            The table view also contains a "Diff count" column, which represents the minimum number of text edits
            required to "convert" the response in Map 1 to the matched response in Map 2.
        </p>
        <p>
            When you select an item in the tree or table of one of the maps, the selection in the other map is
            automatically updated to show the same branches of the tree, or select the same item in the table. You can
            change this behavior by unchecking the "Sync selection" option.
        </p>
        <p>
            The full requests and responses for the selected items are shown in the request/response viewers, and
            relevant differences are highlighted within the responses.
        </p>
        <p>
            There is a single <a href="index.html#site-map-display-filter">display filter</a> that applies to both maps, which
            by default shows all items.
        </p>
        <p>
            Interpreting the results of a site map comparison requires human intelligence, and an understanding of the
            meaning and context of specific application functions. For example:
        </p>
        <ul>
            <li>
                Some differences between responses are security neutral. For example, the application home page of two
                different users may contain different display names, links, and other user-specific content. These
                differences are to be expected, and they are neutral as to the effectiveness of the application's access
                controls, since they only concern the user interface.
            </li>
            <li>
                Some differences indicate that access controls are working as designed. For example, an administrative
                user may be able access a privileged function, while a low privileged user sees a "Not authorized"
                message.
            </li>
            <li>
                In some cases, the same response being returned to two users indicates a security issue. For example, an
                administrator might have a link to a page containing sensitive details about application users; a low
                privileged user who knows the relevant URL might be able to view the same page.
            </li>
            <li>
                In other cases, the same response being returned to two users is security neutral. For example, a public
                search function in an application might be designed to return the same results regardless of user
                context.
            </li>
            <li>
                In some cases, differences resulting from per-user UI customization (such as different display names and
                links) are present on many different pages, and it is other samenesses and differences on those other
                pages that are relevant to assessing access controls.
            </li>
        </ul>
        <p>
            All of these scenarios may coexist in the same application, making the task of identifying actual access
            control problems more challenging. The only way to do this is through a manual review of the comparison
            results. Burp gives you several ways of making this process easier:
        </p>
        <ul>
            <li>
                You can use the <a href="index.html#site-map-display-filter">display filter</a> to filter out items containing
                (or not containing) specific expressions. For example, if most admin functions return a "Not authorized"
                message when requested by a low privileged user, you can hide these responses from the map, leaving only
                other items that may involve oversights in the application's privilege model.
            </li>
            <li>
                The "Diff count" column in the table view is a useful place to start. For example, if most pages of the
                application contain two differences resulting from per-user UI customization, then you can sort
                responses by diff count and look for divergences from this value. Alternatively, if you have a found one
                access control vulnerability with a particular diff count, you can look for other responses with the
                same or similar count, which may represent similarly vulnerable functions.
            </li>
            <li>
                Having reviewed the comparison results, you might determine that some regular differences are arising
                from comparisons of response headers or form field values that are not relevant, and should be excluded
                from the comparison. Or you might find that some requests have been wrongly matched based on query
                string or body parameters. If this happens, you can go back and tweak the <a href="#response-comparison"> response comparison</a> or <a href="#request-matching">request matching</a> options, and re-run the
                comparison (there is no need to re-request the site maps when changing these options).
            </li>
        </ul>
        <p>
            The challenges involved in evaluating access controls are the reason why fully automated tools are so
            ineffective at identifying access control vulnerabilities. In practice, tools that aim to do so generate
            mostly noise and are highly prone to false positives and negatives. In contrast, Burp does not relieve you
            of the task of closely examining the application's functionality, and evaluating whether access controls are
            being properly applied in each case. What the site map comparison feature does is to automate as much of the
            process as possible, giving you all the information you need in a clear form, and letting you apply your
            knowledge of the application's functionality to identify any actual vulnerabilities.
        </p>
    </div>
</section>
</body>
</html>