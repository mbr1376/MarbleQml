#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qapplication.h>
#include <QtWebEngineQuick>
#include <marble/PositionTracking.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
    QLoggingCategory::setFilterRules("marble.debug=false\nmarble_lib.debug=false");

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
        QtWebEngineQuick::initialize();
    engine.addImportPath("/usr/local/lib/qml");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("MarbleQml", "Main");

    return app.exec();
}
