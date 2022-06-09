//
//  FontView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/9.
//

import SwiftUI

struct CustomFontView: View {
    var body: some View {
        List{
            Section {
                Text("New York")
                    .font(.system(.largeTitle, design: .serif))

                Text("你好世界 Hello World! default")
                    .font(.system(.body, design: .default))

                Text("你好世界 Hello World! rounded")
                    .font(.system(.body, design: .rounded))

                Text("你好世界 Hello World! monospaced")
                    .font(.system(.body, design: .monospaced))

                Text("你好世界 Hello World! serif")
                    .font(.system(.body, design: .serif))
            } header: {
                Text("Design")
            }

            Section {
                let customSize: CGFloat = 16
                Text("你好世界 Hello World! Default")
                    .font(.system(size: customSize))
                Text("你好世界 Hello World! Helvetica")
                    .font(.custom("Helvetica", size: customSize))

                Text("你好世界 Hello World! AmericanTypewriter")
                    .font(.custom("AmericanTypewriter", size: customSize))
                Text("你好世界 Hello World! Avenir-Medium")
                    .font(.custom("Avenir-Medium", size: customSize))
                Text("你好世界 Hello World! Charter-Roman")
                    .font(.custom("Charter-Roman", size: customSize))
                Text("你好世界 Hello World! Avenir-Roman")
                    .font(.custom("Avenir-Roman", size: customSize))
                Text("你好世界 Hello World! Courier")
                    .font(.custom("Courier", size: customSize))
                Text("你好世界 Hello World! Georgia")
                    .font(.custom("Georgia", size: customSize))
            } header: {
                Text("Custom")
            }
        }
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        CustomFontView()
    }
}
