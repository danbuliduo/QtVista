#pragma once

#include <QObject>
#include <QJniObject>

class AndroidNotification : public QObject
{
    Q_PROPERTY(int instanceID READ getInstanceID)
    Q_PROPERTY(bool setwhen READ getSetwhen WRITE setSetwhen)
    Q_PROPERTY(QString channelName READ getChannelName WRITE setChannelName)
    Q_PROPERTY(QString contentTitle READ getContentTitle WRITE setContentTitle)
    Q_PROPERTY(QString contentText READ getContentText WRITE setContentText)
    Q_PROPERTY(QString smallIconR READ getSmallIconR WRITE setSmallIconR)
    Q_PROPERTY(QString largeIconR READ getLargeIconR WRITE setLargeIconR)
    Q_OBJECT

public:
    explicit AndroidNotification(QObject *parent = nullptr);
    Q_INVOKABLE void startNotify();
    Q_INVOKABLE void cancelNotify();
    Q_INVOKABLE void deleteChannel();
    const int & getInstanceID() const;
    const bool& getSetwhen() const;
    void setSetwhen(const bool &setbool);
    const QString& getChannelName() const;
    void setChannelName(const QString &channelname);
    const QString& getContentTitle() const;
    void setContentTitle(const QString &contenttitle);
    const QString& getContentText() const;
    void setContentText(const QString &contenttext);
    const QString& getSmallIconR() const;
    void setSmallIconR(const QString &largeIcon);
    const QString& getLargeIconR() const;
    void setLargeIconR(const QString &largeIconR);
private:
    const int instanceID;
    bool setwhen;
    QString channelName;
    QString contentTitle;
    QString contentText;
    QString smallIconR;
    QString largeIconR;
    QJniObject jni_Notification;
};

