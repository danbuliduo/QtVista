#pragma once

#include <QObject>
#include <QQmlEngine>
#include <QJniObject>

class QtVistaAndroid : public QObject
{
    Q_OBJECT
public:
    explicit QtVistaAndroid(QObject *parent = nullptr);
    static void initializeVistaQml();
};

