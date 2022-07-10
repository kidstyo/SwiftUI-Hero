//
//  ItemView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/7.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
        List {
            ForEach(1..<4){ i in
                ProTaskItemView()
                    .listRowSeparator(.hidden)
                    .onDrag({
                        return NSItemProvider()
                    })
            }
        }
        .listStyle(.plain)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
