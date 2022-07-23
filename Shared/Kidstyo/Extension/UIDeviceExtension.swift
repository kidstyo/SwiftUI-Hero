//
//  UIDeviceExtension.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/23.
//  📝Version: 1⃣️
//

import UIKit

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
