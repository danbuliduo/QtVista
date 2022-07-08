#pragma once

#include <QObject>
#include <QJniObject>
#include <QQmlEngine>

class AndroidSystemService : public QObject
{
    Q_OBJECT
public:
    explicit AndroidSystemService(QObject *parent = nullptr);
    static QObject* qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine);
    Q_INVOKABLE void setVibratorService();
    Q_INVOKABLE int getBatteryInfo();
signals:

};

