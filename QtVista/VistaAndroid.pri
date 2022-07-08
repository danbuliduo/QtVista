QML_IMPORT_PATH = $$PWD
INCLUDEPATH += $$PWD

QT += svg
QT += core-private

#LIBS += -L jnigraphics
RESOURCES += $$PWD/VistaAndroid.qrc
versionAtLeast(QT_VERSION, 6.0.0) {
    !equals(QT_ARCH, $$first(ANDROID_ABIS)) {

    }
}

contains(DEFINES, VISTA_ANDROID){
    equals(QMAKE_HOST.os , Windows) {
         make_src_dir.commands += $(CHK_DIR_EXISTS) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qtvista/android/bindings) $(MKDIR) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qtvista/android/bindings)
         make_src_dir.commands += $(CHK_DIR_EXISTS) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qtvista/android/cores) $(MKDIR) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qtvista/android/cores)
         PRE_TARGETDEPS += make_src_dir
         QMAKE_EXTRA_TARGETS += make_src_dir
    } else {
         make_tools_dir.commands = $(MKDIR) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qtvista/android/cores)
    }
    HEADERS += $$PWD/VistaAndroid/QtVistaAndroid.h
    SOURCES += $$PWD/VistaAndroid/QtVistaAndroid.cpp

    DISTFILES += $$PWD/VistaAndroid/src/io/kanbuki/qtvista/android/bindings/QtVistaActivity.java
    vista_android.commands = $(COPY_FILE) $$shell_path($$PWD/VistaAndroid/src/io/kanbuki/qtvista/android/bindings/QtVistaActivity.java)  $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qtvista/android/bindings)
    PRE_TARGETDEPS += vista_android
    QMAKE_EXTRA_TARGETS += vista_android

    contains(DEFINES, QTVA_SERVICEMANAGER){
        HEADERS += \
        $$PWD/VistaAndroid/AndroidSystemService.h
        SOURCES += \
        $$PWD/VistaAndroid/AndroidSystemService.cpp
        DISTFILES += $$PWD/VistaAndroid/src/io/kanbuki/qtvista/android/cores/AndroidSystemService.java
        service_manager.commands = $(COPY_FILE) $$shell_path($$PWD/VistaAndroid/src/io/kanbuki/qtvista/android/cores/AndroidSystemService.java) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qtvista/android/cores)
        PRE_TARGETDEPS += service_manager
        QMAKE_EXTRA_TARGETS += service_manager
    }
    DISTFILES += $$PWD/VistaAndroid/src/io/kanbuki/qtvista/android/cores/AndroidNotification.java
    android_notification.commands = $(COPY_FILE) $$shell_path($$PWD/VistaAndroid/src/io/kanbuki/qtvista/android/cores/AndroidNotification.java) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qtvista/android/cores)
    PRE_TARGETDEPS += android_notification
    QMAKE_EXTRA_TARGETS += android_notification
}

HEADERS += \
    $$PWD/VistaAndroid/AndroidNotification.h

SOURCES += \
    $$PWD/VistaAndroid/AndroidNotification.cpp



