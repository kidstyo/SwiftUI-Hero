//
//  LivePhotoView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/6.
//

import SwiftUI

struct LivePhotoSampleView: View {
    @StateObject var photoModel: PhotoModel = PhotoModel()

    var body: some View {
        List{
            // MARK: Show
            if photoModel.image != nil{
                Text("Image")
                photoModel.image!
                    .resizable()
                    .scaledToFill()
            }

            if photoModel.livePhoto != nil{
                Text("LivePhoto")
                LivePhotoView(livephoto: $photoModel.livePhoto)
                    .scaledToFill()
            }

            Button {
                photoModel.showImagePicker.toggle()
            } label: {
                Text("Pick LivePhoto")
            }
            .sheet(isPresented: $photoModel.showImagePicker, onDismiss: photoModel.loadImage) { ImagePicker(image: $photoModel.inputImage, livePhoto: $photoModel.livePhoto, sourceType: photoModel.sourceType)
//                    .ignoresSafeArea()
            }
        }
    }
}

struct LivePhotoSampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LivePhotoSampleView()
        }
    }
}
