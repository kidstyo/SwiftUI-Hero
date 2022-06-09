//
//  TextView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/27.
//

import SwiftUI

struct TextView: View {
    var now = Date()
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()

    let steveJobs = "测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试\nI am honored to be with you today at your commencement from one of the finest universities in the world. I never graduated from college. Truth be told, this is the closest I’ve ever gotten to a college graduation. Today I want to tell you three stories from my life. That’s it. No big deal. Just three stories.\nStay Hungry. Stay Foolish.\nThank you all very much."

    var body: some View {
        ZStack{
            List{
                Group{
                    Text(steveJobs)
                        .font(.body.leading(.standard))
                        .padding()

                    Text("你好 Hello")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .font(.custom("AmericanTypewriter", size: 60))
        //                .background(.clear)
        //                .background(.red)
        //                .background(.ultraThinMaterial)
                        .allowsHitTesting(false)

                    Text("你好 Hello, Pic!")
                        .background(Text("你好 Hello World").font(.largeTitle), alignment: .bottom)
                        .foregroundColor(.green)
                }

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

                Section{
                    // 添加文本视图，设置文字的字体为标题样式，该样式可以根据屏幕尺寸的大小，自动调整自身的尺寸
                    Text("你好 Hello, world!,Automatic")
                        .font(.system(.title, design: .monospaced))
                        .lineLimit(2)
                    // 添加文本视图，设置文字的字体，尺寸为36
                    Text("你好 Hello, world!")
                        .font(.custom("BradleyHandITCTT-Bold", size: 36))
                }

                Section {
                    // 添加文本视图，设置字体属性的字距为10
                    Text("你好 哈哈 Hello, world! tracking")
                        .tracking(10)
                    // 添加文本视图，设置字体属性的字距为10。字距调整属性表示一对字元的字距
                    Text("你好 哈哈 Hello, world! kerning")
                        .kerning(10)
                    // 添加文本视图，给文本视图添加模糊效果，并设置模糊效的半径为1
                    Text("你好 Hello, world! blur").blur(radius: 1)
                    // 添加一个具有长文字内容的文本视图，设置文本视图的行距为20，同时不限制文字的行数
                    Text("你好 Hello, world! 你好 Hello, world! 你好 Hello, world! 你好 Hello, world! 你好 Hello, world! 你好 Hello, world! multilineTextAlignment lineSpacing")
                        .multilineTextAlignment(.leading)
                        .lineSpacing(50)
                        .lineLimit(nil)
                    // 添加文本视图，设置文字向右侧偏移40的距离
                    Text("你好 Hello, world! offset").offset(x: 40, y: 0)
                    // 添加文本视图，设置宽度为200，高度为80，文字位于文本视图的右下角，颜色为橙色
                    Text("你好 Hello, world! frame")
                        .frame(width: 200, height: 80, alignment: .bottomTrailing)
                        .background(Color.orange)
                    VStack{
                        // 添加文本视图，设置宽度为300，高度为100，文字位于文本视图的右下角
                        // position方法会使对其属性失效，因此文字不再位于视图的右下角，会向右和向下各偏移50点的位置
                        Text("你好 Hello, world!")
                            .position(x: 50, y: 50)
                            .frame(width: 300, height: 100, alignment: .bottomTrailing)
                            .background(Color.orange)
                        // 添加文本视图，设置可以显示4行文字
                        // 最后调用多行文字的对齐方法
                        // multilineTextAlignment:多行文本对齐
                        Text("西瓜\n香蕉\n苹果\n车厘子")
                            .frame(width: 200, height: 100)
                            .lineLimit(4)
                            .multilineTextAlignment(.center)
                    }
                } header: {
                    // 通过段落属性可以调整文字的间距、行距、偏移值、框架和对齐方式等视觉样式
                    Text("段落属性")
                }

                Section {
                    // 添加文本视图，文本加粗
                    // background：背景颜色
                    // foregroundColor:前景颜色
                    Text("Hello, world!")
                        .background(Color.black)
                        .foregroundColor(.white)
                        .padding(20)

                    // 链式调用的顺序由上而下，
                    // 所以首先设置第二个文本视图的那边句，
                    // 然后再给文本视图设置背景颜色和字体颜色，
                    // 这时那边句也会有有相应的背景颜色
                    Text("Hello, world!")
                        .padding(20)
                        .background(Color.black)
                        .foregroundColor(.white)

                    // 创建多个填充属性，创建由外向内颜色渐变的边框
                    // 设置文字样式为巨型标题样式
                    Text("Hello, world!")
                        .font(.largeTitle)
                        .padding(15)
                        .background(Color.yellow)
                        .padding(15)
                        .background(Color.orange)
                        .padding(10)
                        .background(Color.red)
                } header: {
                    // 使用填充属性，修改文字内容和文本视图边框之间的距离，即修改文本视图的上下左右的内边距
                    Text("填充属性")
                }

                Section {
                    Text("The time is: \(now, formatter: Self.dateFormatter)")
                } header: {
                    Text("格式化")
                }

                Section {
                    Text("你好 Hello ")
                        .foregroundColor(.orange)
                        .fontWeight(.heavy)
                    + Text("World")
                        .italic()
                } header: {
                    Text("富文本")
                }
            }
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}

