pragma Singleton

import QtQuick.Controls.Material
import Qt.labs.settings

Settings {
    property int themeMode : Material.Light
    property int themeColorID: 0
    property color themeColor : "#00CED1"
}
