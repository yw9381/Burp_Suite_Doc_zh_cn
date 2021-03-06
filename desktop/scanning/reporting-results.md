[帮助中心](https://support.portswigger.net/) >> [文档首页](../../index.md) >> [桌面版本](../index.md) >> [扫描Web网站](index.md) >> [报告结果](reporting-results.md)

本页适用于`专业版`

# 报告结果

--------------

您可以导出Burp Scanner生成的部分或全部问题的报告。你可以依次打开[站点地图(Site map)](../tools/target/site-map/index.md#issues-view)-->[问题视图(Issues view)](../dashboard/issue-activity.md)或在[问题活动日志](../dashboard/issue-activity.md)中选择`报告所选问题(Report selected issues)`，报告向导将带着您您为报告做各种选项，具体如下。

* [查看示例报告](https://portswigger.net/burp/samplereport/burpscannersamplereport)

## 报告格式

--------------

您可以为报告选择以下格式之一：

* **HTML** - 生成HTML格式的报告，以便在浏览器中打印或查看。
* **XML** - 生成XML格式的报告，适合导入其他工具或报告框架。您可以选择在XML输出中对HTTP请求和响应进行Base64编码。由于HTTP消息可能包含XML文档中不允许的非打印字符(即使在CDATA块中)，所以在和其他工具联动时建议使用此选项。

**注意：** XML格式使用内部DTD，建议互操作性代码的作者查看样本报告以获取当前的DTD。以下XML元素值得注意：

* `serialNumber`元素包含一个长整数，该整数对于该单个问题实例是唯一的。如果您从同一个Burp实例多次导出问题，则可以使用序列号逐步识别新问题。
* `type`元素以整数唯一标识形式表示问题类型，例如SQL注入，XSS等问题。该值在Burp的不同实例中是固定的。有关所有数字类型标识符的列表，请参阅[问题定义列表](https://portswigger.net/kb/issues)。
* `name`元素包含问题类型的名称。有关所有问题名称的列表，请参阅[问题定义列表](https://portswigger.net/kb/issues)列表。
* `path`元素包含问题的URL，其不包括URL中的参数。
* `location`元素包含URL和攻击入口点的描述，其包括特定的URL参数，请求标题等。
* `request`和`response`元素具有base64属性，该属性包含一个布尔值，指示消息是否进行了Base64编码。

## 问题详情

--------------

您可以选择要包含在报告中的详细信息类型：

* **问题背景** - 问题的标准描述，对于所有相同类型的问题都是相同的。
* **修复建议** - 标准的修复建议，对于所有相同类型的问题都是相同的。
* **问题详情** - 对于某些类型的问题，详情中包含有关特定问题的一些其他自定义信息，请注意某些可能适用于特定问题实例的详细信息。
* **修复细节** - 对于某些类型的问题，此处说明了进一步的修复细节，从这里也能看到问题的某些固定特征。
* **漏洞分类** - 基于`常见漏洞举例(Common Weakness Enumeration)`对漏洞做了简单的分类。

## HTTP 消息

--------------

您可以选择HTTP消息在报告中的显示方式。以下选项可用于`请求(requests)`和`响应(responses)`：

* **不包括任何消息** - 报告不包含任何有关HTTP的信息。
* **包含相关摘录** - 报告将工具内结果中突出显示的部分以及相关的HTTP信息包含在内。
* **包括完整** - 报告将包含完整的HTTP信息，可能包含与问题无关的部分。您可以将每条消息限制为指定的最大长度，以防止报告中呈现过大的消息而导致报告急剧膨胀。

## 选择问题类型

--------------

该向导列出了您选择中包含的不同类型的问题，以及每种类型问题的具体数量。您可以取消不希望包含在内的类型。如果您选择了大量问题(例如，通过选择应用程序主机)，并从报告中删除某些无参考价值的问题类型，对于最终生成的报告来说会更有价值。

## 报告详情

--------------

您可以指定报告将存储于何处。

对于HTML报告，您可以指定以下详细信息：

* 报告标题。
* 如何在报告中组织问题(基于`类型(type)`，`严重性(severity)`或URL)。
* 包含在目录中的详细等级。
* 严重性图表。