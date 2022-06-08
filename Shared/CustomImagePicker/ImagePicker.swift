//
//  ImagePicker.swift
//  Today_3x3
//
//  Created by kidstyo on 2022/3/31.
//

import Foundation
import UIKit
import SwiftUI
import PhotosUI

//import Photos
import MobileCoreServices
//import AVFoundation
//import AVKit

class PhotoModel: ObservableObject {
    @Published var image: Image?
    @Published var livePhoto: PHLivePhoto?

    // Image
    @Published var showImagePicker = false
    @Published var inputImage: UIImage?

    @Published var sourceType: UIImagePickerController.SourceType = .photoLibrary

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

/*
 UIImagePickerController
 */
struct ImagePicker: UIViewControllerRepresentable {

    // MARK: - Environment Object
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    @Binding var livePhoto: PHLivePhoto?

    var sourceType: UIImagePickerController.SourceType = .photoLibrary

    // MARK: - Coordinator Class
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let mediaType = info[.mediaType] as! NSString
            print("DEBUG \(mediaType)")
            print("DEBUG originalImage: \(info[.originalImage])")
            print("DEBUG livePhoto: \(info[.livePhoto])")
            print("DEBUG imageURL: \(info[.imageURL])")
            print("DEBUG mediaURL: \(info[.mediaURL])")

            if let livePhoto = info[.livePhoto] as? PHLivePhoto {
                parent.livePhoto = livePhoto
            }
            else if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        // 需要加上，否则livePhoto无法选择？
        imagePicker.mediaTypes = [kUTTypeLivePhoto, kUTTypeImage] as [String]
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}
