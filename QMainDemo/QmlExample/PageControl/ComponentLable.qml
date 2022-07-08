import QtQuick
import QtQuick.Controls

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
            text: "Controls.Lable"
        }
    }

}
