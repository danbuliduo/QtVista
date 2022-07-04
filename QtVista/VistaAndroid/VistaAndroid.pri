QT += core-private
#LIBS += -L jnigraphics
INCLUDEPATH += $$PWD

versionAtLeast(QT_VERSION, 6.2.0) {
    !equals(QT_ARCH, $$first(ANDROID_ABIS)) {

    }
}

contains(DEFINES, VISTA_ANDROID){
    equals(QMAKE_HOST.os , Windows) {
         make_src_dir.commands = $(CHK_DIR_EXISTS) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qt/android/vista) $(MKDIR) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qt/android/vista)
         PRE_TARGETDEPS += make_src_dir
         QMAKE_EXTRA_TARGETS += make_src_dir
    } else {
         make_tools_dir.commands = $(MKDIR) $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qt/android/vista)
    }
    HEADERS += $$PWD/QtVistaAndroid.h
    SOURCES += $$PWD/QtVistaAndroid.cpp
    DISTFILES += $$PWD/src/io/kanbuki/qt/android/vista/Debug.java
    vista_android.commands = $(COPY_FILE) $$shell_path($$PWD/src/io/kanbuki/qt/android/vista/Debug.java)  $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qt/android/vista/)
    PRE_TARGETDEPS += vista_android
    QMAKE_EXTRA_TARGETS += vista_android

    contains(DEFINES, QTVA_SERVICEMANAGER){
        HEADERS += $$PWD/AndroidServiceManager.h
        SOURCES += $$PWD/AndroidServiceManager.cpp
        DISTFILES += $$PWD/src/io/kanbuki/qt/android/vista/AndroidServiceManager.java
        service_manager.commands = $(COPY_FILE) $$shell_path($$PWD/src/io/kanbuki/qt/android/vista/AndroidServiceManager.java)  $$shell_path($$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qt/android/vista)
        PRE_TARGETDEPS += service_manager
        QMAKE_EXTRA_TARGETS += service_manager
    }
}

