#include "AndroidNotification.h"

#include <QtCore/private/qandroidextras_p.h>
#include <QFuture>
static int instancesCount = -1;

AndroidNotification::AndroidNotification(QObject *parent) : QObject{parent} ,
 instanceID(instancesCount++){
    jni_Notification=QJniObject(
                "io/kanbuki/qtvista/android/cores/AndroidNotification",
                "(Landroid/app/Activity;I)V",
                QtAndroidPrivate::activity(),
                instanceID);
}
void AndroidNotification::startNotify(){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>("startNotify","()V");
    }
}
void AndroidNotification::cancelNotify(){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>("cancelNotify","()V");
    }
}
void AndroidNotification::deleteChannel(){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>("deleteNotificationChannel","()V");
    }
}
const int & AndroidNotification::getInstanceID() const {
    return instanceID;
}
const bool & AndroidNotification::getSetwhen() const{
    return setwhen;
}
void AndroidNotification::setSetwhen(const bool &setbool){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>("setWhen","(Z)V",setbool);
        setwhen = setbool;
    }
}
const QString& AndroidNotification::getChannelName() const {
    return channelName;
}
void AndroidNotification::setChannelName(const QString &channelname){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "createNotificationChannel",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(channelname).object<jstring>());
        channelName = channelname;
    }
}
const QString& AndroidNotification::getContentTitle() const {
    return contentTitle;
}
void AndroidNotification::setContentTitle(const QString &contenttitle){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setContentTitle",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(contenttitle).object<jstring>());
        contentTitle = contenttitle;
    }
}
const QString& AndroidNotification::getContentText() const {
    return contentText;
}
void AndroidNotification::setContentText(const QString &contenttext){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setContentText",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(contenttext).object<jstring>());
        contentText = contenttext;
    }
}
const QString& AndroidNotification::getSmallIconR() const {
    return smallIconR;
}
void AndroidNotification::setSmallIconR(const QString &smallIcon){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setSmallIcon",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(smallIcon).object<jstring>());
        smallIconR = smallIcon;
    }
}
const QString& AndroidNotification::getLargeIconR() const {
    return largeIconR;
}
void AndroidNotification::setLargeIconR(const QString &largeIcon){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setLargeIcon",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(largeIcon).object<jstring>());
        largeIconR = largeIcon;
    }
}
