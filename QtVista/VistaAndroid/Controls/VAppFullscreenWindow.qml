import QtQuick
import QtQuick.Window
import QtQuick.Templates as T
import QtQuick.Controls.Material

T.ApplicationWindow{
    readonly property real statusBarHeight: Screen.height-Screen.desktopAvailableHeight
    id: control
    flags: Qt.MaximizeUsingFullscreenGeometryHint
    color: Material.backgroundColor
}
