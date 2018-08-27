本页适用于`专业版`及`社区版`

# 获取Burp的帮助
在这里也可以看到：
[Burp Suite Support Center](https://support.portswigger.net/): [Getting started with Burp Suite](https://support.portswigger.net/customer/portal/articles/1816883-getting-started-with-burp-suite)

**注意:** 使用 Burp Suite 可能会在某些应用程序中导致不可预料的影响。在您完全熟悉其功能和设置之前，请不要使用Burp Suite对生产系统进行检测。

## 启动 Burp
从 [PortSwigger.net](https://portswigger.net/burp/releases)网站下载对应平台（Windows，MacOS或Linux）的 Burp Suite 安装程序。

运行安装程序，在安装向导中根据需求进行选择。

安装完成后，双击已安装的应用程序快捷方式启动 Burp Suite。 在Linux上，快捷方式位于安装过程中显示或是选择的安装路径中。

您还可以[从命令行启动 Burp Suite](Command_Line.md)以指定其他选项和[命令行参数](Command_Line.md#命令行参数)。

## 开始向导
当Burp启动时，将显示启动向导。此时您可以选择要打开的 Burp 工程以及要使用的工程配置。

## 选择工程
您可以从以下选项中进行选择以创建或打开工程：

* **临时工程** - 此选项对于不需要保存工作的快速任务非常有用。所有数据都保存在内存中，并在Burp退出时丢弃。
* **基于磁盘创建工程** - 创建一个新工程，将其数据存储在[Burp工程文件](Burp_Projects.md)中。该文件将保存工程的所有数据和配置，并在您工作时动态保存数据。您还可以为其指定工程的名称。
* **打开已存在的工程** - 打开一个现有的[Burp工程文件](Burp_Projects.md)。主面板上将显示最近打开的工程列表以便快速选择。选择此选项后，`Spider`和`Scanner`工具将在工程打开时自动暂停，以避免向现有配置的目标发送任何无意的请求。您可以取消选择此选项。

**注意**：您可以稍后通过Burp菜单重命名工程。

## 选择配置
您可以从以下工程配置选项中进行选择：

* **使用Burp默认配置** - 使用Burp的默认配置打开工程。
* **使用工程中保存的配置** - 仅在重新打开现有工程时可用，并将使用[工程文件](Burp_Projects.md)。中保存的选项来打开工程。
* **从配置文件加载** - 使用所选的Burp配置文件中包含的选项打开工程。请注意，这个选项只会重新加载配置文件中的工程级选项，不会加载任何用户级选项。主面板上将显示最近使用的配置文件列表以便快速选择。

## 打开 Burp 的其他版本的项目
如果您打开由不同版本的Burp创建的工程，那么Burp将提示您是否取得该工程的所有权。

您需要为此做出决定，因为Burp在工程文件中存储了一个标识符，该标识符用于检索与工程关联的任何正在进行中的[Burp Collaborator](#)的交互。如果两个Burp实例在正在进行的工作中使用了相同的标识符，则有可能会遗漏或反馈某些基于协作者的错误。如果没有其他Burp实例正在处理该工程，您可以直接其他版本创建的Burp工程文件中获取该工程的所有权。

## 查看设置
第一次运行Burp时，您值得花点时间来检查显示设置。Burp允许您为UI的不同部分选择不同大小的字体，您可能希望根据屏幕分辨率来更改这些设置。

Burp的UI包括`Burp菜单`，`标签标题`，`按钮`和`其他显示的文本`等。如果要更改主UI字体大小，请转到`Options`选项卡，然后转到`Display`子选项卡，并在[`User Interface`](#)部分中编辑字体大小。 然后重启Burp并检查新字体是否合适。

然后转到`Repeater`选项卡，可以看到请求面板中显示的HTTP消息。如果要更改HTTP消息的字体大小，请转到`Options`选项卡，然后转到`Display`子选项卡，并在[`HTTP Message Display`](#)部分中编辑字体大小。设置HTTP消息字体不需要重启Burp。

## 下一步
Use the links below for further help on starting to use Burp:

* [扫描网站]()
* [使用Burp进行渗透测试]()
* [使用Burp的配置]()
* [故障排除]()