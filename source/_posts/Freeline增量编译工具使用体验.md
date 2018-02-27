---
title: Freeline增量编译工具使用体验
date: 2018-02-25 16:54:49
tags:
---
# Freeline(0.8.2版)增量编译工具使用体验

![Freeline](http://ww4.sinaimg.cn/large/006tNc79gw1f6ooza8pkuj30h804gjrk.jpg)


> 为了节约更多喝咖啡时间，克服项目构建时容易蹭聊天的习惯。

## 环境构建
事实证明，国内用Gardle命令构建打断腿的慢，建议直接下载gradle-all.zip，放到Gradle环境变量目录
mac目录在：
`user/.gradle/wrapper/dists/gradle-xx.all
`
win类似，找到环境变量文件夹.gradle下面目录。
tip:分享个不需要到直接下载你项目gradle的技巧
![](http://ogmiq4hkc.bkt.clouddn.com/gradle-down.png)
将`distributionUrl=https\://services.gradle.org/distributions/gradle-2.14.1-all.zip`
修改为如：[https://services.gradle.org/distributions/gradle-2.14.1-all.zip](https://services.gradle.org/distributions/gradle-2.14.1-all.zip)
类似3.0、3.1的gradle-all.zip也可以直接下载。我测试在用迅雷下速度感人，2m/s。 


`initFreeline`如果很慢（工作家庭网络测试多次不加参数都会很慢），建议加上参数，执行`./gradlew initFreeline -Pmirror`
试换国内源，关闭vpn（注意）。

## 使用说明
详细使用参考文章下面的官方文档。
需要说明的是，一定要安装官方的插件。
![](http://ogmiq4hkc.bkt.clouddn.com/FreeLine-puugin.png)
一次全量编译后，每次修改直接点插件按钮运行，下面Freeline py命令行窗口（别学我开始还像之前傻傻的点运行），任务运行时间提示。
![](http://ogmiq4hkc.bkt.clouddn.com/bulit.png)
增量修改秒编译，测试一般改改代码，重行运行，平均15s左右，想想之前编译一次一分钟以上，喝咖啡时间都浪费在蹭聊天上。感谢Freeline

0.82初次使用py文件某行提示有问题试下
`python freeline.py -f -d`绕过问题，或者`gradlew initFreeline -PfreelineVersion=0.8.1`
回到0.81版本


## 心得分享
至于有没有坑，使用一段时间再回来补充。目前**[issues](https://github.com/alibaba/freeline/issues)**回复跟项目更新还是很实时。

* 新建butterknife点击事件时候找不到id，需要重新`  ./gradlew clean`
大多资源问题，这方法能解决，类似rebuild


## 参考资料
[推荐-新出官网文档](https://www.freelinebuild.com/docs/zh_cn/###)
[Github官方中文文档](https://github.com/alibaba/freeline/blob/master/README-zh.md)

