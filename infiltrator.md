   

1.  [Support Center](https://support.portswigger.net/)
2.  [Documentation](index.html)
3.  [Burp Infiltrator](infiltrator.html)

Professional

Burp Infiltrator
================

Burp Infiltrator is a tool for instrumenting target web applications in order to facilitate testing using [Burp Scanner](scanner/index.html). Burp Infiltrator modifies the target application so that Burp can detect cases where its input is passed to potentially unsafe APIs on the server side.

Burp Infiltrator currently supports applications written in:

*   Java, Groovy, Scala, or other JVM languages (JRE versions 1.4 - 1.8)
*   C#, VB, or other .NET languages (.NET versions 2.0 and later)

**Important notice**

*   Burp Infiltrator should not be used on production systems or any other systems where availability, performance, or correct operation is required. Burp Infiltrator makes changes to the application that may result in service outages, degraded performance, application errors, or other problems.
*   Burp Infiltrator makes non-reversible changes to application bytecode. To revert the changes made by Burp Infiltrator it will be necessary to re-deploy the application from original unmodified sources.
*   Burp Infiltrator changes the behavior of the application so that potentially sensitive information might be disclosed to anyone who can interact with the application across a network.
*   For these reasons, it is only appropriate to use Burp Infiltrator on systems that are (a) designated for testing purposes only, and (b) inaccessible to any person who is not trusted with the information that might be disclosed.

How Burp Infiltrator Works
--------------------------

Burp Infiltrator works in the following way:

1.  The Burp user exports the relevant Burp Infiltrator installer from Burp Suite Professional, via the "Burp" menu.
2.  The application developer or administrator installs the Burp Infiltrator tool by running it on the machine containing the application bytecode.
3.  Burp Infiltrator patches the application bytecode to inject instrumentation hooks at locations where potentially unsafe APIs are called.
4.  The application is launched in the normal way, running the patched bytecode.
5.  The Burp user performs a scan of the application in the normal way.
6.  When the application calls a potentially unsafe API, the instrumentation hook inspects the relevant parameters to the API. Any Burp payloads containing [Burp Collaborator](collaborator/index.html) domains are fingerprinted based on their unique structure.
7.  The instrumentation hook mutates the detected Burp Collaborator domain to incorporate an identifier of the API that was called.
8.  The instrumentation hook performs a DNS lookup of the mutated Burp Collaborator domain.
9.  Optionally, based on [configuration options](#configuration-options), the instrumentation hook makes an HTTP/S request to the mutated Burp Collaborator domain, including the full value of the relevant parameter and the application call stack.
10.  Burp polls the Collaborator server in the normal way to retrieve details of any Collaborator interactions that have occurred as a result of its scan payloads. Details of any interactions that have been performed by the Burp Infiltrator instrumentation are returned to Burp.
11.  Burp reports to the user that the relevant item of input is being passed by the application to a potentially unsafe API, and generates an informational scan issue of the relevant vulnerability type. If other evidence was found for the same issue (based on in-band behavior or other Collaborator interactions) then this evidence is aggregated into a single issue.

![](../documentation/images/infiltrator/infiltrator-1.png)

Because Burp Infiltrator works by observing Burp payloads containing Burp Collaborator domains, and communicates back to Burp via the specified Burp Collaborator server, use of Burp Infiltrator requires that:

*   The instance of Burp performing scans is configured to use a valid, working Burp Collaborator server, and both the target application and Burp are able to interact with that server.
*   At least some scan checks that use Collaborator-based payloads are enabled. Ideally, this should include the scan check for external service interaction. Using as many Collaborator-based scan checks as possible will maximize effectiveness.

Use of private Burp Collaborator servers is supported by Burp Infiltrator, and the Infiltrator instrumentation knows which Collaborator server to communicate with based on the full domain name that Burp sends in its payloads. However, only private Collaborator servers that are configured using a domain name are supported; private Collaborator servers configured via an IP address are not supported.

Installing Burp Infiltrator
---------------------------

To make use of Burp Infiltrator, it needs to be installed within the target application using the following steps:

*   Export the Burp Infiltrator installer from Burp Suite Professional. Go to the Burp menu, select "Burp Infiltrator", select the type of application that you want to instrument, and save the file to your preferred location.
*   Copy the Burp Infiltrator installer onto a machine containing the compiled application bytecode. This might be already located on the target application server, or on another machine ready to deploy.
*   If the bytecode is already located on the target application server, ensure that the application is not currently running, as this may prevent the bytecode on disk from being modified.
*   During patching, Burp Infiltrator needs to know the location of the application bytecode. The easiest way to achieve this is to place the Infiltrator installer into the root folder of the application, and run it from there as the working directory. Alternatively, you can specify the path(s) to the application bytecode during the installation process.
*   Ensure that the user context being used to perform the Burp Infiltrator installation has permissions to write to the files and folders containing the application bytecode.
*   Burp Infiltrator needs to be run from the command line (e.g. for Java applications, using java -jar burp\_infiltrator\_java.jar).
*   By default, the Burp Infiltrator installer runs interactively, and asks a series of questions during installation. Alternatively, you can run it [non-interactively](#non-interactive-installation).
*   When the patching process is completed, launch the application in the normal way using the modified bytecode.

Please take note of the following considerations relating to the patching process:

*   If code that is executed as part of the application resides at multiple file locations, or even on multiple machines, then to achieve complete coverage Burp Infiltrator should be run against each location where bytecode is held.
*   Do not run Burp Infiltrator on file locations containing bytecode that is not part of the application being tested.
*   The changes made to application bytecode are liable to break the signatures on any signed code components. To successfully use Burp Infiltrator with signed code components it will be necessary to disable verification of code signatures within the application.
*   Burp Infiltrator makes non-reversible changes to application bytecode. To revert the changes made by Burp Infiltrator it will be necessary to re-deploy the application from original unmodified sources.
*   If a target application has already been patched using Burp Infiltrator, and a new version of Burp Infiltrator becomes available, you can simply run the updated Infiltrator installer in the normal way, and then restart the application.
*   To patch .NET applications, Burp Infiltrator makes use of bytecode assembly and disassembly tools. These can be either: (a) the ilasm and ildasm tools that are distributed with the .NET framework and the Windows SDK tools, respectively; or (b) the ilasm and monodis tools that are distributed with mono. You must specify the location of the assembly and disassembly tools during the patching process. Note that the version of the assembly tool must match the version of the .NET framework that the bytecode is targeting, to ensure compatibility.
*   .NET code should not be annotated with the SupressIldasmAttribute attribute, as this will prevent Burp Infiltrator from instrumenting the assembly.
*   After patching .NET applications, the Burp Infiltrator installer executable should not be left in the folder from which the application loads its bytecode (typically "bin"). If the installer is left in this location, then by default .NET will load the installer as part of the application, and this might result in warnings being logged or even fatal errors.

### Non-interactive Installation

You can install Burp Infiltrator non-interactively. This supports various use cases. For example, a CI pipeline could automatically deploy an application build to a staging server, install the Burp Infiltrator instrumentation, and perform a scan using [Burp Scanner](scanner/index.html).

To run the Burp Infiltrator non-interactively, add the following argument to the command line:

--non-interactive

In non-interactive mode, the Burp Infiltrator installer will use default values for all  [configuration options](#configuration-options) that are normally prompted for in interactive mode. You can use additional command line arguments to override these default values if required. Use the following command line argument to list all the supported options:

--help

Before installing Burp Infiltrator non-interactively, you should use the above command to view the details of the default values for [configuration options](#configuration-options) that will be used unless overridden, and ensure that the correct options will be used based on your requirements. 

**Note:** By running the Burp Infiltrator installer in non-interactive mode, you are deemed to have read and agreed to all warnings and disclaimers that are displayed during interactive installation. 

Configuration Options
---------------------

The following configuration options can be specified during the [installation](#installing-burp-infiltrator) of Burp Infiltrator, either interactively or using command line options during [non-interactive](#non-interactive-installation) installation:

*   Whether to report back the full value of the relevant parameter that has reached a potentially unsafe API.
*   Whether to report back the application call stack when input reaches a potentially unsafe API.
*   Whether to allow communication with the Collaborator server over unencrypted HTTP. Using HTTPS reduces the risk of unauthorized disclosure of transmitted information. However, depending on the technologies available within the instrumented application, and the capabilities of the configured Collaborator server, it might sometimes be necessary to use unencrypted communications. **Note:** When HTTPS is used, Burp Infiltrator makes a best effort to use the latest TLS cipher that is available. On some target systems, particularly those using older technologies, the latest available cipher might be vulnerable to known attacks by a suitably located adversary.
*   Whether to allow communication only to specified Burp Collaborator servers. During scanning by [Burp Scanner](scanner/index.html), payloads will contain subdomains of the Burp Collaborator server that Burp is configured to use. If you know that Burp scans will be performed using a specific Collaborator server, you can configure Burp Infiltrator to allow communication only to that server.
*   The file paths where the Infiltrator patching should be applied. The patching is always applied recursively to subdirectories.

**Note:** Configuration options are specified during the patching operation, and are applied within the changes that the patching operation makes to the application bytecode. To modify the configuration of Burp Infiltrator after patching has been performed, it will be necessary to re-run the Burp Infiltrator installer using the updated options, and then restart the application.