import QtQuick 2.15
import QtQuick.Window 2.15

MouseArea {
    id: toolTipMouseArea

    property alias delay: showTimer.interval
    property alias text: toolTipText.text
    property alias timeout: hideTimer.interval

    property bool toolTipVisible: false
    property int toolTipHorizontalOffset: 2
    property int toolTipVerticalOffset: 17

    anchors.fill: parent
    acceptedButtons: Qt.AllButtons
    hoverEnabled: true
    propagateComposedEvents: true

    onEntered: {
        if (toolTipText.text) {
            showTimer.start()
        }
    }
    onExited: {
        showTimer.stop()
        hideTimer.stop()
        toolTipWindow.visible = false
    }
    onWheel: {
        wheel.accepted = false
        showTimer.stop()
        hideTimer.stop()
        toolTipWindow.visible = false
    }
    onPressed: {
        mouse.accepted = false
        showTimer.stop()
        hideTimer.stop()
        toolTipWindow.visible = false
    }

    Timer {
        id: showTimer
        interval: 500
        onTriggered: {
            var globalPos = toolTipMouseArea.mapToGlobal(toolTipMouseArea.mouseX, toolTipMouseArea.mouseY)

            // Set x position
            if ((globalPos.x + toolTipWindow.width + toolTipHorizontalOffset) < Screen.desktopAvailableWidth) {
                toolTipWindow.x = globalPos.x + toolTipHorizontalOffset
            }
            else {
                toolTipWindow.x = globalPos.x - (toolTipWindow.width + toolTipHorizontalOffset)
            }

            // Set y position
            if ((globalPos.y + toolTipWindow.height + toolTipVerticalOffset) < Screen.desktopAvailableHeight) {
                toolTipWindow.y = globalPos.y + toolTipVerticalOffset
            }
            else {
                toolTipWindow.y = globalPos.y - (toolTipWindow.height + 5)
            }

            toolTipWindow.visible = true
            hideTimer.start()
        }
    }

    Timer {
        id: hideTimer
        interval: 5000
        onTriggered: toolTipWindow.visible = false
    }

    Window {
        id: toolTipWindow
        width: toolTipText.implicitWidth
        height: toolTipText.implicitHeight
        visible: false
        flags: Qt.ToolTip

        Rectangle {
            anchors.fill: parent
            border.color: "black"
            border.width: 0.5
            Text {
                id: toolTipText
                anchors.centerIn: parent
                topPadding: 6
                bottomPadding: 6
                leftPadding: 5
                rightPadding: 5
            }
        }
    }
}
