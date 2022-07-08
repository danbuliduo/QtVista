#include <QTimer>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include  "VistaAndroid/QtVistaAndroid.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setApplicationVersion("1.0.0-Alpha");
    app.setApplicationName("QtVistaAndroid");
    app.setOrganizationName("HUBEI MINZU UNIVERSITY");

    QTimer::singleShot(20000, &app, [=] () {
        QNativeInterface::QAndroidApplication::hideSplashScreen(20000);
    });

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/"));
    QtVistaAndroid::initializeVistaQml();

    const QUrl url(QStringLiteral("qrc:/Application.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl){ QCoreApplication::exit(-1);}
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
