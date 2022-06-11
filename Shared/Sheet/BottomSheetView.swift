//
//  BottomSheetView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/11.
//

import SwiftUI

struct BottomSheetView: View {
    @State private var showModel: Bool = true

    var body: some View {
        ZStack{
            Image("BG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Button {
                showModel = true
            } label: {
                Text("Click Me")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal,40)
                    .background(Color.black.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .offset(y: -100)

            BottomSheetModelView(isShowing: $showModel)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .statusBarHidden(true)
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
            .previewDevice("iPhone 13 Pro")
    }
}
