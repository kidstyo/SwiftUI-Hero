//
//  TextView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/27.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        List{
            Section {
                Group{
                    Text("你好 Hello, World! largeTitle")
                        .font(.largeTitle)
                    Text("你好 Hello, World! title")
                        .font(.title)
                    Text("你好 Hello, World! title2")
                        .font(.title2)
                    Text("你好 Hello, World! title3")
                        .font(.title3)
                }
                Text("你好 Hello, World! headline")
                    .font(.headline)
                Text("你好 Hello, World! body")
                    .font(.body)
                Text("你好 Hello, World! subheadline")
                    .font(.subheadline)
                Text("你好 Hello, World! callout")
                    .font(.callout)
                Text("你好 Hello, World! footnote")
                    .font(.footnote)
                Text("你好 Hello, World! caption")
                    .font(.caption)
                Text("你好 Hello, World! caption2")
                    .font(.caption2)
            } header: {
                Text("Font")
            }

            Section {
                Group{
                    Text("你好 Hello, World! body")
                        .font(.body)
                    Text("你好 Hello, World! regular")
                        .fontWeight(.regular)
                    Text("你好 Hello, World! black")
                        .fontWeight(.black)
                    Text("你好 Hello, World! heavy")
                        .fontWeight(.heavy)
                    Text("你好 Hello, World! bold")
                        .fontWeight(.bold)
                    Text("你好 Hello, World! semibold")
                        .fontWeight(.semibold)
                    Text("你好 Hello, World! medium")
                        .fontWeight(.medium)
                    Text("你好 Hello, World! light")
                        .fontWeight(.light)
                    Text("你好 Hello, World! thin")
                        .fontWeight(.thin)
                    Text("你好 Hello, World! ultraLight")
                        .fontWeight(.ultraLight)
                }
            } header: {
                Text("Weight")
            }

            Section {
                // 添加文本视图，设置文本向上的偏移，设置文本的背景色为橙色
                Text("Hello, world! baselineOffset")
                    .baselineOffset(30)
                    .background(Color.orange)
                Text("你好 Hello, World! italic")
                    .italic()
                Text("你好 Hello, World! underline")
                    .underline(true, color: .yellow)
                Text("你好 Hello, World! strikethrough")
                    .strikethrough(true, color: .red)
            } header: {
                Text("Style")
            }

            Section {
                Text("你好 Hello, World! foregroundColor")
                    .foregroundColor(.orange)
                Text("你好 Hello, World! tint")
                    .tint(.orange)
            } header: {
                Text("Color")
            }

            Text("Hello, Pic!")
                .background(Text("Hello World").font(.largeTitle), alignment: .bottom)
                .foregroundColor(.green)
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
