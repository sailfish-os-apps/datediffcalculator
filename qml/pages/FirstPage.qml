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
import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
            MenuItem {
                text: "Reset dates"
                onClicked: backend.reset()
            }
        }

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
                date: backend.startDate
                onAccepted: backend.startDate = acceptedDate
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
                date: backend.endDate
                onAccepted: backend.endDate = acceptedDate
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
                    text: backend.diffInWeeks
                    font.pixelSize: Theme.fontSizeSmall
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
