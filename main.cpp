#include <QtWidgets/QApplication>
#include <QtQuick/QQuickView>
#include <QtCore/QDir>
#include <QtQml/QQmlEngine>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QScreen>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QFontDatabase>
#include <QDebug>
int main(int argc, char *argv[])
{

    /*
    // Qt Charts uses Qt Graphics View Framework for drawing, therefore QApplication must be used.
    QApplication app(argc, argv);
    QQuickView viewer;
    // The following are needed to make examples run without having to install the module
    // in desktop environments.
#ifdef Q_OS_WIN
    QString extraImportPath(QStringLiteral("%1/../../../../%2"));
#elseSensors
    QString extraImportPath(QStringLiteral("%1/../../../%2"));
#endif
    viewer.engine()->addImportPath(extraImportPath.arg(QGuiApplication::applicationDirPath(),
                                      QString::fromLatin1("qml")));
    QObject::connect(viewer.engine(), &QQmlEngine::quit, &viewer, &QWindow::close);
    viewer.setTitle(QStringLiteral("UAS Ground System"));
    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.setGeometry(QGuiApplication::primaryScreen()->geometry());
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    //viewer.showMaximized();
    viewer.show();
    return app.exec();
    */


    QGuiApplication::setApplicationName("UAS Ground System");
    QGuiApplication::setOrganizationName("UASGS-CSULA");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QSettings settings;
    QString style = QQuickStyle::name();
    if (!style.isEmpty())
        settings.setValue("style", style);
    else
        QQuickStyle::setStyle(settings.value("style").toString());
    QFontDatabase fontDb;

    QStringList fonts = fontDb.families();

    for(int i = 0; i < fonts.size(); i++){
        qDebug() << "Font " << i << ": " << fonts[i];
    }

    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
