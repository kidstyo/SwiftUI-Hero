//
//  SwiftUILivePhotoView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/6.
//

import SwiftUI
import PhotosUI

struct LivePhotoView: UIViewRepresentable {
    @Binding var livephoto: PHLivePhoto?

    func makeUIView(context: Context) -> PHLivePhotoView {
        return PHLivePhotoView()
    }

    func updateUIView(_ lpView: PHLivePhotoView, context: Context) {
        lpView.livePhoto = livephoto
    }
}
