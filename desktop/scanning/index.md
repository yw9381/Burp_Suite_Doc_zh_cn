[帮助中心](https://support.portswigger.net/) >> [文档首页](../../index.md) >> [桌面版本](../index.md) >> [扫描Web网站](index.md)

本页适用于`专业版`

# 扫描Web网站

--------------

Burp Scanner自动执行扫描网站内容和漏洞的任务。当配置完成之后，Scanner 程序可以[抓取](../../scanner/crawling.md)Web应用程序以发现其内容和功能，以及[审核应用程序](../../scanner/auditing.md)发现漏洞。

[了解有关Burp Scanner如何工作的更多信息](../../scanner/index.md)

# 启动扫描

--------------

扫描可以通过多种方式启动：

* **扫描特定网址** - 输入一个或多个URL来执行扫描，并可审计已经抓取到的内容。你可以在[Burp 仪表盘](../dashboard/index.md)选项卡中单击`新建扫描(New Scan)`按钮。然后就会打开[启动扫描面板](scan-launcher.md)，然后根据情况配置具体扫描信息
* **扫描所选项目** - 您可以执行特定HTTP请求的仅审计扫描（不进行抓取）。你可以在Burp中的任意一个位置选择一个或多个HTTP请求，然后从上下文菜单中选择`扫描（Scan）`。然后就会打开[启动扫描面板](scan-launcher.md)，然后根据情况配置具体扫描信息。
* **实时扫描** - 您可以使用[实时扫描](live-scans.md)来自动扫描由Burp的其他工具处理的请求，例如[代理工具](../tools/proxy/index.md)或[重放工具](../tools/repeater/index.md)。您可以精确的去配置需要处理哪些请求，以及是否去扫描这些请求来识别或审计漏洞。你可以到[Burp 仪表盘](../dashboard/index.md)，然后单击`新建实时任务(New live task)`按钮。然后会打开[实时扫描](live-scans.md)，然后根据情况配置具体扫描信息。

## 配置扫描

您可以并行启动多个扫描，每个扫描都可以单独进行配置以及确定扫描的执行方式。 配置有两个关键领域：

* **抓取选项** 这些选项控制了抓取的行为，例如最大抓取深度，限制抓取范围，抓取速度及覆盖范围的优化等。[阅读更多信息](crawl-options.md)
* **审计选项** 这些选项控制了扫描器的审计行为，例如插入点的处理及使用的检测方法。这些选项对于控制将执行何种类型的审计行为非常重要，它可以从轻量级被动分析到重量级主动侵入式扫描。 [阅读更多信息](audit-options.md)

## 监控扫描活动

--------------

您可以通过各种方式监控扫描的进度和结果：

* [Burp 仪表盘](../dashboard/index.md)显示了每个任务的进度，[问题活动日志](../dashboard/issue-activity.md)显示了所有扫描任务中报出的问题 。
* 您还可以打开单个扫描的[任务详细信息](../dashboard/task-details.md)来查看扫描的[活动日志](../dashboard/issue-activity.md)，以及适用于任务的[审计项目](audit-items.md)的详细视图。
* [目标站点地图](../tools/target/site-map/index.md)当中会显示某个域及其URL的所有内容和问题。

## 扫描报告

--------------

您可以以`HTML格式`来生成通过 Burp Scanner 找到的问题的[报告](reporting-results.md)。 您还可以将该报告导出为`XML格式`供其他工具使用。