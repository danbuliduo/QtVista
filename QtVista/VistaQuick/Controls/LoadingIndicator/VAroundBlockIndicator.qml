import QtQuick
import QtQuick.Controls.Material

Item {
    property real radius: 16
    property real innerRadius: radius*0.72
    property int modelCount: 8
    property color color: Material.accentColor
    property alias frequency: timer.interval
    id:control
    implicitWidth: radius*2
    implicitHeight: radius*2
    Repeater{
        id:repeater
        model: control.modelCount
        delegate: Rectangle{
            property int _rotation: (360 / control.modelCount) * index
            width: control.width - control.innerRadius*2
            height: width/2
            x: control.width/2+control.innerRadius*Math.cos(((_rotation *Math.PI) / 180.0))
            y: control.height/2-control.innerRadius*Math.sin(((_rotation *Math.PI) / 180.0))
            radius: 0
            color: control.color
            opacity: ( index >= timer._currentIndex - 1 && index <= timer._currentIndex+1) ? 1 : 0.33
            transform: Rotation {
                angle:  360 - _rotation
                origin { x: 0; y: height / 2 }
            }

           Behavior on opacity { NumberAnimation { duration: control.frequency * 1.5 } }
        }
    }
    Timer{
         property int _currentIndex: control.modelCount
         id:timer
         interval: 100
         repeat: true
         running: control.visible
         onTriggered: {
             if (_currentIndex === 0) {
                 _currentIndex = control.modelCount
             }else {
                 _currentIndex--
             }
         }
    }
}

