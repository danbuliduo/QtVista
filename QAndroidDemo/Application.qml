import QtQuick
import QtQuick.Controls
import VistaAndroid.Cores
import VistaAndroid.Controls

VAppFullscreenWindow {
    id: appRoot
    visible: true
    header: ToolBar{
         visible : true
         Material.primary: Material.accentColor
         contentHeight: 68
         Item{
             height: 40
             width: parent.width
             anchors.bottom: parent.bottom
             ToolButton{
                 id: menuBtn
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
                 text: "QtVistaAndroid "
             }
         }
     }


    Drawer{
        id: drawer
        width: appRoot.width > appRoot.height ? parent.width *0.4 : parent.width*0.7
        height: parent.height
    }

   AndroidNotification{
       id:f1
       channelName: "QtVistaAndroid1"
       smallIconR: "icon"
       largeIconR: "icon"
       contentTitle: "TEST1"
       contentText: "Test"
       setwhen: true
   }
   AndroidNotification{
       id:f2
       channelName: "QtVistaAndroid2"
       smallIconR: "icon"
       largeIconR: "icon"
       contentTitle: "TEST2"
       contentText: "Test"
       setwhen: true
   }
Row{
    Button{
       onClicked: AndroidSystemService.setVibratorService()
    }
    Button{
       onClicked: {
           f1.startNotify()
       }
    }
    Button{
       onClicked: {
           f1.deleteChannel()
       }
    }
    Button{
       onClicked: {
           f2.startNotify()
       }
    }
    Button{
       onClicked: {
           f2.deleteChannel()
       }
    }
    Rectangle{
        width: 28
        height: 28

    }
}
}
