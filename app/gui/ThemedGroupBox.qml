import QtQuick 2.9
import QtQuick.Controls 2.2

// Drop-in restyle of GroupBox used throughout SettingsView: a rounded
// surface-colored card instead of the default Material frame outline.
// Only the background changes — title/content bindings are untouched.
GroupBox {
    background: Rectangle {
        radius: Theme.radiusCard
        color: Theme.colorSurface
        border.width: 1
        border.color: Theme.colorBorder
    }
}
