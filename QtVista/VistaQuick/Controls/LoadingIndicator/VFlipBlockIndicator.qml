import QtQuick
import QtQuick.Controls.Material

Rectangle {
    property bool trans: false
    property real rotation : 0
    property alias frequency: animation.duration
    id: control
    implicitWidth: 36
    implicitHeight: 36
    antialiasing: true
    color: Material.accent
    transform: Rotation {
        angle: control.visible ? control.rotation : 0
        axis{
            x: control.trans ? 0 : 1
            y: control.trans ? 1 : 0
            z: 0
        }
        origin{x: control.width / 2; y: control.height / 2}
    }
    NumberAnimation {
        id:animation
        running: control.visible
        target: control
        property: "rotation"
        from: trans ? 0 : 180
        to: trans ? 180 : 0
        duration: 600
        onStopped: {
             trans =! trans
            if(control.visible){
                animation.start()
            }
        }
    }
}
