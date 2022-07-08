#include "QtVistaAndroid.h"
#ifdef QTVA_SERVICEMANAGER
#include "AndroidSystemService.h"
#endif
#include "AndroidNotification.h"
#include <QElapsedTimer>
#include <QtCore/private/qandroidextras_p.h>

QtVistaAndroid::QtVistaAndroid(QObject *parent) : QObject{parent}
{

}

void QtVistaAndroid::initializeVistaQml(){
    QElapsedTimer t;
    t.start();
   /*
   QJniObject javaNotification = QJniObject::fromString("debug");
   QJniObject debug= QJniObject(
               "io/kanbuki/qt/android/vista/AndroidNotification",
               "(Landroid/app/Activity;Ljava/lang/String;I)V",
               QtAndroidPrivate::activity(), javaNotification.object<jstring>(),6);
    debug.callMethod<void>("initNotification",
                           "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
                           QJniObject::fromString("icon").object<jstring>(),
                           QJniObject::fromString("title").object<jstring>(),
                           QJniObject::fromString("text").object<jstring>());
    debug.callMethod<void>("setLargeIcon","(Ljava/lang/String;)V",
                           QJniObject::fromString("icon").object<jstring>());
    debug.callMethod<void>("startNotify","()V",7);*/
    qDebug()<<(double)t.nsecsElapsed()/(double)1000000<<"ms";
    qmlRegisterType<AndroidNotification>("VistaAndroid.Cores", 1, 0, "AndroidNotification");
#ifdef QTVA_SERVICEMANAGER
    qmlRegisterSingletonType<AndroidSystemService>("VistaAndroid.Cores", 1, 0, "AndroidSystemService", &AndroidSystemService::qmlInstance);
#endif
}
