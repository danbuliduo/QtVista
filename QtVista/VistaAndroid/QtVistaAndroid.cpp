#include "QtVistaAndroid.h"
#ifdef QTVA_SERVICEMANAGER
#include "AndroidServiceManager.h"
#endif

#include <QElapsedTimer>
QtVistaAndroid::QtVistaAndroid(QObject *parent) : QObject{parent}
{

}

QObject* QtVistaAndroid::qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine){
    Q_UNUSED(engine);
    Q_UNUSED(scriptEngine);
    QtVistaAndroid *qtVistaAndroid = new QtVistaAndroid();
    return qtVistaAndroid;
}

void QtVistaAndroid::initializeVistaQml(){
    QElapsedTimer t;
    t.start();
    QJniObject obj;
    obj.callStaticMethod<void>(
                "io/kanbuki/qt/android/vista/Debug",
                "deBUG",
                "()V");
   qDebug()<<(double)t.nsecsElapsed()/(double)1000000<<"ms";
    qmlRegisterSingletonType<QtVistaAndroid>("QtVista.Android", 1, 0 , "QtVistaAndroid",&QtVistaAndroid::qmlInstance);
#ifdef QTVA_SERVICEMANAGER
    qmlRegisterSingletonType<AndroidServiceManager>("QtVista.Android", 1, 0, "AndroidServiceManager", &AndroidServiceManager::qmlInstance);
#endif
}
