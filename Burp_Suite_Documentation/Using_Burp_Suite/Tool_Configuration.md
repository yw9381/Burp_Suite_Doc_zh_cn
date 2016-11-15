# 工具配置

Burp 包含大量[配置选项](../../Options/README.md)，通常来说，您需要在测试的不同阶段相互配合的使用它们，以确保 Burp 按照您所需要的方式工作。例如：

- **显示** - 您可以配置用于显示HTTP消息的[字体](../../Options/Display/HTTP_Message_Display.md)和[字符集](../../Options/Display/Character_Sets.md)，以及 Burp UI 中的[字体](../../Options/Display/User_Interface.md)。
- **目标范围** - [目标范围](../../Target/Scope.md)的配置设置了您目前感兴趣并愿意攻击的项目。您应该在测试的初期进行配置，因为它可以控制在 Proxy 组件的[历史记录](../../Proxy/History/Display_Filter.md)和 Target 组件的[站点地图](../../Target/Site_Map/Display_Filter.md)中显示哪些项目或是信息，在 Proxy 组件中[拦截](../../Proxy/Options/Intercepting_HTTP_Requests_and_Responses.md)哪些消息以及可以[爬取](../../Spider/Control_Tab/Spider_Scope.md)和[扫描](../../Scanner/Initiating_Scans/Live_Scanning/Live_Active_Scanning.md)内容的范围。
- **身份验证** - 如果应用程序服务器采用任何平台级（HTTP）身份验证，您可以配置 Burp 来自动处理[身份验证](../../Options/Connections/Platform_Authentication.md)相关的操作。
- **会话处理** - 许多应用程序包含可能阻碍自动或手动测试的功能，例如反应式会话终止，使用请求令牌和有状态的多阶段进程。您可以[配置Burp](../../Options/Sessions/README.md)使用[会话处理规则](../../Options/Sessions/Session_Handling_Rules/README.md)和[宏](../../Options/Sessions/Macros/README.md)来组合处理大多数类似这样的情况。
- **保存和恢复状态** - 您可以随时保存[Burp的当前状态]()，在以后需要的时候随时[恢复](../../Suite_Function/Saving_and_Restoring_State/Restoring_State/README.md)。
- **任务调度** - 您可以配置 Burp 按给定时间或时间间隔来[调度任务](../../Suite_Function/Task_Scheduler.md)，以允许您在指定的测试窗口内工作。


本节英文原版地址：  
[https://portswigger.net/burp/help/suite_usingburp.html#config](https://portswigger.net/burp/help/suite_usingburp.html#config)