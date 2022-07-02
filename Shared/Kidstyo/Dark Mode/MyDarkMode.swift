//
//  MyDarkMode.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/2.
//

import Foundation
import SwiftUI

enum AppearanceOptions: String, CaseIterable {
    case system, light, dark
}

let DARK_MODE_KEY = "appAppearance"

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
