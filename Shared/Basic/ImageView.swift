//
//  ImageView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/28.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        List{
            Image(systemName: "arkit")

            Image(systemName: "arkit")
                .foregroundColor(.orange)
                .font(.largeTitle)

            Section {
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .background(.orange)

                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .center)
                    .background(.orange)

                HStack{
                    Spacer()
                    Image("Owen Pomery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .background(.orange)
                    Spacer()
                }
            } header: {
                Text("ScaleTo")
            }

            Section {
                // 半透明效果增加亮度
                // 试图外创建一个半透明蒙版
                // 暗区变为透明
                // 亮度变为不透明的黑色
                // 中等亮度变成灰色
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .luminanceToAlpha()

                Group{
                    // 饱和度 > 1，增加饱和度
                    // 1 原色
                    // 0 灰度
                    Image("Owen Pomery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .saturation(20)

                    Image("Owen Pomery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .saturation(0)
                }

                // 灰度 0 = 原色
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .grayscale(0.5)

                // 色调旋转
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .hueRotation(Angle.degrees(100))

                // 270度，如果360则与原图一样
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .hueRotation(Angle.degrees(270))

                Group{
                    // 对比度
                    Image("Owen Pomery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .contrast(1.5)

                    // 对比度，并反转
                    Image("Owen Pomery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .contrast(-1.5)
                }

                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .colorMultiply(.yellow)

                // 亮度
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .brightness(0.2)

                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .colorInvert()
            } header: {
                Text("Effect")
            }

            Section {
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .shadow(radius: 10)

                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .shadow(color: .purple, radius: 2, x: 20, y: 20)

                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .border(.green, width: 2)
            } header: {
                Text("Style")
            }

            Section {
                // 差值混合模式，查看每个通道中的颜色额
                // 并从基色中减去混合色，或从混合色中减去基色
                // 与白色混合将反转基色的值
                // 与黑色混合则不会发生变化

                // 图片和背景颜色，也就是白色按照差值进行混合
                // 共有21种混合模式
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .blendMode(.difference)

                ZStack{
                    Image("Owen Pomery Light")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)

                    Image("Owen Pomery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .blendMode(.difference)
                }

                ZStack{
                    Image("Owen Pomery Light")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)

                    Image("Owen Pomery")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .blendMode(.multiply)
                }
            } header: {
                Text("Blend")
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
            .previewDevice("iPhone 13 Pro")
    }
}
