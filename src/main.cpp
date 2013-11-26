//#ifdef QT_QML_DEBUG
#include <QtQuick>
//#endif

#include <sailfishapp.h>

#include "DateDiffCalculatorBackend.h"

int main(int argc, char *argv[])
{
    // SailfishApp::main() will display "qml/template.qml", if you need more
    // control over initializaration, you can use:
    //
    //   - SailfishApp::application(int, char *[]) to get the QGuiApplication *
    //   - SailfishApp::createView() to get a new QQuickView * instance
    //   - SailfishApp::pathTo(QString) to get a QUrl to a resource file
    //
    // To display the view, call "show()" (will show fullscreen on device).

    // return SailfishApp::main(argc, argv);

    //Some C++ code here to determine the platform and set an int platformId
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));

    QScopedPointer<QQuickView> view(SailfishApp::createView());
    QScopedPointer<DateDiffCalculatorBackend> backend(new DateDiffCalculatorBackend);

    view->rootContext()->setContextProperty("backend", backend.data());
    view->setSource(SailfishApp::pathTo("qml/main.qml"));
    view->show();

    return app->exec();
}

