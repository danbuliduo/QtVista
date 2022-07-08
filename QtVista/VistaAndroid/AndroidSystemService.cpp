#include "AndroidSystemService.h"

#include <QtCore/private/qandroidextras_p.h>
#define FLAG_TRANSLUCENT_STATUS 0x04000000
#define FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS 0x80000000
// View
#define SYSTEM_UI_FLAG_LIGHT_STATUS_BAR 0x00002000
#include <QColor>
AndroidSystemService::AndroidSystemService(QObject *parent) : QObject{parent}{ }

QObject* AndroidSystemService::qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine){
    Q_UNUSED(engine);
    Q_UNUSED(scriptEngine);
    AndroidSystemService *androidSystemService = new AndroidSystemService();
    return androidSystemService;
}



void AndroidSystemService::setVibratorService(){
    //QJniObject o = QtAndroidPrivate::activity();
    //QJniObject window=o.callObjectMethod("getWindow", "()Landroid/view/Window;");
    // window.callMethod<void>("addFlags", "(I)V", FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
     //window.callMethod<void>("clearFlags", "(I)V", FLAG_TRANSLUCENT_STATUS);
     //window.callMethod<void>("setStatusBarColor", "(I)V", QColor("#FF0000").rgba());
    QJniObject::callStaticMethod<void>(
                "io/kanbuki/qtvista/android/cores/AndroidSystemService",
                "setVibratorService",
                "(Landroid/content/Context;)V",
                 QtAndroidPrivate::context());
    qDebug()<<getBatteryInfo();
}

int AndroidSystemService::getBatteryInfo(){
    return QJniObject::callStaticMethod<jint>(
                        "io/kanbuki/qtvista/android/cores/AndroidSystemService",
                        "getBatteryInfo",
                         "(Landroid/content/Context;)I",
                         QtAndroidPrivate::context());
}
