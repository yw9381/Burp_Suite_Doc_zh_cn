# 从一个不同的Burp打开工程

如果打开由不同安装路径的 Burp 创建的现有项目，则 Burp 将提示您决定是否对此项目拥有完全所有权。

需要此决定是因为 Burp 在项目文件中存储了用于检索与项目关联的任何正在进行的 [Burp Collaborator](../../../Burp_Collaborator/README.md) 交互的标识符。 如果两个实例的 Burp 在正在进行的工作中共享相同的标识符，则可能错过或错误地报告一些基于协作者的问题。 如果没有其他 Burp 实例在该项目上工作，您应该只从不同的 Burp 安装完全拥有一个项目。

本节英文原版地址：
[https://portswigger.net/burp/help/suite_gettingstarted.html#startupwizard_differentinstallation](https://portswigger.net/burp/help/suite_gettingstarted.html#startupwizard_differentinstallation)