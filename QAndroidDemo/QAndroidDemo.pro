android{
    QT += quick
    SOURCES += Application.cpp
    RESOURCES += qml.qrc

    DISTFILES += Android/AndroidManifest.xml
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/Android
    include(../QtVista/VistaQuick.pri)
    DEFINES += VISTA_ANDROID
    DEFINES += QTVA_SERVICEMANAGER
    include(../QtVista/VistaAndroid.pri)
}

