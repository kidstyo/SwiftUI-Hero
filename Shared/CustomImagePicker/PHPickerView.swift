//
//  PHPickerView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/8.
//

import SwiftUI

struct PHPickerView: View {
    @State var images: [UIImage] = []
    @State var picker = false

    var body: some View {
        VStack{
            if images.isEmpty{
                Button {
                    picker.toggle()
                } label: {
                    Text("Pick Images")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 35)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }
            else{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15){
                        ForEach(images, id: \.self){ img in
                            Image(uiImage: img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                                .cornerRadius(20)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $picker) {
            PHPicker(images: $images, picker: $picker)
        }
    }
}

struct PHPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PHPickerView()
    }
}
