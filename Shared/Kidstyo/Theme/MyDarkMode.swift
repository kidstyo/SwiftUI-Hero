//
//  MyDarkMode.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/2.
//  📝Version: 1⃣️
//

import Foundation
import SwiftUI

enum AppearanceOptions: String, CaseIterable {
    case light, dark, system
}

let DARK_MODE_KEY = "currentColorScheme"

class AppearanceController {
    static let shared = AppearanceController()
    @AppStorage(DARK_MODE_KEY) var appAppearance: AppearanceOptions = .system

    var appearance: UIUserInterfaceStyle {
        switch appAppearance {
        case .system:
            return .unspecified // Uses appearance set by user in Settings
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }

    func setAppearance() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        guard let window = windowScene?.windows.first else { return }
        window.overrideUserInterfaceStyle = appearance
    }
}
