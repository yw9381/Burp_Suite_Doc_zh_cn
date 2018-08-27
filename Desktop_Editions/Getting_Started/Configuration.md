本页适用于`专业版`及`社区版`

# Configuration
You can use Burp's configuration library to manage different Burp configurations for particular tasks. For example, you might create different configurations for different types of scans. Or you might need to load a particular configuration when working on a particular client engagement. You can also save and load configurations in the form of configuration files.

## Configuration library
Burp's configuration library stores configuration options for different types of task, and makes these easily available when performing actions like launching scans.

The configuration library contains:

Built-in configurations - These are predefined configurations that are useful for common purposes. For example, performing a fast crawl, or an audit only for critical vulnerabilities.
Custom configurations - These are configurations defined and managed by the user.
You can access Burp's configuration library via the Burp menu, and via other relevant functions like the scan launcher.

Each item in the configuration library applies to a specific function, such as "Crawling". When you create a new custom configuration or edit an existing one, Burp shows a configuration editor for the chosen function. There are typically multiple areas of configuration that can be defined for a given function. The configuration editor lets you choose which areas will be defined in that configuration. If a configuration does not define a particular area, then default or existing values will be used. This is useful because many Burp functions let you select multiple configurations; these are applied in sequence, allowing you to build up an effective configuration from multiple specific ones.

Each configuration must be given a distinct name. You can export or import configurations as configuration files. These use a JSON format to represent the details of the configuration.

## User and Project Configuration Files
Separate configuration files can be used to manage user-level and project-level options.

User configuration files contain options relating to the individual user's environment and UI, including:

* Everything in the User options tab.
* The Extender tool, including the list of configured extensions.
* UI-related options in other tools, such as the selected view of the Target site map.

Project configuration files contain options relating to the work that is being performed on a particular target application, including:

* Everything in the Project options tab.
* Non-UI-related options in individual Burp tools, such as Proxy and Scanner.

## Loading and Saving Configuration Files
You can load and save configuration files in various ways:

* In Burp's configuration library, you can export or import configurations as configuration files.
* From the Burp menu, you can load or save configuration files for all user-level or project-level options.
* From individual configuration panels throughout Burp, you can use the "Options" button to load or save the configuration for just that panel.
* In the startup wizard, when creating or reopening a project, you can specify a configuration file from which to load project-level options.
* When starting Burp from the command line, you can use command line arguments to specify one or more configuration files from which to load user-level or project-level options.
* Burp extensions can load or save configuration file contents via the API.

## Configuration File Format
Configuration files use the JSON format. The structure and naming scheme used within the JSON correspond to the way that options are presented within the Burp UI. The easiest way to generate a configuration file for a particular purpose is to create the desired configuration within the Burp UI and save a configuration file from it. If preferred, you can also hand-edit an existing configuration file, since the contents are human-readable and self-documenting.