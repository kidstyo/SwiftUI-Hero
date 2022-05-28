//
//  ContentView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink("Text") {
                    TextView()
                        .navigationTitle(Text("Text"))
                }

                NavigationLink("Label") {
                    LabelView()
                        .navigationTitle(Text("Label"))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
