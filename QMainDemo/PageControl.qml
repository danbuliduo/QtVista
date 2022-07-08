import QtQuick
import QtQuick.Controls

import VistaQuick.Controls
import VistaQuick.Controls.Dialog
import VistaQuick.Controls.LoadingIndicator

import "qrc:/QmlExample/PageControl/"

Page{
    ListModel{
        id: listModel
        ListElement{title: "Controls.Button"; iconUrl: "qrc:/res/icons/icon-btn.svg"}
        ListElement{title: "Controls.Dialog"; iconUrl: "qrc:/res/icons/icon-dialog.svg"}
        ListElement{title: "Controls.Lable"; iconUrl: "qrc:/res/icons/icon-lable.svg"}
        ListElement{title: "Controls.LoadingIndicator"; iconUrl: "qrc:/res/icons/icon-loading.svg"}
        ListElement{title: "Controls.Popup"; iconUrl: "qrc:/res/icons/icon-popup.svg"}
        ListElement{title: "Controls.Button"; iconUrl: "qrc:/res/icons/icon-loading.svg"}
        ListElement{title: "Controls.Button"; iconUrl: "qrc:/res/icons/icon-loading.svg"}
        ListElement{title: "Controls.Button"; iconUrl: "qrc:/res/icons/icon-loading.svg"}
        ListElement{title: "Controls.Button"; iconUrl: "qrc:/res/icons/icon-loading.svg"}
        ListElement{title: "Controls.Button"; iconUrl: "qrc:/res/icons/icon-loading.svg"}
        ListElement{title: "Controls.Button"; iconUrl: "qrc:/res/icons/icon-loading.svg"}
        ListElement{title: "Controls.Button"; iconUrl: "qrc:/res/icons/icon-loading.svg"}
    }
    ListView{
        id:listView
        anchors.fill: parent
        model: listModel
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
                        text:"One framework. One codebase. Any platform."
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
                  switch(index){
                  case 0: application.stackViewPUSH(component_button) ; break
                  case 1: application.stackViewPUSH(component_dialog) ; break
                  case 2: application.stackViewPUSH(component_lable) ; break
                  case 3: application.stackViewPUSH(component_loadingIndicator) ; break
                  case 4: application.stackViewPUSH(component_popup) ; break
                  }
            }
        }
    }
    Component{
        id: component_button
        ComponentButton{}
    }
    Component{
        id: component_dialog
        ComponentDialog{}
    }
    Component{
        id: component_lable
        ComponentLable{}
    }
    Component{
        id: component_loadingIndicator
        ComponentLoadingIndicator{}
    }
    Component{
        id: component_popup
        ComponentPopup{}
    }
}
/*    Flow{
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8
        VDoughuntIndicator {}
        VAroundBlockIndicator{}
        VFlipBlockIndicator{}
        VPulseBlockIndicator{}
        VRowBlockIndicator{}
        BusyIndicator{}

    VTabButton{
        icon.source: "qrc:/res/icons/gitlab.svg"
        text : "ety地方"
        display: AbstractButton.TextUnderIcon
        spacing: 2
        onClicked: AndroidServiceManager.startVibratorService()
    }
    TabButton{
        icon.source: "qrc:/res/icons/gitlab_64px.png"
        text: "31f"
    }
    IconLabel{
        icon.width: 24
        icon.height: 24
        icon.source: "qrc:/res/icons/gitlab_64px.png"
        text: "###qw"

    }

    VTabBar{
            orientation : ListView.Vertical
            Material.accent:  "grey"
            Repeater {
                model : listmodel
                VTabButton{
                    width: 64
                   icon.source: iconurl
                   display: AbstractButton.TextUnderIcon
                   text: titletext
               }
            }
        }
        GroupBox{}
        MenuBar{
            Menu {
                    title: "File"
                    MenuItem { text: "Open..." }
                    MenuItem { text: "Close" }
                }
                Menu {
                    title: "Edit"
                    MenuItem { text: "Cut" }
                    MenuItem { text: "Copy" }
                    MenuItem { text: "Paste" }
                }
        }
        VProgressBar{
            id:vpb
            height: 4
            width: 200
            Timer{
                property int ok: 1
                running: true
                repeat: true
                interval: 20
                onTriggered: {
                    vpb.value+=0.01*ok
                    if(vpb.value >=1.0 || vpb.value <=0.0){
                        ok=-ok
                    }
                }
            }
        }
        VSlider{
            orientation: Qt.Vertical
            height: 100
            width: 4
            Material.accent: "grey"
            //horizontal: false
            //vertical: true
            radius: 4
            onPositionChanged: {
                console.log(position)
            }
        }
        VSlider{
            height: 8
            radius: 8
            implicitWidth : 100
            implicitHeight: 4

        }
        VCheckBox{
        text: "$#%#"
        }
        VCheckBox{
        text: "$#%#"
        }
        Switch{}
        VSwitch{
            text: "ERW"
        }

        Text{
            Component.onCompleted: {
                var reg = /(ftp:\/\/|http:\/\/|https:\/\/)((\w|=|\?|\.|\/|&|-)+)/g
                 //text = text.replace("/[\\r][\\n]/g","<br/>")
                 text = text.replace(reg, "<a href='$1$2'>$1$2</a>")
                console.log(text)

            }
            linkColor: "#336699"
            text: "rgthttps://www.baidu.com/s?tn=80035161_2_dg&wd=c%23%E6%AD%A3%E5%88%99"
            onLinkActivated : function(link){ Qt.openUrlExternally(link) }
        }
    }*/
