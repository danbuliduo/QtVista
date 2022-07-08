import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Page{
    property color lineColor: Material.theme===Material.Light ? "#DDDDDD" : "#606060"
    id: page
    visible: true
    width: application.width
    height: application.height
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
            text: "About QtVista"
        }
    }
    Flickable {
        anchors.fill: parent
        contentWidth: width
        contentHeight: Math.max(height,logoImage.height*3)
        boundsMovement: Flickable.StopAtBounds
        boundsBehavior:  Flickable.StopAtBounds
        Item{
            anchors.fill: parent
            Column{
                anchors.top: parent.top
                anchors.topMargin:  page.width > page.height ? 8 : 48
                Image{
                    id: logoImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/res/icons/logo-vista.svg"
                    width:  Math.min(page.height/2 , page.width/2)
                    height: width
                }
                Column{
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 16
                    Text{
                        font.pixelSize: 36
                        font.family: "Agency FB"
                        text: "Q T V I S T A"
                        anchors.horizontalCenter: parent.horizontalCenter
                         LinearGradient{
                             anchors.fill: parent
                             source: parent
                             start: Qt.point(0, 0)
                             end: Qt.point(0, parent.implicitHeight)
                             gradient: Gradient{
                                 GradientStop { position: 0.0; color: "#00CED1"}
                                 GradientStop { position: 1.0; color: "#4CB3ED"}
                             }
                         }
                    }
                    Text{
                        color: "#8A8A8A"
                        font.pixelSize: 14
                        text: "Version: "+Application.version
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Item{ width: 1; height: 64 }
                }
                Column{
                   Rectangle{
                       width: page.width
                       height: 1
                       color: page.lineColor
                   }
                   ItemDelegate{
                       width: page.width
                       height: 48
                       text: "Qt"
                       icon.source: "qrc:/res/icons/logo-qt.svg"
                       icon.height: 18
                       icon.color: "transparent"
                       onClicked: Qt.openUrlExternally("https://www.qt.io")
                   }
                   Rectangle{
                       width: page.width
                       height: 1
                       color: page.lineColor
                   }
                   ItemDelegate{
                       width: page.width
                       height: 48
                       text: "QtVista"
                       icon.source: "qrc:/res/icons/logo-vista.svg"
                       icon.color: "transparent"
                   }
                   Rectangle{
                       width: page.width
                       height: 1
                       color: page.lineColor
                   }
                   ItemDelegate{
                        width: page.width
                        height: 48
                        text: "GitHub"
                        icon.source: "qrc:/res/icons/logo-github.svg"
                        icon.color: "transparent"
                        onClicked: Qt.openUrlExternally("https://github.com/DMing-CN/QtVista")
                   }
                   Rectangle{
                        width: page.width
                        height: 1
                        color: page.lineColor
                   }
                   ItemDelegate{
                        width: page.width
                        height: 48
                        text: "HBMZ | 湖北民族大学"
                        icon.source: "qrc:/res/pngs/logob.png"
                        icon.color: "transparent"
                        onClicked: Qt.openUrlExternally("https://hbmzu.edu.cn")
                   }
                   Rectangle{
                        width: page.width
                        height: 1
                        color: page.lineColor
                   }
                }
            }
        }
        ScrollIndicator.vertical: ScrollIndicator { }
    }

    footer: Pane{
        Material.background: page.Material.dialogColor
        Material.elevation: 8
        height: 32
        Text{
            anchors.centerIn: parent
            color: "#A0A0A0"
            text: Qt.formatDateTime(new Date(), "© yyyy ")+Application.organization+" D.Ming All Right Reserved."
        }
    }
}
