//
//  PHPicker.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/8.
//

import PhotosUI
import SwiftUI

struct PHPicker: UIViewControllerRepresentable{
    func makeCoordinator() -> Coordinator {
        return PHPicker.Coordinator(parent1: self)
    }

    @Binding var images : [UIImage]
    @Binding var picker: Bool

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        // you can also select videos using this picker...
        config.filter = .images
        // 0 is used for multiple selection...
        config.selectionLimit = 0
        let picker = PHPickerViewController(configuration: config)
        // assigning delegate
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate{
        var parent: PHPicker

        init(parent1: PHPicker) {
            parent = parent1
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // closing picker...
            parent.picker.toggle()

            for img in results{
                // checking whether the imae can be loaded...
                if img.itemProvider.canLoadObject(ofClass: UIImage.self){
                    // retreving the selected Image...
                    img.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        guard let image1 = image else{
                            print(error ?? "error")
                            return
                        }

                        // appending image...
                        self.parent.images.append(image1 as! UIImage)
                    }
                }
                else{
                    // cannot be loaded
                    print("cannot be loaded")
                }
            }
        }
    }
}
