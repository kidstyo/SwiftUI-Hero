//
//  SampleListView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/7.
//

import SwiftUI

struct SampleListView: View {
    var body: some View {
        List {
            Label("Text你好 0", systemImage: "eye")

            Label("Text你好 1", systemImage: "eye")
                .listRowSeparator(.hidden)

            Label("Text你好 2", systemImage: "eye")
                .listRowSeparatorTint(.cyan)

            Label("Text你好 3", systemImage: "eye")
                .listRowSeparatorTint(.red)

            Label("Text你好 4", systemImage: "eye")
                .listItemTint(.fixed(Color.red))

            Label("Text你好 5", systemImage: "eye")
                .listRowBackground(Color.yellow)
        }
        .listStyle(.plain)
    }
}

struct SampleListView_Previews: PreviewProvider {
    static var previews: some View {
        SampleListView()
    }
}
