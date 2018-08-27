本页适用于`专业版`及`社区版`

# 从命令行启动 Burp
To launch Burp Suite from the command line, you should download the plain JAR file version of Burp. The JAR file can be executed using Java, and there is no need to unpack the contents of the JAR file itself.

First check whether Java is installed:

* At a command prompt, type: java -version
* If Java is installed, you will see a message like: java version "1.8.0_162" . To run Burp, you will need a version of Java that is 1.8 or later.
* If Java is not installed, or if your version of Java is older than 1.8, you will need to install Java. Download the latest Java Runtime Environment (JRE), run the installer, and then open a new command prompt and start again.
With Java installed, in your command prompt type a command like:

```shell
java -jar -Xmx4g /path/to/burp.jar
```

where 4 is the amount of memory (in Gb) that you want to assign to Burp, and `/path/to/burp.jar` is the location of the Burp JAR file on your computer.

If everything is working, a splash screen should display for a few seconds, and then the main startup wizard window should appear. If nothing happens, or if an error message appears, please refer to the troubleshooting help.

## 命令行参数
Various command line arguments are available to control Burp's behavior on startup. For example, you can tell Burp to prevent reloading of extensions, open a particular Burp project file, or load a particular configuration file.

You can view a list of available options using the command line argument `--help` .