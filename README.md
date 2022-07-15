# QtVista

QtVista是一组基于Material风格的QML组件集与工具集，QtVista的工具集为Android适配了一些系统方法。当然基于Material风格的组件可以适用于多个平台
这个项目来自我使用QT开发Android时发现QT在移动端许多功能尚不完善，还需要面临非常多的问题，故此专门为QT For Android编写了一套额外的工具类和一些UI小组件
用来方便Android开发，QtVista项目为此而生!

## 运行实例

### MainDemo

### AndroidDemo
测试阶段

# 怎样使用QtVista?

---

## 使用 QMake进行构建
按照这些步骤操作即可

1.通过键入将 QtVista 添加为子模块`git submodule add git@gitlab.com:DMing-CN/QtVista.git`

2.更新子模块`git submodule update --recursive --init`(也可以在不添加子模块的情况下手动将包装文件放入项目中)

3.添加必要的QT模块`QT += quick`到您的 .pro文件中
```qmake
QT += quick
```
4.添加'include(../QtVista/QtVista.pri)'到您的 .pro 文件
```qmake
include(../QtVista/QtVista.pri)
```
5.添加导入路径到您的`main.cpp`中，否则QT会找不到QtVista中的模块
```cpp
QQmlApplicationEngine engine;
engine.addImportPath(QStringLiteral("qrc:/"));
```
6.为了发挥QtVista组件的较好的效果请添加一份`qtquickcontrols2.conf`文件并声明如下
```conf
[Controls]
Style=Material
[Material]
Variant=Dense
```
7.最后导入QtVista的组件模块开始您的第一个实例
```qml
import VistaQuick.Controls 1.0
import VistaQuick.Controls.Dialog 1.0
import VistaQuick.Controls.LoadingIndicator 1.0
......
```

### 附加VistaAndoid模块
针对目标平台为Android时附加的模块

注意: 如果使用`VistaAndroid.pri`中的安卓工具集必须将`include(QtVista.pri)`在定义`ANDROID_PACKAGE_SOURCE_DIR`之后使用，以免造成java源文件拷贝失败

---

# 关于这个项目
这个项目目前由我个人维护，我在大学期间会利用闲余的时间来完善更新这个项目，所以项目中有不足的地方还请见谅。QtVista中的图片资源来自:
- https://www.freepik.com
- https://www.iconfont.cn

(如果我使用的图片资源涉及侵权，请联系我的邮箱Dm5862110@outlook.com)🙂🙂🙂谢谢支持!
