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

                NavigationLink("TextField") {
                    TextFieldView(username: "", nickname: "")
                        .navigationTitle(Text("TextField"))
                }

                NavigationLink("TextEditor") {
                    TextEditorView()
                        .navigationTitle(Text("TextEditor"))
                }

                NavigationLink("Button") {
                    ButtonView()
                        .navigationTitle(Text("Button"))
                }

                NavigationLink("Image") {
                    ImageView()
                        .navigationTitle(Text("Image"))
                }

                NavigationLink("Mask") {
                    MaskView()
                        .navigationTitle(Text("Mask"))
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
