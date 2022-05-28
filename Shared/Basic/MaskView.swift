//
//  MaskView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/28.
//

import SwiftUI

struct MaskView: View {
    var body: some View {
        ScrollView{
            VStack{
                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())

                Image("Owen Pomery")
                    .resizable()
                    .scaledToFit()
                    .mask(Circle())

                Image("Owen Pomery")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .mask(
                        Text("SWIFT UI!").font(.system(size: 100)).bold()
                    )
            }
        }
    }
}

struct MaskView_Previews: PreviewProvider {
    static var previews: some View {
        MaskView()
    }
}
