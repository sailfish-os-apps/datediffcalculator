import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingMedium
            PageHeader {
                title: "About"
            }

            Label {
                x: Theme.paddingLarge
                text: "Date Difference Calculator"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeLarge
                font.family: Theme.fontFamilyHeading
            }

            Label {
                x: Theme.paddingLarge
                text: "By Arto Jalkanen"
            }

            Label {
                x: Theme.paddingLarge
                text: "Licensed under GPLv3"
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                x: Theme.paddingLarge
                text: '<a href="https://github.com/ajalkane/datediffcalculator">Sources available from GitHub</a>'
                font.pixelSize: Theme.fontSizeExtraSmall
            }
        }
    }
}
