//
//  LivePhotoView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/6.
//

import SwiftUI

import Photos

struct LivePhotoSampleView: View {
    @StateObject var photoModel: PhotoModel = PhotoModel()
    @State var liveData: Data?

    func getLivePhotoData(livePhoto: PHLivePhoto) {
         let assetResources = PHAssetResource.assetResources(for: livePhoto)
         for assetRes in assetResources {
            if assetRes.type == .pairedVideo {
               PHAssetResourceManager.default().requestData(for: assetRes, options: nil, dataReceivedHandler: { (data) in
                   liveData = data
                   print("DEBUG \(liveData)")
//                    self.uploadLivePhoto(data)
                    }, completionHandler: { (error) in
                        print(error)
                })
            }
        }
    }

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

                Button {
                    getLivePhotoData(livePhoto: photoModel.livePhoto!)
                } label: {
                    Text("LivePhoto To Data")
                }
            }

//            if liveData != nil{
//                Text("liveData")
//                let uiImage = UIImage(data: liveData!)
//                if uiImage != nil{
//                    Image(uiImage: uiImage!)
//                        .resizable()
//                        .scaledToFill()
//                }
//            }

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
