import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: mainWindow

    width: 640
    height: 480
    visible: true
    title: qsTr("ToolTip")

    Button {
        id: btnA
        hoverEnabled: true
        anchors {
            top: parent.top
            left: parent.left
        }
        text: "Button A"
        StandardToolTip {
            text: btnA.text
        }
    }

    Button {
        id: btnB
        anchors {
            top: parent.top
            right: parent.right
        }
        text: "Button B"
        StandardToolTip {
            text: btnB.text
        }
    }

    Button {
        id: btnC
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        text: "Button C"
        StandardToolTip {
            text: btnC.text
        }
    }

    Button {
        id: btnD
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
        text: "Button D"
        StandardToolTip {
            text: btnD.text
        }
    }
}
