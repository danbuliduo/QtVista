import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

T.Switch {
    property color color : Material.accentColor
    property real vistaWidth: 40
    property real vistaHeight: vistaWidth/2
    property alias fontColor : contentText.color
    property alias indicatorRect: indicatorRect
    property alias roundRect: roundRect
    id: control
    padding: 0
    spacing: 8
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    font.pixelSize: height-8

    indicator: Rectangle {
        id:indicatorRect
        implicitWidth: control.vistaWidth
        implicitHeight: control.vistaHeight
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: width/2
        color: control.checked ? control.color : Material.rippleColor
        border.color: control.checked ? (control.down ?  Material.rippleColor : control.color)
                          : (control.down ? control.color :  Material.rippleColor)
        Rectangle {
            id : roundRect
            width: height
            height: indicatorRect.height
            radius: width/2
            color: "#FFFFFF"
            border.color: control.checked ? (control.down ?  Material.rippleColor: Material.hintTextColor)
                              : (control.down ? control.color :  Material.rippleColor)
           NumberAnimation on x {
                from : 0
                to: control.vistaWidth-roundRect.width
                running: control.checked ? true : false
                duration: 200
            }
            NumberAnimation on x {
                from: control.vistaWidth-roundRect.width
                to: 0
                running: control.checked ? false : true
                duration: 200
            }
        }
    }
    contentItem: Text {
        id:contentText
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0
        text: control.text
        font: control.font
        color: Material.foreground
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }
}
