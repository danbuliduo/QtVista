import QtQuick
import QtQuick.Controls.Material

Item {
    property int modelCount : 4
    property real spacing: 5
    property color color:Material.accent
    property alias frequency: timer.interval
    id: control
    implicitWidth: 48
    implicitHeight: 36
    Repeater {
        id: repeater
        model: control.modelCount
        delegate: Rectangle {
            width: (control.width - control.spacing*(control.modelCount-1)) / control.modelCount
            height: control.height
            x: index * width + control.spacing * index
            y: 0
            color: control.color
            transform: Scale {
                id: rectScale
                origin {
                    x: width / 2
                    y: height / 2
                }
            }
            SequentialAnimation {
                id: animation
                loops: Animation.Infinite
                NumberAnimation { target: rectScale; property: "yScale"; from: 1; to: 1.5; duration: 320 }
                NumberAnimation { target: rectScale; property: "yScale"; from: 1.5; to: 1; duration: 320 }
                PauseAnimation { duration: control.modelCount * 150 }
            }
            function startAnimation() {
                if (!animation.running) {
                    animation.start()
                }
            }
        }
    }
    Timer {
        property int _modelIndex: 0
        id: timer
        interval: 100
        repeat: true
        running: control.visible
        onTriggered: {
            if(_modelIndex === control.modelCount) {
                stop()
            }else{
                repeater.itemAt(_modelIndex).startAnimation()
                _modelIndex++
            }
        }
    }
}
