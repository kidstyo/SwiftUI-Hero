//
//  BottomSheetModelView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/11.
//

import SwiftUI

struct BottomSheetModelView: View {
    @Binding var isShowing: Bool
    @State private var curHeight: CGFloat = 400
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 700

    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing{
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }

                mainView
                    .transition(.move(edge: .bottom))
            }
        }
//        .background(Color.red)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }

    var mainView: some View{
        VStack{
            ZStack{
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            // For Dragging
            .background(Color.white.opacity(0.00001))

            ZStack{
                VStack{
                    Text("\"If you truly loved yourself, you could never hurt another.\"")
                        .font(.system(size: 25, weight: .regular))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 10)

                    Text("Buddha")
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.horizontal, 30)
//                .background(Color.yellow)
            }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 35)
//            .background(Color.green)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}

struct BottomSheetModelView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            BottomSheetView()
                .previewDevice("iPhone 13 Pro")
            BottomSheetModelView(isShowing: .constant(true))
                .previewDevice("iPhone 13 Pro")
        }
    }
}
