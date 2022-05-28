//
//  ScaleRotationView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/28.
//

import SwiftUI

struct ScaleRotationView: View {
    var body: some View {
        ScrollView{
            VStack{
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .background(.orange)

                // 旋转
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle.init(degrees: 90))
                    .background(.orange)


                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle.init(degrees: 20), anchor: UnitPoint.init(x: 0, y: 0))
                    .background(.orange)

                // 3D 旋转
                // 锚点 左上角
                // x水平
                // y垂直
                // z屏幕
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .rotation3DEffect(Angle.init(degrees: 45), axis: (x: CGFloat(1), y: CGFloat(0), z: CGFloat(0)))
                    .background(.orange)

                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .rotation3DEffect(Angle.init(degrees: 45), axis: (x: CGFloat(0), y: CGFloat(1), z: CGFloat(0)))
                    .background(.orange)

                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .rotation3DEffect(Angle.init(degrees: 45), axis: (x: CGFloat(0), y: CGFloat(0), z: CGFloat(1)))
                    .background(.orange)

                // 缩放
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.8)
                    .background(.orange)

                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(CGSize(width: 0.8, height: 0.5))
                    .background(.orange)

                // 缩放锚点
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: 1.2, y: 0.5, anchor: UnitPoint.topLeading)
                    .background(.orange)
            }
        }
    }
}

struct ScaleRotationView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleRotationView()
    }
}
