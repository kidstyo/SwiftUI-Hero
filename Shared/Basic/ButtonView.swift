//
//  ButtonView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/28.
//

import SwiftUI

struct ButtonView: View {
    @State var isPresented: Bool = false

    var body: some View {
        VStack{
            Button {

            } label: {
                Image(systemName: "hand.wave")
                Text("First Button")
            }
            .padding()
            .foregroundColor(.white)
            .background(.orange)

            Button {

            } label: {
                Label("Second Button", systemImage: "hand.wave")
                    .padding()
            }
            .foregroundColor(.white)
            .background(.orange)

            Button {
                isPresented.toggle()
            } label: {
                Label("Open Sheet", systemImage: "hand.wave")
                    .padding()
            }
            .foregroundColor(.white)
            .background(.green)
            .sheet(isPresented: $isPresented) {
                print("Close Sheet")
            } content: {
                Text("Hello World")
                    .font(.largeTitle)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
