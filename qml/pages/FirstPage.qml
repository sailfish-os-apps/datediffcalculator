import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingMedium
            PageHeader {
                title: "Date Difference Calculator"
            }

            DateChooseButton {
                id: startDate
                baseText: "Start date:"
                anchors.horizontalCenter: parent.horizontalCenter
                onTextChanged: {
                    console.log("Start date changed")
                    backend.setStartDate(startDate.date)
                }
            }

            Label {
                x: Theme.paddingLarge
                text: "Calculate difference to"
                color: Theme.secondaryHighlightColor
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Theme.fontSizeMedium
            }

            DateChooseButton {
                id: endDate
                baseText: "End date:"
                anchors.horizontalCenter: parent.horizontalCenter
                onTextChanged: {
                    console.log("End date changed")
                    backend.setEndDate(endDate.date)
                }
            }

            Column {
                anchors.topMargin: 50
                width: parent.width
                visible: backend.diffInDays !== ""
                anchors.horizontalCenter: parent.Center

                Label {
                    text: "The difference is:"
                    color: Theme.secondaryHighlightColor
                    font.pixelSize: Theme.fontSizeLarge
                    font.family: Theme.fontFamilyHeading
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Label {
                    text: backend.diffInDays
                    font.pixelSize: Theme.fontSizeMedium
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Label {
                    text: backend.diffInMonths
                    font.pixelSize: Theme.fontSizeSmall
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Label {
                    text: backend.diffInYears
                    font.pixelSize: Theme.fontSizeExtraSmall
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
