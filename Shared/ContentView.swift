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

                Group{
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

                    NavigationLink("Scale and Rotation") {
                        ScaleRotationView()
                            .navigationTitle(Text("Scale and Rotation"))
                    }

                    NavigationLink("Image Download") {
                        ImageDownloadView()
                            .navigationTitle(Text("Image Download"))
                    }
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
