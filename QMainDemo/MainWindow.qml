import QtQuick
import QtQuick.Controls

import VistaQuick.Controls

import "qrc:/AppSettings/"

ApplicationWindow {
    id: application
    visible: true
    title: "QtVista"
    minimumWidth: 512
    minimumHeight: 320
    Material.theme: ApplicationINI.themeMode
    Material.accent: Material.color(ApplicationINI.themeColor)
    width: Qt.platform.os === "android" || Qt.platform.os === "ios" ?
           Screen.desktopAvailableWidth : Screen.desktopAvailableWidth*0.5
    height: Qt.platform.os === "android" || Qt.platform.os === "ios" ?
           Screen.desktopAvailableHeight : Screen.desktopAvailableHeight*0.6

    FontLoader{ source: "qrc:/res/fonts/AgencyFB.ttf" }

    ListModel{
        id:listmodel
        ListElement{ iconurl :"qrc:/res/icons/icon-component.svg" ; titletext : "Controls"}
        ListElement{ iconurl :"qrc:/res/icons/icon-modelview.svg" ; titletext : "Views"}
        ListElement{ iconurl :"qrc:/res/icons/icon-magiceffect.svg" ;titletext : "Effects"}
        ListElement{ iconurl :"qrc:/res/icons/icon-modelcube.svg" ; titletext : "VistaCube"}
    }

    header: ToolBar{
        contentHeight: menuBtn.implicitHeight
        Material.primary: Material.accent
        ToolButton{
            id:menuBtn
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/res/icons/icon-menu_horizontal.svg"
            icon.color: "#FFFFFF"
            icon.height: 28
            icon.width: 28
            onClicked: drawer.open()
        }
        Text{
           anchors.centerIn: parent
            color: "#FFFFFF"
            font.pixelSize: 18
            font.bold: true
            text: "QtVista For "+listmodel.get(tabBar.currentIndex).titletext
        }
        ToolButton{
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/res/icons/icon-about.svg"
            icon.color: "#FFFFFF"
            icon.height: 26
            icon.width: 26
            onClicked: {
                application.stackViewPUSH(component_pageabout)
            }
        }
    }

    footer: VTabBar{
        id:tabBar
        contentHeight: 50
        Material.elevation: 2
        Repeater {
            model : listmodel
            VTabButton{
               icon.source: iconurl
               display: AbstractButton.TextUnderIcon
               text: titletext
               fontColor: down || checked ? Material.accentColor : "#8A8A8A"
           }
        }
    }

    StackView{
        id: stackView
        anchors.fill: parent
        Component{
            id:component_default
            SwipeView{
                currentIndex: tabBar.currentIndex
                interactive: false
                PageControl{}
                PageView{}
                PageEffect{}
                PageVistaCube{}
            }
        }
        Component{
            id:component_pageabout
            PageAbout{}
        }
    }

    Drawer{
        id: drawer
        height: application.height
        width: application.width >height ? Math.min(application.width*0.3, 320)
                                                            : Math.min(application.width*0.7, 320)
        Pane{
            id: pane
            width: drawer.width
            height: drawer.width*0.4
            Material.elevation: 2
            padding: 0
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                height: pane.height*0.5
                spacing: 16
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    source: {
                        switch (Qt.platform.os){
                        case "android" : return "qrc:/res/icons/os-android.svg"
                        case "windows" : return "qrc:/res/icons/os-windows.svg"
                        case "wasm" : return "qrc:/res/icons/os-webassembly .svg"
                        }
                    }
                    sourceSize: Qt.size(pane.height*0.3,pane.height*0.3)
                }
                Text{
                     anchors.verticalCenter: parent.verticalCenter
                     text: "PlatformOS: "+(Qt.platform.os)
                     font.pixelSize: 10+pane.height*0.1
                     font.bold: true
                     font.family: "Agency FB"
                     color: "#8A8A8A"
                }
            }
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: pane.height*0.15
                source: "qrc:/res/pngs/buildWithQt.png"
                smooth: true
                fillMode: Image.PreserveAspectFit
                height: pane.height*0.3
            }
        }
        Item{
            width: parent.width
            height: drawer.height-pane.height
            anchors.bottom: parent.bottom
            Column{
                anchors.top: parent.top
                anchors.topMargin: 16
                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 40
                    spacing: 16
                    Image{
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/res/icons/img-sun.svg"
                        sourceSize: Qt.size(24,24)
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "主 题 模 式"
                        font.bold: true
                        font.pixelSize: 14
                        color: "#A0A0A0"
                    }
                }
                RadioDelegate{
                    text: "浅色模式"
                    width: drawer.width
                    checked: ApplicationINI.themeMode === Material.Light
                    onClicked: ApplicationINI.themeMode = Material.Light
                }
                RadioDelegate{
                     text: "深色模式"
                     width: drawer.width
                     checked: ApplicationINI.themeMode === Material.Dark
                     onClicked: ApplicationINI.themeMode = Material.Dark
                }
                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 40
                    spacing: 16
                    Image{
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/res/icons/img-colors.svg"
                        sourceSize: Qt.size(24,24)
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "主 题 色 彩"
                        font.bold: true
                        font.pixelSize: 14
                        color: "#A0A0A0"
                    }
                }
                ComboBox {
                     id: themeColorComboBox
                     Material.foreground: Material.accentColor
                     anchors.horizontalCenter: parent.horizontalCenter
                     currentIndex: ApplicationINI.themeColor
                     width: pane.width*0.8
                     font.bold: true
                     model: ListModel {
                         ListElement { name: "Material-Red" }
                         ListElement { name: "Material-Pink" }
                         ListElement { name: "Material-Purple" }
                         ListElement { name: "Material-DeepPurple" }
                         ListElement { name: "Material-Indigo" }
                         ListElement { name: "Material-Blue" }
                         ListElement { name: "Material-LightBlue" }
                         ListElement { name: "Material-Cyan" }
                         ListElement { name: "Material-Teal" }
                         ListElement { name: "Material-Green" }
                         ListElement { name: "Material-LightGreen" }
                         ListElement { name: "Material-Lime" }
                         ListElement { name: "Material-Yellow" }
                         ListElement { name: "Material-Amber" }
                         ListElement { name: "Material-Orange" }
                         ListElement { name: "Material-DeepOrange" }
                         ListElement { name: "Material-Brown" }
                         ListElement { name: "Material-Grey" }
                         ListElement { name: "Material-BlueGrey" }
                     }
                     delegate: ItemDelegate {
                         id: colorDelegate
                         Material.foreground: "#FFFFFF"
                         text: modelData
                         width: themeColorComboBox.width
                         Rectangle {
                             z: -1
                             anchors.fill: parent
                             color:  Material.color(index)
                         }
                         onClicked: {
                             ApplicationINI.themeColor = index //Material.color(index)
                             //ApplicationINI.themeColorID = index
                         }
                     }
                }
            }
        }
    }
    Component.onCompleted: {
         stackView.push(component_default)
    }
    function stackViewPOP(){
        stackView.pop()
        footer.visible = true
        header.visible =true
    }
    function stackViewPUSH(Component){
        footer.visible = false
        header.visible = false
        stackView.push(Component)
    }
}
