/*
//  📝Version: 1⃣️
*/

import SwiftUI

let THEME_KEY = "AppStorage_Theme_Color"
let PRO_COLOR_KEY = "PRO_COLOR_KEY"

enum Theme: String, CaseIterable, Identifiable, Codable {
    case classic
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow

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
