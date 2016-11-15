# 研究和分析

[Proxy 组件](../../Target/Using/README.md)是整个 Burp 的工作流的核心。它使得整个测试流程变为您使用浏览器浏览 Web 应用程序的同时 Burp 自动捕获所有相关信息，并让您选择进一步的操作。在测试中，侦测和分析阶段包括以下任务：

- **手动映射应用程序** - 使用浏览器通过 Burp Proxy 工作，通过[手动映射应用程序](../../Target/Using/Manual_Application_Mapping.md)，提交表单并逐步执行多步骤过程。此过程将使用请求的所有内容填充到代理组件(Proxy)的[历史记录](../../Proxy/Using_Burp_Proxy/Using_the_Proxy_History.md)和目标组件(Target)的[站点地图](../../Target/Site_Map/README.md)，并且（通过[被动爬取](../../Spider/Options/Passive_Spidering.md)）将向站点地图添加可从应用程序响应（通过链接，表单等等）推断的任何其他内容。然后，您可以查看任何[未请求的项目](../../Target/Using/Reviewing_Unrequested_Items.md)（在网站地图中显示为灰色），并使用浏览器请求这些项目。

- **在必要时执行自动映射** - 您可以选择以各种方式来自动执行映射过程。比如说：
	- 执行自动[爬取](../../Spider/Using_Burp_Spider/README.md)以在站点地图中请求未请求的项目。在使用此工具之前，请务必查看所有 [Spider 设置](../../Spider/Using_Burp_Spider/Configuring_Spider_Settings.md)。
	- 使用[内容发现](../../Suite_Function/Content_Discovery/README.md)功能可以发现没有在浏览器中呈现的内容。
	- 使用 Burp Intruder 执行[自定义发现](../../Intruder/Using_Burp_Intruder/Typical_Uses/Enumerating_Identifiers.md)，循环查看常用文件和目录列表，以及识别匹配。

	请注意，在执行任何自动化操作之前，您可能需要设置 Burp 配置的各个方面，例如目标的范围和会话处理等。

- 分析应用程序的攻击面 - 映射应用程序的过程会使用 Burp 去捕获关于应用程序的相关信息并填充到 Proxy 组件 的[历史记录](../../Proxy/Using_Burp_Proxy/Using_the_Proxy_History.md)和 Target 组件的[站点地图](../../Target/Site_Map/README.md)。这两个功能都具有相应的存储库，它们包含了一些功能，可以[帮助您](../../Proxy/Using_Burp_Proxy/Using_the_Proxy_History.md)更好的[分析](../../Target/Using/Analyzing_The_Attack_Surface.md)它们包含的信息，并评估应用程序所暴露出来的的攻击面。此外，您可以使用 Burp 的[目标分析器](../../Suite_Function/Target_Analyzer.md)来报告攻击面的问题程度和应用程序使用的 URL 的类型。


本节英文原版地址：  
[https://portswigger.net/burp/help/suite_usingburp.html#recon](https://portswigger.net/burp/help/suite_usingburp.html#recon)