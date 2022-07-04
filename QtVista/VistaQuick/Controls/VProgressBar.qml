import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

T.ProgressBar {
    property real vistaWidth: 200
    property real vistaHeight: 4
    property real radius: 0
    property alias contentRect : contentRect
    property alias backgroundRect : backgroundRect
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                              implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    padding: 0
    value : 0.0

    contentItem: Rectangle {
        id: contentRect
        implicitWidth: parent.vistaWidth
        implicitHeight: parent.vistaHeight
        radius: control.radius
        color: Qt.rgba(Material.accentColor.r, Material.accentColor.g, Material.accentColor.b, 0.25)
    }
    background: Rectangle {
        id: backgroundRect
        width: control.value*control.width
        height: control.height
        radius:control.radius
        color: Material.accentColor
    }
}
