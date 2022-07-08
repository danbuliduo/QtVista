#include <QIcon>
#include <QFontDatabase>
#include <QApplication>
#include <QQmlApplicationEngine>
#ifdef VISTA_ANDROID
//#include "QtVistaAndroid.h"
#endif

int main(int argc, char *argv[])
{
    qputenv("QSG_RHI_BACKEND", "opengl");
    QApplication app(argc, argv);
    app.setWindowIcon(QIcon("qrc:/res/icons/logo-v.ico"));
    app.setApplicationVersion("1.0.0-Alpha");
    app.setApplicationName("QtVistaQuick");
    app.setOrganizationName("HUBEI MINZU UNIVERSITY");


    int fontid = QFontDatabase::addApplicationFont(QStringLiteral(":/res/fonts/DroidSansFallback.ttf"));
    if(fontid != -1){
        QStringList basefont = QFontDatabase::applicationFontFamilies(fontid);
        if(basefont.size() != 0){
            QFont font(basefont.at(0));
            app.setFont(font);
        }
    }

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("qrc:/"));

    const QUrl url(QStringLiteral("qrc:/MainWindow.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl){ QCoreApplication::exit(-1);}
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
