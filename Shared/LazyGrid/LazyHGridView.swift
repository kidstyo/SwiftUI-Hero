//
//  LazyHGridView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/7.
//

import SwiftUI

struct LazyHGridView: View {
    let items = 1...50

    let fixedRows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: fixedRows, alignment: .center) {
                ForEach(items, id: \.self) { item in
                    Image(systemName: "\(item).circle.fill")
                        .font(.largeTitle)
                }
            }
            .border(Color.red, width: 1)
            .frame(height: 150)
        }
    }
}

struct LazyHGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridView()
    }
}
