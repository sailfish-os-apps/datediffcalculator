# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-datediffcalculator

CONFIG += sailfishapp

SOURCES += src/main.cpp \
           src/DateDiffCalculatorBackend.cpp \
           src/qtimespan.cpp \


HEADERS += src/DateDiffCalculatorBackend.h \
           src/qtimespan.h

OTHER_FILES += \
    qml/pages/FirstPage.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-datediffcalculator.spec \
    rpm/harbour-datediffcalculator.yaml \
    harbour-datediffcalculator.desktop \
    qml/main.qml

