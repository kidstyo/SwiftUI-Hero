//
//  LabelView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/28.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        List{
            Label {
                Text("icon")
            } icon: {
                Image(systemName: "book.circle")
            }

            Label("你好 Hello", systemImage: "hand.wave")
            Label("You can’t connect the dots looking forward; you can only connect them looking backwards. So you have to trust that the dots will somehow connect in your future. You have to trust in something — your gut, destiny, life, karma, whatever.\n\n你不可能在向前看时把点点滴滴串连起来;你只能在回顾时把它们联系起来。所以你必须相信，这些点点滴滴会在你的未来以某种方式连接起来。你必须相信一些东西你的直觉，命运，生命，因缘，等等。", systemImage: "hand.point.right")
            Label("你好 Hello extraExtraExtraLarge", systemImage: "flowchart")
                .environment(\.sizeCategory, .extraExtraExtraLarge)
        }
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        // 动态尺寸
        LabelView()
    }
}
