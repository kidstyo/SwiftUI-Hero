/*
//  📝Version: 1⃣️
*/

import SwiftUI

let THEME_STORAGE_KEY = "THEME_STORAGE_KEY"
let PRO_COLOR_LIGHT_STORAGE_KEY = "PRO_COLOR_LIGHT_STORAGE_KEY"
let PRO_COLOR_DARK_STORAGE_KEY = "PRO_COLOR_DARK_STORAGE_KEY"

enum Theme: String, CaseIterable, Identifiable, Codable {
    case custom
    case classic
    case classic1
    case classic2
    case classic3
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case green
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    case nokia
    case nord1
    case nord2
    case nord3
    case nord4
    case nord5
    case nord6
    case nord7
    case nord8
    case nord9
    case nord10

//    var accentColor: Color {
//        switch self {
//        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
//        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
//        }
//    }

    var mainColor: Color {
        Color(rawValue)
    }

    var name: String {
        rawValue.capitalized
    }

    var id: String {
        name
    }
}


class ThemeManager{
    static let shared = ThemeManager()

    @AppStorage(THEME_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var appTheme: Theme = .classic
    @AppStorage(PRO_COLOR_LIGHT_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proLightColor: Color = Theme.orange.mainColor
    @AppStorage(PRO_COLOR_DARK_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proDarkColor: Color = Theme.orange.mainColor

    // MARK: 除了ThemeView可以使用
    func currentProColor(colorScheme: ColorScheme) -> Color{
        return colorScheme == .dark ? proDarkColor : proLightColor
    }

    func currentColor(colorScheme: ColorScheme) -> Color{
        return appTheme == .custom ? currentProColor(colorScheme: colorScheme) : appTheme.mainColor
    }
}

