[帮助中心](https://support.portswigger.net/) >> [文档首页](../index.md) >> [移动端测试](mobile-testing.md)

本页适用于`专业版`及`社区版`

# 移动端测试

--------------

您可以使用Burp Suite执行移动应用程序的安全性测试。为此，您只需为移动设 备配置为使用Burp Proxy代理。然后，您可以拦截，查看和修改移动应用程序处理的所有HTTP/HTTPS的请求和响应，并以正常方式[使用 Burp 进行渗透测试](penetration-testing/index.md)。

由于设置代理时出现可能出现问题，或者由于SSL证书固定，有时候不能拦截来自移动应用程序的HTTP/HTTPS流量，为了解决这个问题，我们提供了一款名为`Burp Suite Mobile Assistant`的程序。

`Burp Suite Mobile Assistant`是一款便于使用Burp Suite测试iOS应用程序的工具。它支持以下关键功能：

* 它可以修改iOS设备的系统范围代理设置，以便可以轻松地将HTTP（S）流量重定向到正在运行的Burp实例。
* 它可以尝试绕过所选应用程序中的SSL证书固定，允许Burp Suite中断其HTTPS连接并拦截，检查和修改所有流量。

Burp Suite Mobile Assistant目前支持运行`iOS 8.0`及更高版本的移动设备。

使用以下链接获取更多详细信息：

* [安装Mobile Assistant](tools/mobile-assistant/installing.md)
* [使用Mobile Assistant](tools/mobile-assistant/index.md)

**注意：** Burp Suite Mobile Assistant不应用于需要可用性，机密性或数据完整性的情况。 Mobile Assistant以一种显着降低通信安全性的方式更改注入的应用程序。