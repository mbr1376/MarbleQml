#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qapplication.h>
#include <QtWebEngineQuick>
#include <marble/PositionTracking.h>

int main(int argc, char *argv[])
{
        //qInstallMessageHandler(customMessageHandler);  // نصب هندلر
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
        QtWebEngineQuick::initialize();
    engine.addImportPath("/usr/local/lib/qml");
    //qmlRegisterType<MarbleMapItem>("CustomMarble", 1, 0, "MarbleMap");
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("MarbleQml", "Main");

    return app.exec();
}
