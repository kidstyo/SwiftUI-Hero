//
//  ContributionUtil.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/23.
//

import SwiftUI

/// Defines the unit of contribution level.
enum ACLevel: Int, CaseIterable {
    case zero = 0, first, second, third, fourth

    /// Opacity value according to level.
    var opacity: CGFloat {
        switch self {
        case .zero:     return 0
        case .first:    return 0.3
        case .second:   return 0.5
        case .third:    return 0.7
        case .fourth:   return 0.9
        }
    }
}
