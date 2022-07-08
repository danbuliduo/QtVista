import QtQuick
import QtQuick.Controls
Page{
    ListView{
        id:listView
        anchors.fill: parent
        spacing: 1
        boundsBehavior: Flickable.StopAtBounds
        header: Item{
            width: listView.width
            height: 100
            Row{
                anchors.top: parent.top
                anchors.centerIn: parent
                spacing: parent.width*0.05
                height: 100
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    sourceSize: Qt.size(64, 64)
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/res/icons/logo-qt.svg"
                }
                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 12
                    Text{
                        font.pixelSize: 14
                        font.bold: true
                        text: "THE FUTURE IS WRITTEN WITH Qt"
                        color: "#41CD52"
                    }
                    Text{
                        text:"Next-Generation User Experience."
                        font.bold: true
                        font.italic: true
                        wrapMode: Text.WrapAnywhere
                        color: "#AAAAAA"
                    }
                }
            }
        }
        delegate: ItemDelegate{
            width: listView.width
            height: 64
            text: title
            icon.source: iconUrl
            icon.color: Material.accentColor
            icon.width: 36
            icon.height: 36
            Rectangle{
                y: -1
                width: parent.width
                height: 1
                color: Material.theme ===  Material.Light ? "#DDDDDD" : "#808080"
            }
            Image{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: parent.rightPadding
                source: "qrc:/res/icons/icon-forward_arrows.svg"
                sourceSize: Qt.size(20, 20)
            }
            onClicked: {
            }
        }
    }
}

