import QtQuick 2.0
import QtQuick.Controls 2.2

MenuItem {
    id: control

    // Ensure focus can't be given to an invisible item
    enabled: visible
    height: visible ? implicitHeight : 0
    focusPolicy: visible ? Qt.TabFocus : Qt.NoFocus

    background: Rectangle {
        anchors.fill: parent
        radius: Theme.radiusControl
        color: control.highlighted || control.activeFocus ? Theme.colorSurfaceHover : "transparent"
        border.width: control.activeFocus ? Theme.focusRingWidth : 0
        border.color: Theme.colorFocusRing

        Behavior on color { ColorAnimation { duration: Theme.animFast } }
    }

    onTriggered: {
        // We must close the context menu first or
        // it can steal focus from any dialogs that
        // onTriggered may spawn.
        menu.close()
    }

    Keys.onReturnPressed: {
        triggered()
    }

    Keys.onEnterPressed: {
        triggered()
    }

    Keys.onEscapePressed: {
        menu.close()
    }
}
