//
//  SampleEmojiView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/10.
//

import SwiftUI

struct SampleEmojiView: View {
    @State private var iconStr: String = "☕️"
    @FocusState var isFocus: String?

    @State private var textLength: Int = 0

    var body: some View {
        let _ = Self._printChanges()

        VStack{
            Text("\(textLength)")

            // 修改
            TextField("ICON", text: $iconStr)
                .font(.system(size: 80))
                .focused($isFocus, equals: "icon")
                .onChange(of: iconStr) { newValue in
                    textLength = newValue.count
                }
        }
    }
}

struct SampleEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        SampleEmojiView()
    }
}
