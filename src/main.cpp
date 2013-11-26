/**********************************************************************
 * Copyright 2013 Arto Jalkanen
 *
 * This file is part of Date Difference Calculator
 *
 * Date Difference Calculator is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Date Difference Calculator is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Date Difference Calculator.  If not, see <http://www.gnu.org/licenses/>
**/
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

