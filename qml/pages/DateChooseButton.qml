import QtQuick 2.0
import Sailfish.Silica 1.0

Button {
    id: root
    property string baseText: "Date"
    property date date: new Date()

    signal accepted(date acceptedDate)

    function updateText() {
        root.text = baseText + " " + Qt.formatDate(date);
    }

    DatePickerDialog {
        id: datePicker
    }

    onClicked: {
        var dialog = pageStack.push("Sailfish.Silica.DatePickerDialog", {
            date: root.date
        })
        dialog.accepted.connect(function() {
            root.accepted(dialog.date)
        })
    }

    onDateChanged: updateText()
}


