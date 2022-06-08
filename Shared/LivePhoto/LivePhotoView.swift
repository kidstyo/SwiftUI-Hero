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
        let view = PHLivePhotoView()
        return view
    }

    func updateUIView(_ lpView: PHLivePhotoView, context: Context) {
        lpView.livePhoto = livephoto
    }
}

struct LivePhotoView2: UIViewRepresentable {
    let photo: PHLivePhoto

    func makeUIView(context: Context) -> PHLivePhotoView {
      let view = PHLivePhotoView()
      view.livePhoto = photo
      view.startPlayback(with: .hint)
      return view
    }

    func updateUIView(_ uiView: PHLivePhotoView, context: Context) { }
}
