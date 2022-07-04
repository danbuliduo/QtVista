import QtQuick
import QtQuick.Controls.Material
import Qt5Compat.GraphicalEffects

Item {
       property color color: Material.accentColor
       property alias frequency: animation.duration
       id: control
       implicitWidth: 40
       implicitHeight: 40
        Rectangle {
            id: rect
            width: parent.width
            height: parent.height
            color: "transparent"
            radius: width / 2
            border.width: width *0.15
            visible: false
        }
        ConicalGradient {
            width: rect.width
            height: rect.height
            source: rect
            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba(control.color.r,control.color.g,control.color.b,0.33) }
                GradientStop { position: 1.0; color: control.color }
            }
            Rectangle {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                width: rect.border.width
                height: width
                radius: width / 2
                color: control.color
            }
            RotationAnimation on rotation {
                id:animation
                loops: Animation.Infinite
                running: control.visible
                from: 0
                to: 360
                duration: 1000
            }
        }
    }
