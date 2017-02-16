#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <QtCharts/QChart>
#include <QtCharts/QSplineSeries>
#include <QtWidgets/QApplication>
#include <QtQuick/QQuickView>
#include <QtCore/QDir>
#include <QtQml/QQmlEngine>


#include "roscontroller.h"

int main(int argc, char *argv[])
            {
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
//    QGuiApplication app(argc, argv);

//    ROSController rosController;

//    QQmlApplicationEngine engine;

//    engine.rootContext()->setContextProperty("ROSController", &rosController);

//    /*cv::Mat toDisplay(cv::Size(800, 600), CV_8UC3, cv::Scalar(50, 200, 50));
//    cv::imshow("Test", toDisplay);
//    cv::waitKey();*/

//    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

//    return app.exec();


    // Qt Charts uses Qt Graphics View Framework for drawing, therefore QApplication must be used.
    QApplication app(argc, argv);

    QQuickView viewer;
    // The following are needed to make examples run without having to install the module
    // in desktop environments.
#ifdef Q_OS_WIN
    QString extraImportPath(QStringLiteral("%1/../../../../%2"));
#else
    QString extraImportPath(QStringLiteral("%1/../../../%2"));
#endif
    viewer.engine()->addImportPath(extraImportPath.arg(QGuiApplication::applicationDirPath(),
                                      QString::fromLatin1("qml")));


    ROSController rosController;


    viewer.engine()->rootContext()->setContextProperty("ROSController", &rosController);


    QObject::connect(viewer.engine(), &QQmlEngine::quit, &viewer, &QWindow::close);

    viewer.setTitle(QStringLiteral("UAS Ground System"));

    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.show();



    return app.exec();
}
