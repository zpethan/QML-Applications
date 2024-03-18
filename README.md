# QML-Applications
跟着`Qt`官网`QML Applications`页面学习`QML`和`Qt Quick`。

# 前言

作者也是初学者，看过一些书，但是总是感觉不得其法，读起来总感觉不够酣畅痛快。究其原因，大概是每本书都注重自己领域的某个点，从点出发，导致多本书的内容无法串起来，比如有些书专门针对`QWidgets`进行讲解，项目结构也是依照`QWidgets`，使用的也是`qmake`进行构建；有的书使用`Qt quick`，使用`CMake`进行配置；有些还会使用`Qt design studio`。这些不同的项目，项目结构差别很大，涉及到的文件后缀五花八门，有`.pro`, `.ui`,`.qmlproject`,`.qml`,`CMakeLists.txt`,同一个后缀，如`.qml`还分`Main.qml`,`App.qml`,`Screen01.ui.qml`，这对初学者来说是一个灾难。并且，有的书专门讲解`QML`，不考虑项目的问题，结果按照书上写的`QML`代码，不知如何构建运行，这就导致初学者无法快速看见成果。本来`C++`用得挺溜的工程师，慕`Qt`之名而来，结果出师未捷，晕头转向，故而，放弃学习和使用`Qt`。

经过一些梳理，作者决定从`Qt`官方文档出发，来一次知识的串联，彻底梳理清楚心中的疑惑。

# 本系列侧重点

本系列目前基于`Qt-6.5`，主要学习`QML-Application`（对应官网页面[QML Applications | Qt 6.5](https://doc.qt.io/qt-6.5/qmlapplications.html)），从6.0开始，`Qt`就建议使用`CMake`来配置项目了，简直是`C++`开发者的福音，不需要再学一套`qmake`构建系统，`.pro`配置文件了，所以，我们直接放弃对`qmake`和`.pro`的学习，使用`CMakeLists.txt`走起。

