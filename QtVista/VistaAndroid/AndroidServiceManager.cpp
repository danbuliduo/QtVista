#include "AndroidServiceManager.h"

#include <QtCore/private/qandroidextras_p.h>

AndroidServiceManager::AndroidServiceManager(QObject *parent) : QObject{parent}
{

}
QObject* AndroidServiceManager::qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine){
    Q_UNUSED(engine);
    Q_UNUSED(scriptEngine);
    AndroidServiceManager *androidServiceManager = new AndroidServiceManager();
    return androidServiceManager;
}

void AndroidServiceManager::startVibratorService(){
    QJniObject::callStaticMethod<void>(
                "io/kanbuki/qt/android/vista/AndroidServiceManager",
                "startVibratorService",
                "(Landroid/content/Context;)V",
                 QtAndroidPrivate::context());
}
