//
//  GridView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/7.
//

import SwiftUI

struct LazyVGridView: View {
    let data = (1...100).map { "Item \($0)" }

    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]

    let flexColumns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

    let fixFlexColumns = [
           GridItem(.fixed(100)),
           GridItem(.flexible()),
       ]

    var body: some View {
        ScrollView{
            Text("adaptive")
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    Text("11111111dsfasdfsadfads")
                        .lineLimit(1)
                        .border(Color.purple, width: 1)

                    Text("11111111dsfasdfsadfads")
                        .lineLimit(1)
                        .border(Color.purple, width: 1)


                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .lineLimit(1)
                            .padding()
                            .border(Color.green, width: 1)
                    }
                }
            }
            .border(Color.red, width: 1)
            .padding(.horizontal)
            .frame(maxHeight: 200)

            Text("flexible")
            ScrollView {
                LazyVGrid(columns: flexColumns, spacing: 20) {
                    Text("11111111dsfasdfsadfads")
                        .lineLimit(1)
                        .border(Color.purple, width: 1)

                    Text("11111111dsfasdfsadfads")
                        .lineLimit(1)
                        .border(Color.purple, width: 1)

                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .lineLimit(1)
                            .border(Color.yellow, width: 1)
                    }
                }
            }
            .border(Color.red, width: 1)
            .padding(.horizontal)
            .frame(maxHeight: 200)

            Text("fixed flexible")
            ScrollView {
                LazyVGrid(columns: fixFlexColumns, spacing: 20) {
                    Text("11111111dsfasdfsadfads")
                        .lineLimit(1)
                        .border(Color.purple, width: 1)

                    Text("11111111dsfasdfsadfads")
                        .lineLimit(1)
                        .border(Color.purple, width: 1)

                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .border(Color.pink, width: 1)
                    }
                }
                .padding(.horizontal)
            }
            .border(Color.red, width: 1)
            .padding(.horizontal)
            .frame(maxHeight: 200)
        }
    }
}

struct LazyVGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridView()
    }
}
