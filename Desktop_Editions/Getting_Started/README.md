本页适用于`专业版`及`社区版`

# Getting Started With Burp Suite
在这里也可以看到：
[Burp Suite Support Center](https://support.portswigger.net/): [Getting started with Burp Suite](https://support.portswigger.net/customer/portal/articles/1816883-getting-started-with-burp-suite)

**注意:** 使用 Burp Suite 可能会在某些应用程序中导致不可预料的影响。在您完全熟悉其功能和设置之前，请不要使用Burp Suite对生产系统进行检测。

# 启动 Burp
从 [PortSwigger.net](https://portswigger.net/burp/releases)网站下载对应平台（Windows，MacOS或Linux）的 Burp Suite 安装程序。

运行安装程序，在安装向导中根据需求进行选择。

安装完成后，双击已安装的应用程序快捷方式启动 Burp Suite。 在Linux上，快捷方式位于安装过程中显示或是选择的安装路径中。

您还可以从[命令行启动 Burp Suite](Command_Line.md)以指定其他选项和[命令行参数](Command_Line.md#Command_Line_Arguments)。

# 开始向导
When Burp launches, the startup wizard is displayed. This lets you choose what Burp project to open, and what project configuration to use.

# 选择工程
You can choose from the following options to create or open a project:

Temporary project - This option is useful for quick tasks where your work doesn't need to be saved. All data is held in memory, and is lost when Burp exits.
New project on disk - This creates a new project that will store its data in a Burp project file. This file will hold all of the data and configuration for the project, and data is saved incrementally as you work. You can also specify a name for the project.
Open existing project - This reopens an existing project from a Burp project file. A list of recently opened projects is shown for quick selection. When this option is selected, the Spider and Scanner tools will be automatically paused when the project reopens, to avoid sending any unintentional requests to existing configured targets. You can deselect this option if preferred.
Note: You can rename a project later via the Burp menu.

# 选择配置
You can choose from the following options for the project configuration:

Use Burp defaults - This will open the project using Burp's default options.
Use options saved with project - This is only available when reopening an existing project, and will open the project using the options that were saved in the project file.
Load from configuration file - This will open the project using the options contained in the selected Burp configuration file. Note that only project-level options in the configuration file will be reloaded, and any user-level options will be ignored. A list of recently used configuration files is shown for quick selection.
Opening a Project From a Different Burp Installation
If you open an existing project that was created by a different installation of Burp, then Burp will prompt you to decide whether to take full ownership of the project.

This decision is needed because Burp stores within the project file an identifier that is used to retrieve any ongoing Burp Collaborator interactions that are associated with the project. If two instances of Burp share the same identifier in ongoing work, then some Collaborator-based issues may be missed or incorrectly reported. You should only take full ownership of a project from a different Burp installation if no other instance of Burp is working on that project.

# 查看设置
The first time you run Burp, it is worth taking a moment to check your display settings. Burp lets you select different sized fonts for different parts of the UI, and you may want to change these settings, depending on your screen resolution.

First, look at the text shown in Burp's menus, tab captions, buttons and other text. If you want to change the main UI font size, go to the Options tab, then go to the Display sub-tab, and edit the font size in the User Interface section. Then restart Burp and check whether the new font is suitable.

Second, go to the Repeater tab and look at the HTTP message shown in the request panel. If you want to change the font size for HTTP messages, go to the Options tab, then go to the Display sub-tab, and edit the font size in the HTTP Message Display section. Then go back to the Repeater tab and check whether the new font is suitable (there is no need to restart).

# 下一步
Use the links below for further help on starting to use Burp:

Scan a website 
Use Burp Suite for penetration testing
Working with Burp's configuration 
Troubleshooting common problems