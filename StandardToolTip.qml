import QtQuick 2.15
import QtQuick.Controls 2.15

MouseArea {
    id: toolTipMouseArea

    property alias delay: toolTip.delay
    property alias text: toolTip.text
    property alias timeout: toolTip.timeout

    property bool toolTipVisible: false
    property int toolTipHorizontalOffset: 2
    property int toolTipVerticalOffset: 17

    anchors.fill: parent
    acceptedButtons: Qt.AllButtons
    hoverEnabled: true
    propagateComposedEvents: true

    onEntered: {
        toolTipVisible = true
    }
    onPressed: {
        toolTipVisible = false
        mouse.accepted = false
    }
    onWheel: {
        toolTipVisible = false
        wheel.accepted = false
    }
    onExited: {
        toolTipVisible = false
    }

    ToolTip {
        id: toolTip
        visible: toolTipVisible && toolTip.text
        delay: 500
        timeout: 5000
        leftMargin: 0
        rightMargin: 0
        topMargin: 0
        bottomMargin: 0
        onVisibleChanged: {
            if (visible) {
                var toolTipWindowPosition = mapToItem(mainWindow.contentItem, toolTipMouseArea.mouseX, toolTipMouseArea.mouseY)

                // Set x position
                if ((toolTipWindowPosition.x + toolTip.width + toolTipHorizontalOffset) < mainWindow.width) {
                    toolTip.x = toolTipMouseArea.mouseX + toolTipHorizontalOffset
                }
                else {
                    toolTip.x = toolTipMouseArea.mouseX - (toolTip.width + toolTipHorizontalOffset)
                }

                // Set y position
                if ((toolTipWindowPosition.y + toolTip.height + toolTipVerticalOffset) < mainWindow.height) {
                    toolTip.y = toolTipMouseArea.mouseY + toolTipVerticalOffset
                }
                else {
                    toolTip.y = toolTipMouseArea.mouseY - (toolTip.height + 5)
                }
            }
        }
    }
}
