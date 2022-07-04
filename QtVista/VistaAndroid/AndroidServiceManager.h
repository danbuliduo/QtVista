#pragma once

#include <QObject>
#include <QJniObject>
#include <QQmlEngine>

class AndroidServiceManager : public QObject
{
    Q_OBJECT
public:
    explicit AndroidServiceManager(QObject *parent = nullptr);
    static QObject* qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine);
    Q_INVOKABLE void startVibratorService();

signals:

};

