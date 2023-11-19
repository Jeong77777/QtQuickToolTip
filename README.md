# QtQuick(QML) Tooltip Implementation - Version 1.0

In version 1.0 of this project, I've implemented tooltips in QtQuick that are activated based on the mouse cursor's position. This version includes two specific QML Types: `StandardToolTip` and `WindowedToolTip`.

## StandardToolTip
- **Implementation**: Utilizes QML's default ToolTip Type.
- **Behavior**: Displays tooltips only within the confines of the parent window.

![StandardToolTip Demo](https://github.com/Jeong77777/QtQuickToolTip/blob/4ad6f8b302fb65be4bbfcc386fd5452803d5ca74/DemoGIFs/StandardToolTip.gif)

## WindowedToolTip
- **Implementation**: Developed using the QML Window type.
- **Feature**: Unlike `StandardToolTip`, it allows tooltips to appear outside the parent window's area.

![WindowedToolTip Demo](https://github.com/Jeong77777/QtQuickToolTip/blob/4ad6f8b302fb65be4bbfcc386fd5452803d5ca74/DemoGIFs/WindowedToolTip.gif)
