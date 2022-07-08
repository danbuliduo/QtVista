pragma Singleton

import QtQuick.Controls.Material
import Qt.labs.settings

Settings {
    property int themeMode : Material.Light
    //property int themeColorID: Material.Teal
    property int themeColor : Material.Teal
}
