import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ToolButton {
    id: control

    property string iconSource

    activeFocusOnTab: true

    icon.source: iconSource
    // Sized from height (fixed externally via Layout.preferredHeight below),
    // NOT from background.width/control.width: this toolbar has no
    // Layout.preferredWidth, so RowLayout computes the button's width FROM its
    // implicit content size, which includes the icon. Binding icon size to
    // width would make icon size <- control width <- RowLayout <- icon
    // implicit size a real cycle, which in practice never converged (each
    // reload nudged the computed size by a hair, forever) and pegged a CPU
    // core with no window ever appearing. height has no such feedback path.
    icon.width: height
    icon.height: height

    // This determines the size of the Material highlight. We increase it
    // from the default because we use larger than normal icons for TV readability.
    Layout.preferredHeight: parent.height

    background: Rectangle {
        anchors.fill: parent

        radius: Theme.radiusControl
        color: control.down || control.hovered ? Theme.colorSurfaceHover : "transparent"
        border.width: control.activeFocus ? Theme.focusRingWidth : 0
        border.color: Theme.colorFocusRing

        Behavior on color { ColorAnimation { duration: Theme.animFast } }
        Behavior on border.width { NumberAnimation { duration: Theme.animFast } }
    }

    Keys.onReturnPressed: {
        clicked()
    }

    Keys.onEnterPressed: {
        clicked()
    }

    Keys.onRightPressed: {
        nextItemInFocusChain(true).forceActiveFocus(Qt.TabFocus)
    }

    Keys.onLeftPressed: {
        nextItemInFocusChain(false).forceActiveFocus(Qt.TabFocus)
    }
}
