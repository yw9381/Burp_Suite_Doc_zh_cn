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
            <a href="../index.html">Intruder</a>
        </li>
        <li>
            <a href="index.html">Payloads</a>
        </li>
        <li>
            <a href="types.html">Types</a>
        </li>
    </ol>
</section>
<section class="container edition-labels">
	<span class="pro-edition-feature-label">Professional</span>
</section>
<section class="maincontainer">
    <div class="container main">
        <h1>Payload Types</h1>
        <p>
            Burp Intruder includes the following payload types:
        </p>
        <ul class="link-list">
            <li>
                <a href="#simple-list">Simple list</a>
            </li>
            <li>
                <a href="#runtime-file">Runtime file</a>
            </li>
            <li>
                <a href="#custom-iterator">Custom iterator</a>
            </li>
            <li>
                <a href="#character-substitution">Character substitution</a>
            </li>
            <li>
                <a href="#case-modification">Case modification</a>
            </li>
            <li>
                <a href="#recursive-grep">Recursive grep</a>
            </li>
            <li>
                <a href="#illegal-unicode">Illegal Unicode</a>
            </li>
            <li>
                <a href="#character-blocks">Character blocks</a>
            </li>
            <li>
                <a href="#numbers">Numbers</a>
            </li>
            <li>
                <a href="#dates">Dates</a>
            </li>
            <li>
                <a href="#brute-forcer">Brute forcer</a>
            </li>
            <li>
                <a href="#null-payloads">Null payloads</a>
            </li>
            <li>
                <a href="#character-frobber">Character frobber</a>
            </li>
            <li>
                <a href="#bit-flipper">Bit flipper</a>
            </li>
            <li>
                <a href="#username-generator">Username generator</a>
            </li>
            <li>
                <a href="#ecb-block-shuffler">ECB block shuffler</a>
            </li>
            <li>
                <a href="#extension-generated">Extension-generated</a>
            </li>
            <li>
                <a href="#copy-other-payload">Copy other payload</a>
            </li>
        </ul>
        <h2 id="simple-list">Simple List</h2>
<p>
            This is the simplest payload type, and lets you configure a simple list of strings that are used as
            payloads.
        </p>
        <p>
            You can manually add items to the list using the text box and the "Add" button, or you can paste a list from
            the clipboard, or load from file.
        </p>
        <h3 id="predefined-payload-lists">Predefined Payload Lists</h3>
        <p>
        <span class="pro-edition-feature-label">Professional</span>
            In various payload types that employ lists of items, you can use the "Add from list" drop-down menu to add
            predefined lists of useful payloads, such as common usernames and passwords, fuzz strings, etc. Note that
            you can customize the predefined payload lists using the &quot;Configure predefined payload lists&quot; item
            from the Intruder menu. You can choose your own directory containing payload files, and also copy all of
            Burp's built-in payload lists into your custom directory, to edit or use alongside your own payloads
            lists.
        </p>
        <h2 id="runtime-file">Runtime File</h2>
        <p>
            This payload type lets you configure a file from which to read payload strings at runtime. This is useful
            when a very large list of payloads is needed, to avoid holding the entire list in memory. One payload is
            read from each line of the file, hence payloads may not contain newline characters.
        </p>
        <h2 id="custom-iterator">Custom Iterator</h2>
        <p>
            This payload type lets you configure multiple lists of items, and generate payloads using all permutations
            of items in the lists. It provides a powerful way to generate custom permutations of characters or other
            items according to a given template. For example, a payroll application may identify individuals using a
            personnel number of the form AB/12; you may need to iterate through all possible personnel numbers to obtain
            the details of all individuals.
        </p>
        <p>
            The custom iterator defines up to 8 different &quot;positions&quot; which are used to generate permutations.
            Each position is configured with a list of items, and an optional &quot;separator&quot; string, which is
            inserted between that position and the next. In the example already mentioned, positions 1 and 2 would be
            configured with the items A - Z, positions 3 and 4 with the items 0 - 9, and position 2 would be set with
            the separator character /. When the attack is executed, the custom iterator iterates through each item in
            each position, to cover all possible permutations. Hence, in this example, the total number of payloads is
            equal to 26 * 26 * 10 * 10.
        </p>
        <p>
            The list items can be edited in the same way as described for the <a href="#simple-list">simple list</a> payload type. The &quot;Clear all&quot; button removes all configuration from all positions of the custom
            iterator.
        </p>
        <p>
            The &quot;Choose a preset scheme&quot; drop-down menu can be used to select a preconfigured setup for the
            custom iterator. These can be used for various standard attacks or modified for customized attacks.
            Available schemes are &quot;directory / file . extension&quot;, which can be used to generate URLs, and
            &quot;password + digit&quot; which can be used to generate an extended wordlist for password guessing
            attacks.
        </p>
        <h2 id="character-substitution">Character Substitution</h2>
        <p>
            This payload type lets you configure a list of strings and apply various character substitutions to each
            item. It may be useful in password guessing attacks, for generating common variations on dictionary
            words.
        </p>
        <p>
            The UI lets you configure a number of character substitutions. When the attack is executed, the payload type
            works through each of the configured list items in turn. For each item, it generates a number of payloads,
            to include all permutations of substituted characters according to the defined substitutions. For example,
            with the default substitution rules (which include e &gt; 3 and t &gt; 7), the item "peter" will generate
            the following payloads:
        </p>
        <p class="InlineCode">
            peter<br>
            p3ter<br>
            pe7er<br>
            p37er<br>
            pet3r<br>
            p3t3r<br>
            pe73r<br>
            p373r
        </p>
        <p>
            The list items can be edited in the same way as described for the <a href="#simple-list">simple list</a> payload type.
        </p>
        <h2 id="case-modification">Case Modification</h2>
        <p>
            This payload type lets you configure a list of strings and apply various case modifications to each item.
            This may be useful in password guessing attacks, for generating case variations on dictionary words.
        </p>
        <p>
            The following case modification rules can be selected:
        </p>
        <ul>
            <li>
                <strong>No change</strong> - The item is used without being modified.
            </li>
            <li>
                <strong>To lower case</strong> - All letters in the item are converted to lower case.
            </li>
            <li>
                <strong>To upper case</strong> - All letters in the item are converted to upper case.
            </li>
            <li>
                <strong>To Propername</strong> - The first letter in the item is converted to upper case, and the
                subsequent letters are converted to lower case.
            </li>
            <li>
                <strong>To ProperName</strong> - The first letter in the item is converted to upper case, and the
                subsequent letters are not changed.
            </li>
        </ul>
        <p>
            The payload type works through each of the configured list items in turn, adjusting the case of characters
            within each item. Duplicate payloads are discarded. For example, if all modification options are selected,
            the item "Peter Wiener" will generate the following payloads:
        </p>
        <p class="InlineCode">
            Peter Wiener<br>
            peter wiener<br>
            PETER WIENER<br>
            Peter wiener
        </p>
        <p>
            The list items can be edited in the same way as described for the <a href="#simple-list">simple list</a> payload type.
        </p>
        <h2 id="recursive-grep">Recursive Grep</h2>
        <p>
            This payload type lets you extract each payload from the response to the previous request in the attack. It
            is useful in some situations where you need to work recursively to extract useful data or deliver an
            exploit.
        </p>
        <p>
            The payload type works together with the <a href="../options.html#grep-extract">extract grep</a> function, which is used to extract part of a response containing interesting information. The text that was
            extracted from the previous response in the attack is used as the payload for the current request.
        </p>
        <p>
            This can be used for various tasks. For example, it may be possible to extract the contents of a database
            via SQL injection by recursively injecting queries of the form:
        </p>
        <p  class="InlineCode">union select name from sysobjects where name &gt; &#39;a&#39;</p>
        <p>
            The server&#39;s error message discloses the name of the first database object:
        </p>
        <p class="InlineCode">
            Syntax error converting the varchar value &#39;accounts&#39; to a column of data type int.
        </p>
        <p>
            The query is then repeated using &#39;accounts&#39; to identify the next object. This task can be easily
            automated using recursive grep payloads to quickly list all of the objects within the database.
        </p>
        <p>
            The following options must be selected:
        </p>
        <ul>
            <li>
                <strong>Extract grep item from which to derive payloads</strong> - This is the <a href="../options.html#grep-extract">extract grep</a> item that will be used to derive the
                payloads.
            </li>
            <li>
                <strong>Initial payload for first request</strong> - This is the payload to use in the initial request
                (where no prior response is available from which to derive the payload).
            </li>
            <li>
                <strong>Stop if duplicate payload found</strong> - This option causes the attack to stop when the same
                payload is derived twice in succession. This normally indicates that the exercise is complete.
            </li>
        </ul>
        <p>
            Note that because of the nature of this payload type, attacks using it must employ only a single <a href="../options.html#request-engine">request thread</a>.
        </p>
        <h2 id="illegal-unicode">Illegal Unicode</h2>
        <p>
            This payload type can be used to generate illegal Unicode representations of characters. It is sometimes
            effective in bypassing filters designed to block certain characters, for example defenses against file path
            traversal attacks which match on expected encodings of the ../ and ..\ sequences.
        </p>
        <p>
            The payload type operates on a list of items, and generates a number of payloads from each item by replacing
            a specified character within each item with illegal Unicode-encodings of another character. The available options are described below.
        </p>
        <h3>Overlong UTF-8 encodings</h3>
        <p>
            The Unicode encoding scheme allows up to 6 bytes to be used
            to represent a single character. Basic ASCII characters (0x00 - 0x7F) are correctly represented using a
            single byte. However, it is possible to represent these in the Unicode scheme using more than one byte
            (i.e. &quot;overlong&quot; encoding). This option is used to specify whether overlong encoding should be
            used, and if so to set the maximum size that should be used.
        </p>
        <h3>Illegal UTF-8 continuation bytes</h3>
        <p>
            These options are available if a maximum overlong
            UTF-8 length of 2 bytes or more is selected:
        </p>
        <ul>
                    <li>
                        <strong>Do illegal UTF-8</strong> - When a character is encoded with more than one byte, the
                        bytes following the first should take the binary form 10xxxxxx, to designate that they are
                        continuation bytes. However, the most significant bits of the first byte also identify how many
                        continuation bytes will follow, so Unicode decoding routines may safely ignore the first 2 bits
                        of continuation bytes. This means that three illegal variants of each continuation byte are
                        possible, with the binary forms 00xxxxxx, 01xxxxxx and 11xxxxxx. If this option is selected,
                        then 3 additional encodings will be generated for each continuation byte.
            </li>
                    <li>
                        <strong>Maximize permutations in multi-byte encodings</strong> - This option is available if a
                        maximum overlong UTF-8 length of 3 bytes or more is selected, and &quot;Do illegal UTF-8&quot;
                        is selected. If the &quot;maximize permutations&quot; option is not selected, then Burp will
                        work through each continuation byte in turn when generating illegal variants; for each
                        continuation byte, the three illegal variants will be generated and the other continuation bytes
                        will be unchanged. However, if the &quot;maximize permutations&quot; option is selected, then
                        Burp will generate all permutations of illegal variants for continuation bytes - i.e. more than
                        one continuation byte will be modified simultaneously. This feature may be useful in attempting
                        to circumvent advanced pattern-matching controls, by generating a much larger number of
                        different illegal encodings.
                    </li>
        </ul>
        <h3>Illegal hex characters</h3>
        <p>
            These options control how the generated byte sequences are
            represented using hexadecimal notation:
        </p>
        <ul>
                    <li>
                        <strong>Do illegal hex</strong> - When the list of illegally-encoded items has been generated
                        using overlong encodings and illegal variants of continuation bytes (if selected), it is
                        possible to modify the hexadecimal encoding of the resulting byte sequences to confuse certain
                        pattern-matching controls. Hex encoding uses the characters A - F to represent the decimal
                        values 10 - 15. However, some hex decoders interpret G as decimal 16, H as decimal 17, etc. So
                        0x1G may be interpreted as decimal 32. Further, if illegal hex characters are used in the first
                        position of a two digit hex code, then the resulting decoding overflows the maximum value of a
                        single byte, and in this situation some hex decoders only use the 8 least significant bits of
                        the resulting number. So 0xG1 may be decoded as decimal 257, which is then interpreted as
                        decimal 1. Each legal two-digit hex code has between 4 and 6 corresponding illegal hex
                        representations which are interpreted as that same hex code if decoded as described above. If
                        the &quot;Do illegal hex&quot; option is selected, then Burp will generate all possible illegal
                        hex encodings of each byte in the list of illegally-encoded items.
            </li>
                    <li>
                        <strong>Maximize permutations in multi-byte encodings</strong> - This option is available if a
                        maximum overlong UTF-8 length of 2 bytes or more is selected, and &quot;Do illegal hex&quot; is
                        selected. If the &quot;maximize permutations&quot; option is not selected, then Burp will work
                        through each byte in turn when generating illegal hex; for each byte, between 4 and 6 illegal
                        hex encodings will be generated and the other bytes will be unchanged. However, if the &quot;maximize
                        permutations&quot; option is selected, then Burp will generate all permutations of illegal hex
                        for all bytes - i.e. more than one byte will be modified simultaneously. This feature may be
                        useful in attempting to circumvent advanced pattern-matching controls, by generating a much
                        larger number of different illegal encodings.
                    </li>
        </ul>
        <h3>Hex formatting</h3>
        <p>
            These options control the appearance of hex-encoded payloads:
        </p>
        <ul>
                    <li>
                        <strong>Use lower case alpha characters</strong> - This option determines whether lower or upper
                        case alphabet characters will be used in hex codes.
            </li>
                    <li>
                        <strong>Add % prefix before each byte</strong> - If this option is selected, then the %
                        character will be inserted before each two digit hex code, to effectively URL-encode the
                        generated payloads.
                    </li>
        </ul>
        <h3>Total encodings</h3>
        <p>
            This option shows a best estimate for the number of encodings, based
            on the rest of the configuration, and also lets you specify a ceiling on the number of illegal encodings
            that will be generated. This can be useful if large overlong encodings are being used or maximum
            permutations have been selected, as these options may generate huge numbers of illegal encodings.
        </p>
        <h3>Match / replace in list items</h3>
        <p>
            These options control the replacement of characters
            within list items:
        </p>
        <ul>
                    <li>
                        <strong>Match character</strong> - This is the character that will be replaced within each list
                        item. You should use a dummy character such as * in your list items, to indicate where
                        replacements should occur.
            </li>
                    <li>
                        <strong>Replace with encodings of</strong> - This is the character for which illegal encodings
                        will be derived, to replace the original match character within each list item. This option can
                        be specified using the ASCII character itself, or the two-digit hex code for the character (e.g.
                        00) - this is useful for specifying non-printable ASCII characters, such as null.
                    </li>
        </ul>
        <p>
            The list items can be edited in the same way as described for the <a href="#simple-list">simple list</a> payload type.
        </p>
        <h2 id="character-blocks">Character Blocks</h2>
        <p>
            This payload type generates payloads based on blocks of a specified character or string. It can be useful in
            detecting buffer overflow and other boundary condition vulnerabilities in software running in a native
            (unmanaged) context. It can also be used to exploit some logic flaws where input of a particular length
            bypasses input filters or triggers an unexpected code path.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Base string</strong> - This is the input string from which the character blocks will be
                generated.
            </li>
            <li>
                <strong>Min length</strong> - This is the size of the smallest block that will be generated.
            </li>
            <li>
                <strong>Max length</strong> - This is the size of the largest block that may be generated.
            </li>
            <li>
                <strong>Step</strong> - This is the increment in the length of each character block.
            </li>
        </ul>
        <h2 id="numbers">Numbers</h2>
        <p>
            This payload type generates numeric payloads within a given range and in a specified format.&nbsp;The options described below are available.
        </p>
        <h4>Number range</h4>
        <p>
            The following options can be configured:
        </p>
        <ul>
                    <li>
                        <strong>Type</strong> - This option specifies whether numbers should be generated in a defined
                        sequence, or at random.
            </li>
                    <li>
                        <strong>From</strong> - If numbers are being generated sequentially, this is the value of the
                        first number that will be generated. Otherwise, it is the smallest possible number that may be
                        randomly generated.
                    </li>
                    <li>
                        <strong>To</strong> - If numbers are being generated sequentially, this the value of the last
                        number that will be generated (or the nearest lower increment of the step value). Otherwise, it
                        is it the highest possible number that may be randomly generated.
                    </li>
                    <li>
                        <strong>Step</strong> - This option is available when numbers are being generated sequentially,
                        and specifies the increment between successive numbers. The value may be negative, in which case
                        the numbers generated will step downwards.
                    </li>
                    <li>
                        <strong>How many</strong> - This option is available when numbers are being generated randomly,
                        and specifies the number of payloads that will be generated. Note that duplicate payloads may be
                        generated.
                    </li>
        </ul>
        <p>
            <strong>Note:</strong> Burp uses double-precision floating point numbers for both the number range
            configuration and the internal state of the payload generator at runtime. Some loss of precision is to be
            expected when dealing with very large numbers or very precise fractional numbers. If you need to cycle
            through a range of numbers containing many total digits (more than approximately 12), then it is more
            reliable to use your <a href="../positions.html">payload positioning markers</a> to highlight a
            sub-portion of the larger number within the attack template, and generate numeric payloads containing
            correspondingly fewer digits. &nbsp;
        </p>
                <h4>Number format</h4>
        <p>
            The following options can be configured:
        </p>
                <ul>
                    <li>
                        <strong>Base</strong> - This option specifies whether numbers should be generated in decimal or
                        hexadecimal form.
                    </li>
                    <li>
                        <strong>Min integer digits</strong> - This is the minimum number of integer digits each number
                        will have. Numbers with fewer integer digits will be padded with zeros on the left hand side.
                    </li>
                    <li>
                        <strong>Max integer digits</strong> - This is the maximum number of integer digits each number
                        will have. Numbers with more integer digits will be truncated, losing their most significant
                        integer digits.
                    </li>
                    <li>
                        <strong>Min fraction digits</strong> - This is the minimum number of fraction digits (after the
                        decimal point) each number will have. Numbers with fewer fraction digits will be padded with
                        zeros on the right hand side. This option is not available when generating hexadecimal numbers.
                    </li>
                    <li>
                        <strong>Max fraction digits</strong> - This is the maximum number of fraction digits (after the
                        decimal point) each number will have. Numbers with more fraction digits will be truncated,
                        losing their least significant fraction digits. This option is not available when generating
                        hexadecimal numbers.
                    </li>
                </ul>
        <p>
            Each of the digits options may be left blank, indicating that no minimum or maximum size should be enforced.
            Examples of numbers generated by the current number format configuration are also shown.
        </p>
        <h2 id="dates">Dates</h2>
        <p>
            This payload type generates date payloads within a given range and in a specified format. This payload type
            may be useful during data mining (e.g. trawling an order book for entries placed on different days) or brute
            forcing (e.g. guessing the date of birth component of a user's credentials).
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>From</strong> - This is the first (and earliest) date that will be generated.
            </li>
            <li>
                <strong>To</strong> - This is the value of the last (and latest) date that will be generated (or the
                nearest lower increment of the step value).
            </li>
            <li>
                <strong>Step</strong> - This is the increment between successive dates, in days, weeks, months or years.
                It must be a positive value.
            </li>
            <li>
                <strong>Format</strong> - This is the format in which the dates should be represented. Several
                predefined date formats can be selected, or a custom date format can be entered in the text field. The examples below illustrate the syntax that can be used to specify custom date formats.
            </li>
        </ul>
                <table class="InlineCode">
                    <tr>
                        <td>
                            E
                        </td>
                        <td>
                            Sat
                        </td>
                    </tr>
                    <tr>
                        <td>
                            EEEE
                        </td>
                        <td>
                            Saturday
                        </td>
                    </tr>
                    <tr>
                        <td>
                            d
                        </td>
                        <td>
                            7
                        </td>
                    </tr>
                    <tr>
                        <td>
                            dd
                        </td>
                        <td>
                            07
                        </td>
                    </tr>
                    <tr>
                        <td>
                            M
                        </td>
                        <td>
                            6
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MM
                        </td>
                        <td>
                            06
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MMM
                        </td>
                        <td>
                            Jun
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MMMM
                        </td>
                        <td>
                            June
                        </td>
                    </tr>
                    <tr>
                        <td>
                            yy
                        </td>
                        <td>
                            03
                        </td>
                    </tr>
                    <tr>
                        <td>
                            yyyy
                        </td>
                        <td>
                            2003
                        </td>
                    </tr>
                    <tr>
                        <td>
                            / . : etc.&nbsp;&nbsp;
                        </td>
                        <td>
                            / . :
                        </td>
                    </tr>
                </table>
        <h2 id="brute-forcer">Brute Forcer</h2>
        <p>
            This payload type generates payloads of specified lengths that contain all permutations of a specified
            character set.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Character set</strong> - The set of characters to be used in the payloads. Note that the total
                number of payloads increases exponentially with the size of this set.
            </li>
            <li>
                <strong>Min length</strong> - The length of the shortest payload.
            </li>
            <li>
                <strong>Max length</strong> - The length of the longest payload.
            </li>
        </ul>
        <h2 id="null-payloads">Null Payloads</h2>
        <p>
            This payload type generates payloads whose value is an empty string.
        </p>
        <p>
            This payload type is useful when an attack requires the same request to be made repeatedly, without any
            modification to the basic template. This can be used for a variety of attacks, for example harvesting
            cookies for sequencing analysis, application-layer denial-of-service attacks where requests are repeatedly
            sent which initiate high-workload tasks on the server, or keeping alive a session token that is being used
            in other intermittent tests.
        </p>
        <p>
            With this payload type, it is not even necessary to use <a href="../positions.html">payload position
            markers</a> in your request template.
        </p>
        <p>
            You can configure Burp to generate a specified number of null payloads, or to continue indefinitely.
        </p>
        <h2 id="character-frobber">Character Frobber</h2>
        <p>
            This payload type operates on a string input and modifies the value of each character position in turn. It
            can operate on the existing base value of each payload position, or on a specified string. It cycles through
            the base string one character at a time, incrementing the ASCII code of that character by one.
        </p>
        <p>
            This payload type is useful when testing which parameter values, or parts of values, have an effect on the
            application&#39;s response. In particular, it can be useful when testing which parts of a complex session
            token are actually being used to track session state. If modifying the value of an individual character
            within the session token still causes your request to be processed within your session, then it is likely
            that this character in the token is not actually being used to track your session.
        </p>
        <h2 id="bit-flipper">Bit Flipper</h2>
        <p>
            This payload type operates on an input and modifies the value of each bit position in turn. It can operate
            on the existing base value of each payload position, or on a specified string. It cycles through the base
            string one character at a time, flipping each (specified) bit in turn.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Operate on</strong> - This option lets you specify whether to operate on the base value of the
                payload position, or on another string.
            </li>
            <li>
                <strong>Format of original data</strong> - This option lets you specify whether the generator should
                operate on the literal value of the original data, or should treat it as ASCII hex (explained further
                below).
            </li>
            <li>
                <strong>Select bits to flip</strong> - This option lets you specify which bits in each byte should be
                flipped, through from the least significant bit (i.e. 0000000X) through to the most significant bit
                (i.e. X0000000).
            </li>
        </ul>
        <p>
            You can configure the bit flipper either to operate on the literal base value, or to treat the base value as
            an ASCII hex string. For example, if the base value is &quot;ab&quot; then operating on the literal string
            and flipping all bits will result in the following payloads:
        </p>
        <p class="InlineCode">
                `b<br>
                cb<br>
                eb<br>
                ib<br>
                qb<br>
                Ab<br>
                !b<br>
                &#xE1;b<br>
                ac<br>
                a`<br>
                af<br>
                aj<br>
                ar<br>
                aB<br>
                a&quot;<br>
                a&#xE2;<br>
        </p>
        <p>
            Whereas treating &quot;ab&quot; as an ASCII hex string and flipping all bits will result in the following
            payloads:
        </p>
        <p class="InlineCode">
                aa<br>
                a9<br>
                af<br>
                a3<br>
                bb<br>
                8b<br>
                eb<br>
                2b<br>
        </p>
        <p>
            This payload type can be useful in similar situations to the <a href="#character-frobber">character frobber</a> but where you need finer-grained control. For example, if session tokens or other parameter values contain
            meaningful data encrypted with a block cipher in CBC mode, it may be possible to change parts of the
            decrypted data systematically by modifying bits within the preceding cipher block. In this situation, you
            can use the bit flipper payload type to determine the effects of modifying individual bits within the
            encrypted value, and understand whether the application may be vulnerable.
        </p>
        <h2 id="username-generator">Username Generator</h2>
        <p>
            This payload type lets you configure a list of names or email addresses, and derives potential usernames
            from these using various common schemes.
        </p>
        <p>
            For example, supplying the name &quot;peter weiner&quot; results in up to 115 possible usernames, as
            follows:
        </p>
        <p class="InlineCode">
                peterweiner<br>
                peter.weiner<br>
                weinerpeter<br>
                weiner.peter<br>
                peter<br>
                weiner<br>
                peterw<br>
                peter.w<br>
                wpeter<br>
                w.peter<br>
                pweiner<br>
                p.weiner<br>
                weinerp<br>
                weiner.p<br>
                etc...
            </p>
        <p>
            This payload type can be useful if you are targeting a particular human user, and you do not know the
            username or email address scheme in use within an application.
        </p>
        <p>
            The list items can be edited in the same way as described for the <a href="#simple-list">simple list</a> payload type. You can also configure a maximum number of payloads to generate per item in the list.
        </p>
        <h2 id="ecb-block-shuffler">ECB Block Shuffler</h2>
        <p>
            This payload type can be used to shuffle blocks of ciphertext in ECB-encrypted data, so as to meaningfully
            modify the decrypted cleartext and potentially interfere with application logic.
        </p>
        <p>
            Because ECB ciphers encrypt each block of plaintext independently of others, identical blocks of plaintext
            encrypt into identical blocks of ciphertext (provided the same key is used), and vice versa. Hence, it is
            possible to shuffle blocks within a large piece of ciphertext with the effect of shuffling the corresponding
            blocks of decrypted plaintext. In some data (such as a structured session token with fields for username,
            user ID, role, and a timestamp) it may be possible to meaningfully alter the content of the decrypted data
            so as to interfere with application processing, and carry out unauthorized actions.
        </p>
        <p>
            The following options are available:
        </p>
        <ul>
            <li>
                <strong>Encrypted data to shuffle</strong> - This option lets you specify whether to operate on the base
                value of the payload position, or on another string.
            </li>
            <li>
                <strong>Format of original data</strong> - This option lets you specify whether the generator should
                operate on the literal value of the original data, or should treat it as ASCII hex (see the <a href="#bit-flipper">bit flipper</a> payload type for more details).
            </li>
            <li>
                <strong>Block size</strong> - This is the size in bytes of the encrypted blocks. In most cases, the
                blocks are 8 or 16 bytes in size. If you are unsure, you should run the attack multiple times using each
                block size that might be in use.
            </li>
            <li>
                <strong>Additional encrypted strings</strong> - This list lets you optionally supply a list of encrypted
                strings that use the same cipher and key, to provide additional blocks for shuffling into the encrypted
                data. Because successful attacks of this type often require a considerable degree of luck, in terms of
                finding a block with a suitable plaintext value that can be shuffled in to the correct point in the
                structure, the odds of success are frequently improved by obtaining a large sample of strings that have
                been encrypted by the same application function. For example, if you are attacking a session token using
                this payload type, it would be beneficial to harvest a large number of other session tokens from the
                application, to provide additional blocks of ciphertext.
            </li>
        </ul>
        <h2 id="extension-generated">Extension-Generated</h2>
        <p>
            This payload type invokes a <a href="../../extender.html">Burp extension</a> to generate payloads. The extension
            must have registered an Intruder payload generator. You can select the required generator from the list of
            available generators that have been registered by currently loaded extensions.
        </p>
        <h2 id="copy-other-payload">Copy Other Payload</h2>
        <p>
            This payload type copies the value of the current payload at another payload position. It can be used with <a href="../positions.html#attack-type">attack types</a> that have multiple payload sets (cluster bomb
            and battering ram). You can also define <a href="processing.html"> payload processing
            rules</a> so that you can systematically derive the current payload from the value of a payload at another
            position, rather than just copying its literal value.
        </p>
        <p>
            This payload type can be useful in various situations, for example:
        </p>
        <ul>
            <li>
                Two different parameters must always have the same value in order to hit a target code path (for
                example, fields for new and confirm passwords), and you want to use the cluster bomb attack type to
                manipulate other parameters at the same time.
            </li>
            <li>
                One parameter value in the request contains a checksum of another parameter value, which is normally
                computed by a client-side script based on user input.
            </li>
        </ul>
    </div>
</section>
</body>
</html>