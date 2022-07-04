import QtQuick
import QtQuick.Controls
import VistaQuick.Controls

Dialog{
    property font currentFont
    id:control
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    width: 320
    height: 280
    title: "FontDialog"
    modal: true
    leftPadding: 12
    rightPadding: 12
    topPadding: 4
    bottomPadding: 0
    closePolicy: Popup.NoAutoClose
    standardButtons: Dialog.Ok | Dialog.Cancel
    background: Rectangle {
        id:backgroundRect
        color: Material.dialogColor
        radius: 4
    }
    header: Item{
        height: 48
        Text{
            text: control.title
            color: Material.foreground
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 24
            font.bold: true
            font.pixelSize: 16
        }
        ToolButton{
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/VistaQuick/Controls/Dialog/res/close.svg"
            icon.color: "#808080"
            onClicked: {
                control.close()
            }
        }
        Rectangle{
            width: parent.width
            height: 1
            color: "#CCCCCC"
            anchors.bottom: parent.bottom
        }
    }
    contentItem: Item{
        ListView{
            id: fontListView
            height: parent.height
            width: parent.width*0.6
            model: Qt.fontFamilies()
            clip: true
            delegate: RadioDelegate {
                padding: 2
                height: 42
                width: fontListView.width
                font.family: modelData
                font.pixelSize: 12
                text: (index+1) + ". " + modelData
                onClicked:  {
                    control.currentFont.family=font.family
                    control.currentFont.pixelSize=14
                }
            }

        }
        Item{
            height: parent.height
            width: parent.width*0.4-control.rightPadding
            anchors.right: parent.right
            Text{
                id: text
                text: "AaBb"
                color: Material.foreground
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 16
                font: control.currentFont
            }
            SpinBox{
                id : spinbox
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: text.bottom
                anchors.bottomMargin: -16
                width: 100
            }
            Flickable{
                clip: true
                anchors.bottom: parent.bottom
                anchors.top: spinbox.bottom
                width: parent.width
                contentWidth: width
                contentHeight: Math.max(height, 32*4)
                Column{
                   x:16
                   spacing: 16
                   anchors.bottom: parent.bottom
                   anchors.bottomMargin: 4
                   VCheckBox{
                       text: "粗体"
                       onClicked: {
                           control.currentFont.bold = checkState !== Qt.Unchecked? true : false
                       }
                   }
                   VCheckBox{
                       text: "斜体"
                       onClicked: {
                           control.currentFont.italic = checkState !== Qt.Unchecked ? true : false
                       }
                   }
                   VCheckBox{
                       text: "下划线"
                       onClicked: {
                           control.currentFont.underline  = checkState !== Qt.Unchecked ? true : false
                       }
                   }
                   VCheckBox{
                       text: "删除线"
                       onClicked: {
                           control.currentFont.strikeout  = checkState !== Qt.Unchecked ? true : false
                       }
                   }
               }
            }
            Rectangle{
                anchors.left: parent.left
                height: parent.height
                width: 1
                color: "#DDDDDD"
            }
        }
    }
}
