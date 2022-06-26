//
//  TextStyleView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/26.
//

import SwiftUI

struct TextStyleView: View {
    var body: some View {
        List{
            // MARK: TAG
            Text("标签/数字提示")
                .TagModifier(textColor: .pink)
        }
    }
}

struct TextStyleView_Previews: PreviewProvider {
    static var previews: some View {
        TextStyleView()
    }
}
