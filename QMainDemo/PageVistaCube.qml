import QtQuick
import QtQuick.Dialogs
import QtQuick.Controls

import VistaQuick.Controls.Dialog

import Qt.labs.platform
Page{
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

