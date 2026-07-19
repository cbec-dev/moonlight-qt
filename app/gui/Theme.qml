pragma Singleton
import QtQuick 2.9

// Central design-token singleton. Components bind to Theme.* only, never to a
// palette directly, so switching themeName is enough to re-skin the whole app.
// Mirrors mockups/base.css (structural tokens) + mockups/themes.css (palettes).
QtObject {
    id: theme

    // ---- Structural tokens (identical across all themes) ----
    readonly property int spacingXs: 4
    readonly property int spacingS: 8
    readonly property int spacingM: 16
    readonly property int spacingL: 24
    readonly property int spacingXl: 40
    readonly property int spacingXxl: 64

    readonly property int radiusCard: 16
    readonly property int radiusControl: 10
    readonly property int radiusPill: 999

    readonly property int fontSizeCaption: 13
    readonly property int fontSizeBody: 16
    readonly property int fontSizeSubtitle: 20
    readonly property int fontSizeTitle: 28
    readonly property int fontSizeDisplay: 40

    readonly property int animFast: 120
    readonly property int animNormal: 200
    readonly property int animSlow: 340
    readonly property int easeStandard: Easing.OutCubic
    readonly property int easeEmphasized: Easing.OutQuint

    readonly property int focusRingWidth: 3

    // ---- Theme selection ----
    // Backed by StreamingPreferences.uiThemeName once the preference is wired up (Phase 2+).
    property string themeName: "midnight"

    readonly property QtObject palettes: QtObject {
        readonly property QtObject midnight: QtObject {
            readonly property color background: "#14161c"
            readonly property color backgroundElevated: "#1c1f28"
            readonly property color surface: "#22262f"
            readonly property color surfaceHover: "#2a2f3a"
            readonly property color accent: "#5ec2ff"
            readonly property color accentStrong: "#7fd4ff"
            readonly property color danger: "#ff5f6d"
            readonly property color success: "#5ee6a0"
            readonly property color textPrimary: "#f2f4f8"
            readonly property color textSecondary: "#9aa2b1"
            readonly property color textTertiary: "#6b7280"
            readonly property color border: "#2e3340"
            readonly property color focusRing: "#5ec2ff"
            readonly property string fontFamily: "Inter"
            readonly property string fontFamilyAccent: "ModeSeven"
        }

        readonly property QtObject legionPurple: QtObject {
            readonly property color background: "#121018"
            readonly property color backgroundElevated: "#1a1622"
            readonly property color surface: "#221d2c"
            readonly property color surfaceHover: "#2b2438"
            readonly property color accent: "#9b6bff"
            readonly property color accentStrong: "#b48bff"
            readonly property color danger: "#ff5f7a"
            readonly property color success: "#5ee6a0"
            readonly property color textPrimary: "#f3f1f8"
            readonly property color textSecondary: "#a49bb5"
            readonly property color textTertiary: "#6e6580"
            readonly property color border: "#332b40"
            readonly property color focusRing: "#9b6bff"
            readonly property string fontFamily: "Inter"
            readonly property string fontFamilyAccent: "ModeSeven"
        }

        readonly property QtObject amberOled: QtObject {
            readonly property color background: "#000000"
            readonly property color backgroundElevated: "#0c0a08"
            readonly property color surface: "#16130f"
            readonly property color surfaceHover: "#1f1a13"
            readonly property color accent: "#ffb454"
            readonly property color accentStrong: "#ffc87a"
            readonly property color danger: "#ff6b5e"
            readonly property color success: "#a3e65e"
            readonly property color textPrimary: "#f6efe4"
            readonly property color textSecondary: "#ab9f8c"
            readonly property color textTertiary: "#6e6455"
            readonly property color border: "#2a2318"
            readonly property color focusRing: "#ffb454"
            readonly property string fontFamily: "Inter"
            readonly property string fontFamilyAccent: "ModeSeven"
        }

        readonly property QtObject steamBlue: QtObject {
            readonly property color background: "#10161c"
            readonly property color backgroundElevated: "#171f27"
            readonly property color surface: "#1e2a35"
            readonly property color surfaceHover: "#263542"
            readonly property color accent: "#66c0f4"
            readonly property color accentStrong: "#8ed2fb"
            readonly property color danger: "#ff6656"
            readonly property color success: "#5ee6a0"
            readonly property color textPrimary: "#eef4f8"
            readonly property color textSecondary: "#93a6b3"
            readonly property color textTertiary: "#5c6f7c"
            readonly property color border: "#263542"
            readonly property color focusRing: "#66c0f4"
            readonly property string fontFamily: "Segoe UI"
            readonly property string fontFamilyAccent: "ModeSeven"
        }

        readonly property QtObject highContrast: QtObject {
            readonly property color background: "#000000"
            readonly property color backgroundElevated: "#0a0a0a"
            readonly property color surface: "#141414"
            readonly property color surfaceHover: "#1e1e1e"
            readonly property color accent: "#ffe14d"
            readonly property color accentStrong: "#fff08a"
            readonly property color danger: "#ff4d4d"
            readonly property color success: "#6bff6b"
            readonly property color textPrimary: "#ffffff"
            readonly property color textSecondary: "#d6d6d6"
            readonly property color textTertiary: "#8a8a8a"
            readonly property color border: "#3a3a3a"
            readonly property color focusRing: "#ffe14d"
            readonly property string fontFamily: "Segoe UI"
            readonly property string fontFamilyAccent: "Segoe UI"
        }
    }

    readonly property QtObject currentPalette: {
        switch (themeName) {
        case "legionPurple": return palettes.legionPurple
        case "amberOled": return palettes.amberOled
        case "steamBlue": return palettes.steamBlue
        case "highContrast": return palettes.highContrast
        default: return palettes.midnight
        }
    }

    // ---- Flattened accessors — bind to these, never to currentPalette/palettes directly ----
    readonly property color colorBackground: currentPalette.background
    readonly property color colorBackgroundElevated: currentPalette.backgroundElevated
    readonly property color colorSurface: currentPalette.surface
    readonly property color colorSurfaceHover: currentPalette.surfaceHover
    readonly property color colorAccent: currentPalette.accent
    readonly property color colorAccentStrong: currentPalette.accentStrong
    readonly property color colorDanger: currentPalette.danger
    readonly property color colorSuccess: currentPalette.success
    readonly property color colorTextPrimary: currentPalette.textPrimary
    readonly property color colorTextSecondary: currentPalette.textSecondary
    readonly property color colorTextTertiary: currentPalette.textTertiary
    readonly property color colorBorder: currentPalette.border
    readonly property color colorFocusRing: currentPalette.focusRing
    readonly property string fontFamily: currentPalette.fontFamily
    readonly property string fontFamilyAccent: currentPalette.fontFamilyAccent
}
