#---------------------------------------README---------------------------------------
#1.目标系统为Android且需使用VistaAndroid.pri时
#--项目运行前会将$$PWD/VistaAndroid/scr下的文件拷贝至$$ANDROID_PACKAGE_SOURCE_DIR/src路径下
#--请将include(QtVista.pri)指令 在定义 ANDROID_PACKAGE_SOURCE_DIR 之后使用，以免造成拷贝失败
#2.QtVista.pri文件android {. ..... }中DEFINE的使用，详细请参照VistaAndroid.pri
#--VISTA_ANDROID 启用VistaAndroid工具的宏定义
#--QTVA_SERVICEMANAGER 封装了安卓系统服务
#---------------------------------------------------------------------------------------

QML_IMPORT_PATH = $$PWD

RESOURCES += $$PWD/VistaQuick.qrc

android {
    QT+= svg
    DEFINES += VISTA_ANDROID
    DEFINES += QTVA_SERVICEMANAGER
    include($$PWD/VistaAndroid/VistaAndroid.pri)
}

