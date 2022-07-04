import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

T.TabBar {
    property alias orientation: contentItem.orientation
    property alias backgroundRect : backgroundRect
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)
    width: if(contentItem.orientation === ListView.Vertical)
        return (implicitWidth + spacing) / contentItem.count - spacing
    height: if(contentItem.orientation === ListView.Vertical)
        return (implicitHeight+spacing) *contentItem.count - spacing
    padding: 0
    spacing: 1

    contentItem: ListView {
        id: contentItem
        model: control.contentModel
        currentIndex: control.currentIndex

        spacing: control.spacing
        orientation: ListView.Horizontal

        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded
        snapMode: ListView.SnapToItem

        highlightMoveDuration: 250
        highlightResizeDuration: 0
        highlightFollowsCurrentItem: true
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 48
        preferredHighlightEnd: width - 48

        highlight: Item {
            z: 2
            Rectangle {
                height: control.orientation === ListView.Horizontal ? 2 : parent.height
                width: control.orientation === ListView.Horizontal ?parent.width : 2
                y: control.position === T.TabBar.Footer ? 0 : parent.height - height
                color: Material.accentColor
            }
        }
    }
    background: Rectangle {
        id: backgroundRect
        color: Material.dialogColor
        layer.enabled: control.Material.elevation > 0
        layer.effect: ElevationEffect {
            elevation: control.Material.elevation
            fullWidth: true
        }
    }
}
