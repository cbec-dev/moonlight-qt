import QtQuick 2.9
import QtQuick.Controls 2.2

// Drop-in restyle of GroupBox used throughout SettingsView: a rounded
// surface-colored card instead of the default Material frame outline,
// with an accent-colored title so all palettes render consistently.
GroupBox {
    id: control

    background: Rectangle {
        anchors.fill: parent
        radius: Theme.radiusCard
        color: Theme.colorSurface
        border.width: 1
        border.color: Theme.colorBorder
    }

    label: Label {
        x: control.leftPadding
        width: control.availableWidth
        text: control.title
        color: Theme.colorAccent
        font: control.font
        elide: Text.ElideRight
    }
}
