//
//  TextFieldView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/28.
//

import SwiftUI

struct TextFieldView: View {
    @State var username: String
    @State var nickname: String

    var body: some View {
        VStack{
            Text("username is \(username)")
            Text("nickname is \(nickname)")

            TextField("User Name", text: $username)
                .onSubmit {
                    print("onSubmit")
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Nick Name", text: $nickname)
                .onSubmit {
                    print("onSubmit")
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(username: "", nickname: "")
    }
}
