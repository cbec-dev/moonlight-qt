import QtQuick 2.0
import QtQuick.Controls 2.2

ItemDelegate {
    id: control

    property GridView grid

    highlighted: grid.activeFocus && grid.currentItem === this

    scale: (highlighted || hovered) ? 1.045 : 1.0
    z: (highlighted || hovered) ? 2 : 1
    transformOrigin: Item.Center

    Behavior on scale {
        NumberAnimation { duration: Theme.animNormal; easing.type: Theme.easeStandard }
    }

    background: Rectangle {
        id: cardBackground
        anchors.fill: parent
        radius: Theme.radiusCard
        color: control.highlighted || control.hovered ? Theme.colorSurfaceHover : Theme.colorSurface

        Behavior on color { ColorAnimation { duration: Theme.animFast } }
    }

    // Focus ring + halo drawn as an overlay above all delegate content
    // (not part of `background`, which Qt Quick Controls always renders
    // behind the delegate's other children via an implicit z:-1). Cards
    // with full-bleed content, like AppView's box art, would otherwise
    // paint over a border/glow living in `background`.
    Item {
        id: focusRingOverlay
        anchors.fill: parent
        z: 100

        Rectangle {
            anchors.fill: parent
            radius: Theme.radiusCard
            color: "transparent"
            border.width: control.highlighted ? Theme.focusRingWidth : 1
            border.color: control.highlighted ? Theme.colorFocusRing : Theme.colorBorder

            Behavior on border.color { ColorAnimation { duration: Theme.animFast } }
            Behavior on border.width { NumberAnimation { duration: Theme.animFast } }
        }

        // Soft halo around the focus ring, approximating the mockups' glow
        // without pulling in the Qt5Compat.GraphicalEffects module.
        Rectangle {
            anchors.fill: parent
            anchors.margins: -6
            radius: Theme.radiusCard + 6
            color: "transparent"
            border.width: 6
            border.color: Theme.colorFocusRing
            opacity: control.highlighted ? 0.22 : 0
            visible: opacity > 0

            Behavior on opacity { NumberAnimation { duration: Theme.animFast } }
        }
    }

    Keys.onLeftPressed: {
        grid.moveCurrentIndexLeft()
    }
    Keys.onRightPressed: {
        grid.moveCurrentIndexRight()
    }
    Keys.onDownPressed: {
        grid.moveCurrentIndexDown()
    }
    Keys.onUpPressed: {
        grid.moveCurrentIndexUp()

        // If we've reached the top of the grid, move focus to the toolbar
        if (grid.currentItem === this) {
            nextItemInFocusChain(false).forceActiveFocus(Qt.TabFocus)
        }
    }
    Keys.onReturnPressed: {
        clicked()
    }
    Keys.onEnterPressed: {
        clicked()
    }
}
