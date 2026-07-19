import QtQuick 2.0
import QtQuick.Controls 2.2

Menu {
    property var initiator

    background: Rectangle {
        implicitWidth: 220
        radius: Theme.radiusControl
        color: Theme.colorBackgroundElevated
        border.width: 1
        border.color: Theme.colorBorder
    }

    onOpened: {
        // If the initiating object currently has keyboard focus,
        // give focus to the first visible and enabled menu item
        if (initiator.focus) {
            for (var i = 0; i < count; i++) {
                var item = itemAt(i)
                if (item.visible && item.enabled) {
                    item.forceActiveFocus(Qt.TabFocusReason)
                    break
                }
            }
        }
    }
}
