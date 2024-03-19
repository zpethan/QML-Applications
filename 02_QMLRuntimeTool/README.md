# 使用QML Runtime Tool进行原型设计

[FirstStepWithQML](../01_FirstStepWithQML/README.md)中已经使用过qml加载和显示我们编写的`.qml`文件，在继续下一步之前，我们讲讲`qml`这个工具。

`qml`可执行文件是一个实用程序，用于加载和显示`QML` 文件。它主要时用来测试`QML`应用和组件的。

在生产环境下，通常我们会开发一个C++应用，或者将`QML`文件绑定到一个模块里。如果将`Item`而不是`Window`作为`QML`文档的根元素的话，`qml`程序会自动创建一个window来显示`QML`文档内容。但是，`QQmlComponent::create()`不会做这件事，这意味着在生产环境下，将设计好的原型移植到C++应用前，我们需要确保根元素是`Window`，或者在C++中创建一个`QQuickView`来包含根`Item`。也就是说，你可以脱离C++代码，直接使用`qml`来开发界面的各个部分，并进行界面原型测试。

要加载并展示一个`.qml`文件，可以直接在命令行输入：

```sh
qml myqmlfile.qml
```

要查看配置选项，可以输入`qml --help`。

# qml显示原理

当我们的`QML`文件的根对象是一个`Item`而不是`Window`时，在显示该对象前，`qml`会先加载一个配置文件（`configuration.qml`），内容类似下面这样：

```
import QmlRuntime.Config

Configuration {
    PartialScene {
        itemType: "QQuickItem"
        container: Qt.resolvedUrl("ItemWrapper.qml")
    }
}
```

这个文件定义了声明了一个`PartialScene`对象，该对象的`container`属性被填写为一个`URL`地址，该地址指向另一个`QML`文件`ItemWrapper.qml`，最简单的`ItemWrapper.qml`实现长这样：

```
import QtQuick

Window {
    required property Item containedObject: null
    onContainedObjectChanged: {
        if (containedObject == undefined || containedObject == null) {
            visible = false;
        } else {
            containedObject.parent = contentItem;
            visible = true;
        }
    }
}
```

`qml`运行时会直接将`containedObject`设置为要显示的`Item`对象，`containedObject`这个名字是必须的，不可修改。`containedObject.parent = contentItem;`则将`Item`的父对象设置为当前的`Window`。这样就能完成显示了。

理解上面的原理，我们就可以任意自定义额外的显示特性了：比如以自定义的方式处理resizing等等。

自定义的配置如果命名为`configuration.qml`，则可以直接`qml myqmlfile.qml`运行，`qml`会自动加载`configuration.qml`文件，如果是其他名字，比如`simplest.qml`，则可以这样加载：

```sh
qml -c simplest myqmlfile.qml
```

# qml默认配置文件

除了可以自定义配置文件，qml提供了两个内置的配置文件，这两个文件以资源的形式内置到`qml`可执行文件中，要列举他们，可以用下面的命令：

```sh
qml --list-conf
```

输出如下：

```
Built-in configurations:
  default
  resizeToItem
```

`default`配置提供默认行为：根`Item`将会在启动阶段被resize到填充整个`Window`，用户在resize Window时，根`Item`也会跟着变化以填充Window；

`resizeToItem`的行为：根`Item`可以设置为他自己的尺寸，`Window`会适应`Item`的尺寸。

如果想使用`resizeToItem`，我们可以使用下面的命令：

```sh
$ qml -c resizeToItem selfResizingItem.qml
```



