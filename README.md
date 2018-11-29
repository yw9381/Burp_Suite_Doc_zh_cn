# Burp Suite 2.0 官方文档中文版

-------------------------
![翻译完成度](https://img.shields.io/badge/翻译完成度-9/89-green.svg?style=plastic) [![PDF下载](https://img.shields.io/badge/downloads-PDF-blue.svg?style=plastic)](https://legacy.gitbook.com/download/pdf/book/yw9381/burp_suite_documentation_2_0_zh_cn) [![PDF下载](https://img.shields.io/badge/downloads-ePub-blue.svg?style=plastic)](https://legacy.gitbook.com/download/epub/book/yw9381/burp_suite_documentation_2_0_zh_cn) [![PDF下载](https://img.shields.io/badge/downloads-Mobi-blue.svg?style=plastic)](https://legacy.gitbook.com/download/mobi/book/yw9381/burp_suite_documentation_2_0_zh_cn)

本文档使用GitBook制作，基于 BurpSuite 内置的HTML文档，文档以Burp 版本号作为标示，最新的文档可至[官方网站文档中心](https://portswigger.net/burp/documentation)查看

## 开始阅读

-------------------------
[Burp Suite 文档主页](index.md)

当前中文文档版本 `v2.0beta` | [点击阅读](https://yw9381.gitbooks.io/burp_suite_documentation_2_0_zh_cn/content/) | [查看目录](contents.md) | [查看本书在GitBook的信息](https://legacy.gitbook.com/book/yw9381/burp_suite_documentation_2_0_zh_cn/details)  
当前英文文档版本 `v2.0.08beta` | [点击阅读](https://yw9381.github.io/Burp_Suite_Documentation_2.0_en_us/burp/documentation/index.html) | [查看仓库](https://github.com/yw9381/Burp_Suite_Documentation_2.0_en_us)



## 构建本书

-------------------------
本书基于`GitBook`制作，所以首先要使用npm安装GitBook

1. 下载并安装[NodeJS](https://nodejs.org/en/download/)
2. 下载并安装[Git](https://git-scm.com/downloads)
3. 使用npm安装gitbook
    ```bash
    npm install gitbook-cli -g
    ```
4. 使用npm安装电子书转换工具
    ```bash
    npm install ebook-convert -g
    ```
5. 克隆本项目
    ```bash
    git clone https://github.com/yw9381/Burp_Suite_Documentation_2.0_zh_cn
    ```
6. 生成最新版电子书
    ```bash
    cd Burp_Suite_Documentation_2.0_zh_cn/
    gitbook pdf ./ ./Burp_Suite_官方文档中文版_2.0.pdf   # 生成PDF
    gitbook epub ./ ./Burp_Suite_官方文档中文版_2.0.epub # 生成ePub
    gitbook mobi ./ ./Burp_Suite_官方文档中文版_2.0.mobi # 生成Mobi
    ```
7. 基于某一版本构建
    ```bash
    # 首先切换到某个版本，xxx代表版本标记，即git的tag
    git checkout xxx
    # 构建电子书，此处以pdf为例，xxx为保存文件的文件名中的版本号
    gitbook pdf ./ ./Burp_Suite_官方文档中文版_xxx.pdf
    ```

## 贡献力量

-------------------------
如果你想对本书做出一些贡献的话

- 可以帮忙校对，找bug错别字等等
- 可以提出专业方面的修改建议
- 可以把一些不尽人意的语句翻译的更好更有趣

对于以上各类建议，请以issue的形式发送，我看到之后会尽快处理

## 如何参与

-------------------------
将本书fork/pull到本地  
新建一个分支，然后联系我认领要翻译的章节  
使用MarkDown编辑器，md语法格式进行文档翻译及排版工作  
完成之后Pull Request该分支  
如没问题的话，我会合并到主分支  
如果不太明白md的排版，可以把翻译好的内容发送给我，我代为排版并提交  
如有其它问题，欢迎发送issue，谢谢~

## 开源协议

-------------------------
本书基于[WTFPL](https://en.wikipedia.org/wiki/WTFPL)协议开源。
