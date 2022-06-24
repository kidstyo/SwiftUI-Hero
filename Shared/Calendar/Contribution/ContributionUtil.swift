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

/// Returns the opacity value based on the level.
/// - Parameter count: The number contributed to the current date.
/// - Returns: Transparency value.
func getOpacity(count: Int, levelSpacing: Int) -> CGFloat {
    if count == 0 {
        return ACLevel.zero.opacity
    }else if ACLevel.first.rawValue * levelSpacing >= count {
        return ACLevel.first.opacity
    }else if ACLevel.second.rawValue * levelSpacing >= count {
        return ACLevel.second.opacity
    }else if ACLevel.third.rawValue * levelSpacing >= count {
        return ACLevel.third.opacity
    }else if ACLevel.fourth.rawValue * levelSpacing >= count {
        return ACLevel.fourth.opacity
    }
    return 1.0
}
