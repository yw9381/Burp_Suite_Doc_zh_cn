# Burp 的基本使用


如果你的 [Burp 正在运行](../Getting_Started/Launching_Burp.md)，而且已经[配置了浏览器代理](../Getting_Started/Configuring_Your_Browser.md)使用 Burp的代理侦听器。切换到代理拦截（Intercept）选项卡，如果拦截功能是关闭的，你需要去打开该功能（单击这个按钮来切换拦截状态）。然后转到您的浏览器进行访问。

接下来，浏览器发出的每个 HTTP 请求都显示在截取（Intercept）选项卡中。 您可以查看每一个请求报文，根据需要可以进行编辑。然后单击**放行（Forward）**<sup>①</sup>按钮将请求发送到目标 Web 服务器。如果有截获的消息，将会显示在这里等待处理，您需要放行所有消息，以便您的浏览器能够获取数据，以完成页面加载。您可以点击**拦截开关（Intercept is on/Intercept is off）**按钮，来打开或是关闭拦截，如果是关闭状态，则不会拦截任何请求。有关更多帮助，请参阅 [Burp Proxy 入门](../../Proxy/Getting_Started.md)。

当您通过 Burp 的代理访问 Web 时，代理的历史记录将会全部保留，包括所有请求（Requests）和响应（Responses）的记录。在**代理（Proxy）**中，转到**HTTP 历史记录（HTTP History）**选项卡，查看您所做的一系列请求。您可以在表中选择一个项目，并在下方的**请求（Requests）**和**响应（Responses）**选项卡中查看完整的HTTP消息。

在这个过程进行的同时，Burp 会构建出目标站点的站点地图。你可以转到**目标（Target）**选项卡的**网站地图（Site Map）**子选项卡来查看这些信息。网站地图包含您在浏览器中访问的所有网址，以及Burp根据您的请求（例如通过解析 HTML 响应中的链接）推断出的所有内容。已请求的项目显示为黑色，其他项目显示为灰色。 您可以在左侧的树中展开分支，选择其中某项，查看其完整的请求和响应（如果这些信息可用的话）。 有关更多帮助，请参见[使用目标（Target）](../../Target/Using/README.md)工具。

Burp Suite 被设计成一个手动的工具，用户可以控制其执行过程。Burp的基于用户驱动工作流的核心是能够在 Burp 各个工具之间传递 HTTP 请求，以执行特定的任务。您可以从代理拦截（Proxy -> Intercept）选项卡，代理历史记录（Proxy -> HTTP History），站点地图（Target -> Site Map）以及 Burp 中的任何位置来发送消息，您将看到HTTP消息在各个工具间传递。 你可以选择一个或多个 HTTP 消息，然后使用
菜单（右键菜单）将请求发送到另一个工具。

您可以使用如下工具来执行不同的任务：

* **Spider** - 它用于自动抓取 Web的信息，来发现其内容和功能。
* **Scanner** - 它用于自动扫描 HTTP 请求来查找其中的安全漏洞。
* **Intruder** - 它允许您定制好测试规则，然后基于规则进行自动攻击，或是进行测试任务。
* **Repeater** - 它用于手动修改 HTTP 请求，然后重新发出这个请求。
* **Sequencer** - 它用于分析 Web 应用程序会话令牌中的随机性量。
* **Decoder** - 它用于使用了常见的编码和解码方案来转换一些数据。
* **Comparer** - 它用于执行某些数据位的可视化比较，以找到一些有有意思的差异。

您可以以多种方式组合 Burp 的不同工具，执行从非常简单到高级再到专业的测试任务。有关 Burp 的基于用户驱动工作流的更多详细信息，请参阅[开始使用Burp Suite](../Using_Burp_Suite/README.md)。

如果你不想使用Burp作为手动测试工具，或是只想对你的应用程序执行一个快速和简易的漏洞扫描，请参考[使用Burp作为点击扫描器](../../Scanner/Point-and-Click.md)。

**注①**：译者觉得此处的 Forward 翻译为放行比转发更贴合上下文

本节英文原版地址：  
[https://portswigger.net/burp/help/suite_gettingstarted.html#using](https://portswigger.net/burp/help/suite_gettingstarted.html#using)