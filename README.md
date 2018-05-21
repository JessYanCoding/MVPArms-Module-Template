# MVPArms-Module-Template
**一键搭建 [MVPArms](https://github.com/JessYanCoding/MVPArms) 的官方架构, 让新手一秒即可开启 MVPArms 的世界, 免于项目繁琐配置的烦恼**

> **Tips: 先使用 MVPArms-Module-Template (Module 级一键模板) 一键搭建 MVPArms 的整体架构, 再使用 [MVPArmsTemplate](https://github.com/JessYanCoding/MVPArmsTemplate) (页面级一键模板) 一键生成每个业务页面所需要的 MVP 及 Dagger2 相关类, 即可让什么都不懂的新手也可以一秒开启 MVPArms 的世界!**  
> **若您基于本模板修改并且开源于网络, 请注明出处, 尊重开源, 才有人愿意开源, 谢谢!**

## Overview
![gif](art/MVPArms-Module-Template.gif)

## 如何安装？
请将 **NewArmsModule** 这个文件夹复制到 **AndroidStudio Module** 模版的存放路径, 请注意是复制整个文件夹, 不是里面的内容!

**AndroidStudio Module** 模版存放路径 (**请注意 Module 级模板和页面级模板的存放路径不一样, 不要放错了!**):

* Windows : AS安装目录/plugins/android/lib/templates/gradle-projects

* Mac : /Applications/Android Studio.app/Contents/plugins/android/lib/templates/gradle-projects

**最后记得重启 AndroidStudio !**

## 如何使用?
使用时按下图步骤即可, 也可以使用快捷键, **Mac** 的快捷键是在项目名上按 **Command + n**, 选择  **Module**, **Windows** 快捷键自己百度

![step](art/step.jpg)

## 注意事项
* 本模板是基于 [MVPArms](https://github.com/JessYanCoding/MVPArms) 开发的, 所以使用的是 **MVPArms** 的整体架构, 模板依赖了 **MVPArms** 官方工程中的一些文件如 [config.gradle](https://github.com/JessYanCoding/MVPArms/blob/master/config.gradle), 最优的方式是直接 **clone** 或下载 **MVPArms** 的官方工程后, 在工程上面直接使用本模板, 开始业务的开发, 让您免于项目繁琐配置的烦恼

* 本模板生成的是一个可以独立运行的 **Application Module**, 模板生成后您可以把 **MVPArms** 官方工程中的 **app (Demo)** 和 **arms** 两个 **Module** 同时删除掉, 这样, 一个完全属于您及您公司的 **MVP + Dagger2 + Retrofit + Rxjava** 项目就这样轻而易举的诞生了

* 此模板会持续保持更新, 但只保证能够兼容最新的 **AndroidStudio 稳定版**, 暂不提供其他版本

  ![attention-1](art/attention.jpg)

  ![attention-2](https://raw.githubusercontent.com/JessYanCoding/ArmsComponent-Template/master/art/attention-2.jpeg)