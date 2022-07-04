#pragma once

#include <QObject>
#include <QQmlEngine>
#include <QJniObject>

class QtVistaAndroid : public QObject
{
    Q_OBJECT
public:
    explicit QtVistaAndroid(QObject *parent = nullptr);
    static  QObject*  qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine);
    static void initializeVistaQml();
};

