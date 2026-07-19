import QtQuick 2.9
import QtQuick.Controls 2.2

GridView {
    id: grid

    // Reference cell size, set by the subclass (PcView/AppView) instead of
    // cellWidth/cellHeight directly. cellWidth/cellHeight below are a pure
    // computed binding derived from these — never written to imperatively —
    // so there is no feedback cycle through cellWidth itself.
    property real baseCellWidth: 0
    property real baseCellHeight: 0

    // How many reference-sized cells we'd like to fit per row on very wide
    // viewports (handheld landscape, TV) before cards are allowed to grow
    // past their base size to fill leftover space. Guarded against
    // baseCellWidth being unset (0) so this never divides by zero.
    property int targetColumns: baseCellWidth > 0 ? Math.max(1, Math.floor(width / baseCellWidth)) : 1

    // Cards grow (never shrink below base size) to fill the row evenly,
    // clamped so they don't become absurdly large on ultra-wide/TV layouts.
    property real responsiveScale: (targetColumns > 0 && baseCellWidth > 0) ?
                                        Math.min(1.35, Math.max(1.0, width / (targetColumns * baseCellWidth))) : 1.0

    cellWidth: Math.round(baseCellWidth * responsiveScale)
    cellHeight: Math.round(baseCellHeight * responsiveScale)

    property int minMargin: 10
    property real availableWidth: (parent.width - 2 * minMargin)
    property int itemsPerRow: availableWidth / cellWidth
    property real horizontalMargin: itemsPerRow < count && availableWidth >= cellWidth ?
                                        (availableWidth % cellWidth) / 2 : minMargin

    function updateMargins() {
        leftMargin = horizontalMargin
        rightMargin = horizontalMargin
    }

    onHorizontalMarginChanged: {
        updateMargins()
    }

    Component.onCompleted: {
        updateMargins()
    }

    boundsBehavior: Flickable.OvershootBounds
}
