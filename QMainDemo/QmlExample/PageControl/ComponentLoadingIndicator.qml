import QtQuick
import QtQuick.Controls

import VistaQuick.Controls.LoadingIndicator

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
            text: "Controls.LoadingIndicator"
        }
    }
    Item{
        anchors.fill: parent
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 16
            VAroundBlockIndicator{}
            VDoughuntIndicator{}
            VFlipBlockIndicator{}
            VPulseBlockIndicator{}
            VRowBlockIndicator{}
        }
    }

}
