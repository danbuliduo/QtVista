import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

T.Slider {
    property real radius: 0
    property alias handleRect: handleRect
    property alias handleRipple: handleRipple
    property alias backgroundRect: backgroundRect
    property alias backchildrenRect: backchildrenRect

    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitHandleWidth + leftPadding + rightPadding)
    implicitHeight : Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitHandleHeight + topPadding + bottomPadding)
    width: 200
    height: 4
    padding: 0

    handle: Rectangle {
        id: handleRect
        x: control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))
        width: control.horizontal ? control.height*3 : control.width*3
        height: control.horizontal ? control.height*3 : control.width*3
        radius: width/2
        scale: control.pressed ? 1.5 : 1
        color: Material.accentColor
        Behavior on scale {
            NumberAnimation {
                duration: 250
            }
        }
        Ripple{
            id: handleRipple
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width+4
            height: parent.height+4
            pressed: control.pressed
            active: control.pressed || control.visualFocus || control.hovered
            color: Color.transparent(Material.accentColor, 0.12)
        }
    }

    background: Rectangle {
        id: backgroundRect
        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
        width: control.availableWidth
        height: control.availableHeight
        scale: control.horizontal && control.mirrored ? -1 : 1
        color: Color.transparent(Material.accentColor, 0.33)
        radius: control.radius
        Rectangle {
            id: backchildrenRect
            x: control.horizontal ? 0 : (parent.width - width) / 2
            y: control.horizontal ? (parent.height - height) / 2 : control.visualPosition * parent.height
            width: control.horizontal ? control.position * parent.width : parent.width
            height: control.horizontal ? parent.height : control.position * parent.height
            color: Material.accentColor
            radius: control.radius
        }
    }
}
