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
    @State var password: String = ""

    var body: some View {
        VStack{
            Text("username is \(username)")
            Text("nickname is \(nickname)")
            Text("password is \(password)")

            TextField("User Name", text: $username)
                .onSubmit {
                    print("username onSubmit")
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Nick Name", text: $nickname){
                    print("nickname is \(nickname)")
                }
                .onSubmit {
                    print("nickname onSubmit")
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password){
                print("password is \(password)")
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
