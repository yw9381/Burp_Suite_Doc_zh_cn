[帮助中心](https://support.portswigger.net/) >> [文档首页](../../index.md) >> [桌面版本](../index.md) >> [开始入门](index.md) >> [命令行](launching-from-command-line.md)

本页适用于`专业版`及`社区版`

# 从命令行启动 Burp
要从命令行启动Burp Suite，您应该下载`JAR 版本`的Burp。可以使用`Java`来执行JAR文件，无需解压JAR文件。

首先，你需要检查是否已经安装了Java：

* 打开命令行，输入`java -version`来查看
* 如果Java已经安装，你应该可以看到类似于`java version "1.8.0_162"`的输出。如果需要运行Burp，Java的版本应当不低于`1.8`.
* 如果未安装Java，或者您的Java版本低于1.8，则你需要安装或是升级Java。你可以去Oracle官网下载最新的[Java运行时环境（JRE）](http://www.oracle.com/technetwork/java/javase/downloads/index.html)，然后运行安装程序，重新打开命令行，再次进行验证。
当确定Java已经安装且版本大于1.8后，可以在命令行下键入如下命令来启动Burp：

```shell
java -jar -Xmx4g /path/to/burp.jar
```

在命令行中，`4`是要分配给Burp的内存量（以GB为单位），`/path/to/burp.jar`是你电脑上Burp JAR文件的位置。

如果一切正常，那么你可以看到Burp显示的启动画面，等待几秒钟后，可以看到Burp显示了向导窗口。如果没有任何反应，或者出现错误消息，请参阅[故障排除](../troubleshooting.md)。

## 命令行参数
命令行参数可用于控制Burp在启动时的行为。例如，您可以禁止Burp加载[扩展](../tools/extender.md)，打开特定的[Burp项目文件](projects.md#工程文件)或加载特定的[配置文件](configuration.md)。

你可以输入`--help`来查看所有可用的命令行参数
