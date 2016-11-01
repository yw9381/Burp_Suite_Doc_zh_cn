# 启动 Burp

Burp Suite 是一个 Java 应用程序，作为一个独立的Java可执行文件，扩展名为.JAR。 您可以从 [PortSwigger.net](PortSwigger.net) 网站下载 Burp Suite 免费版。 对于Burp Suite Professional用户，您可以使用您的帐户[登录](https://portswigger.net/users/)并下载最新的专业版。 Burp JAR文件可以使用 Java 运行环境执行，并且不需要解压缩JAR文件本身的内容。  
要启动Burp，首先检查是否安装了Java：

* 打开命令提示符(命令行)：
	* 在 Windows 上，单击开始按钮，在搜索框中键入"cmd"，然后单击"程序"下的"cmd.exe"项。
	* 在 macOS 上，按下 ⌘ + 空格 打开 Spotlight，输入Terminal，回车即可。<sup>①</sup>
	* 在 Linux 上，在应用程序列表中查找名为“console”或“shell”的项。
* 在命令提示符窗口中，键入：```java -version```
* 如果安装了 Java，您将看到一条消息，如：```java version "1.8.0_73"```。 要运行 Burp，您需要 Java 版本 >= 1.6。
* 如果未安装 Java，或者如果您的 Java 版本早于 1.6 ，则需要安装 Java。 [下载最新的Java运行时环境（JRE）](http://www.oracle.com/technetwork/java/javase/downloads/index.html)，运行安装程序，然后打开一个新的命令提示符，并重新启动。

安装好 Java 后，在某些平台上，您可以通过双击 Burp JAR 文件直接运行 Burp。 但是，官方建议从命令行启动 Burp，因为这样可以更好地控制其执行，控制计算机分配给 Burp 的内存量。 我们可以在命令提示符下键入如下命令：
```
java -jar -Xmx1024m /path/to/burp.jar
```
其中```1024```是要分配给 Burp 的内存量（以MB为单位），```/path/to/burp.jar```是计算机上 Burp JAR 文件的位置。

如果一切正常，启动屏幕应显示几秒钟，然后将出现主启动向导窗口。 如果没有任何反应或出现错误信息，请参阅[故障排除](../Troubleshooting.md)。

**注①**：此处并未按照原文进行翻译，译者觉得此种方法打开 Terminal 更为方便

本节英文原版地址：  
[https://portswigger.net/burp/help/suite_gettingstarted.html#launching](https://portswigger.net/burp/help/suite_gettingstarted.html#launching)