//
//  TextEditorView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/28.
//

import SwiftUI

struct TextEditorView: View {
    @State var content: String = ""
    @State var isSubmit: Bool = false

    init(){
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack{
            TextEditor(text: $content)
                .background(Color.gray.opacity(0.3))
                .frame(height: 200)
//                .frame(minHeight: 100)
//                .fixedSize(horizontal: false, vertical: true)

            Button {
                isSubmit.toggle()
            } label: {
                Text("Submit")
            }
            .alert(content, isPresented: $isSubmit, actions: {

            }, message: {
                Text("content")
            })
        }
        .padding()
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
