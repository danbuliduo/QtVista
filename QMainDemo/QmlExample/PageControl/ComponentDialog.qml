import QtQuick
import QtQuick.Controls

import VistaQuick.Controls.Dialog
import Qt.labs.platform

Page{
    header: ToolBar{
        contentHeight: menuBtn.implicitHeight
        Material.primary: Material.accent
        ToolButton{
            id:menuBtn
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/res/icons/icon-back_arrows.svg"
            icon.color: "#FFFFFF"
            onClicked:{
                header.visible = false
                application.stackViewPOP()
            }
        }
        Text{
           anchors.centerIn: parent
            color: "#FFFFFF"
            font.pixelSize: 18
            font.bold: true
            text: "Controls.Dialog"
        }
    }
    Row{
    Button{
        onClicked: colorDialog.open()
    }
    Button{
        onClicked: m.open()
    }
    Button{
        onClicked:f.open()
    }
    }

    VColorDialog{
        id:colorDialog
        onAccepted: {
            console.log(currentColor)
        }
    }
    VFontDialog{
        id:f
    }


    VMessageDialog{
        id:m
    }

}
