# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-datediffcalculator

#CONFIG += sailfishapp

# Start of temporary fix for the icon for the Nov 2013 harbour requirements
# QML files and folders
QT += quick qml
CONFIG += link_pkgconfig
PKGCONFIG += sailfishapp
INCLUDEPATH += /usr/include/sailfishapp

TARGETPATH = /usr/bin
target.path = $$TARGETPATH

DEPLOYMENT_PATH = /usr/share/$$TARGET
qml.files = qml
qml.path = $$DEPLOYMENT_PATH

desktop.files = harbour-datediffcalculator.desktop
desktop.path = /usr/share/applications

icon.files = harbour-datediffcalculator.png
icon.path = /usr/share/icons/hicolor/86x86/apps

INSTALLS += target icon desktop qml
# End of nov 2013 fix

SOURCES += src/main.cpp \
           src/DateDiffCalculatorBackend.cpp \
           src/qtimespan.cpp \


HEADERS += src/DateDiffCalculatorBackend.h \
           src/qtimespan.h

OTHER_FILES += \
    qml/pages/FirstPage.qml \
    rpm/harbour-datediffcalculator.spec \
    rpm/harbour-datediffcalculator.yaml \
    harbour-datediffcalculator.desktop \
    qml/main.qml

