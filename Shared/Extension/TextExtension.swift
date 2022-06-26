//
//  TextExtension.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/26.
//  Version: 20220626
//

import SwiftUI

extension Text{
    // MARK: 标签文本显示
    func TagModifier(textColor: Color) -> some View{
        self
        .foregroundColor(textColor)
        .padding(.horizontal, 4)
        .padding(.vertical, 2)
        .font(.footnote)
        .lineLimit(1)
        .background(Color.secondary.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
    }
}
