QT += quick widgets

SOURCES += Main.cpp

RESOURCES += qml.qrc

include(../QtVista/VistaQuick.pri)

android{
   DISTFILES += Android/AndroidManifest.xml
   ANDROID_PACKAGE_SOURCE_DIR = $$PWD/Android
}
win32{
    RC_ICONS = $$PWD/res/LOGO.ico
}
macx{
    RC_ICONS = $$PWD/res/LOGO.ico
}
unix:!macx{
    RC_ICONS = $$PWD/res/LOGO.ico
}

