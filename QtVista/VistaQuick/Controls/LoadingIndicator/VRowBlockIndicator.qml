import QtQuick
import QtQuick.Controls.Material

Item {
    property int modelCount: 4
    property real modelSize: 16
    property real spacing: 6
    property color color: Material.accent
    property alias frequency: timer.interval
    id: control
    implicitWidth: (modelSize+spacing )*modelCount - spacing
    implicitHeight: modelSize
    Repeater {
        id: repeater
        model: control.modelCount
        delegate: Rectangle{
            id:rect
            width: control.modelSize
            height: width
            x: index*(width+control.spacing)
            y:0
            radius: 2
            smooth: true
            color: control.color
            transformOrigin: Item.BottomRight
            SequentialAnimation {
                id: animation
                loops: Animation.Infinite
                RotationAnimation {
                    target: rect
                    duration: control.frequency*4
                    from: 0
                    to: 90
                    easing.type: Easing.InOutQuint
                }
                PauseAnimation { duration: index*2*control.frequency }
                RotationAnimation {
                    target: rect
                    duration: control.frequency*4
                    from: 90
                    to: 0
                    easing.type: Easing.InOutQuint
                }
                PauseAnimation { duration: (control.modelCount - index)*2*control.frequency }
            }
            function startAnimation() {
                if(!animation.running) {
                   animation.start()
                }
            }
        }
    }
    Timer{
        property int currentIndex: control.modelCount-1
        id:timer
        interval: 200
        repeat: true
        running: true
        onTriggered: {
            if(currentIndex === -1){
                stop()
            }else{
                repeater.itemAt(currentIndex).startAnimation()
                currentIndex--;
            }
        }
    }
}
