import QtQuick
import QtQuick.Controls

Dialog{
    property alias text: messageText.text
    id:control
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    width: 320
    height: standardButtons === Dialog.NoButton
            ? messageText.implicitHeight+80 :  messageText.implicitHeight+72+footer.implicitHeight
    title: "MessageDialog"
    modal: true
    leftPadding: 12
    rightPadding: 12
    closePolicy: Popup.NoAutoClose
    standardButtons: Dialog.NoButton
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
        Text {
            id:messageText
            anchors.fill: parent
            anchors.centerIn: parent
            color: Material.theme === Material.Light ? "#808080" : "#DDDDDD"
            text: "Message: Hello World!"
            font: control.font
            wrapMode: Text.WrapAnywhere
            verticalAlignment: Text.AlignVCenter
        }
    }
}
