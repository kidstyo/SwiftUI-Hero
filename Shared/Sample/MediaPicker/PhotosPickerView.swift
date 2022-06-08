//
//  PhotosPickerView.swift
//  Collage (iOS)
//
//  Created by Tomas Trujillo on 2021-09-25.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let onResultsHandler: ([PHPickerResult]) -> Void

    func makeCoordinator() -> PhotosPickerViewCoordinator {
        PhotosPickerViewCoordinator(isPresented: _isPresented, onResultsHandler: onResultsHandler)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.filter = .any(of: [.images, .videos])
        configuration.selectionLimit = 0
        configuration.selection = .ordered
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

final class PhotosPickerViewCoordinator: PHPickerViewControllerDelegate {
    let onResultsHandler: ([PHPickerResult]) -> Void
    @Binding var isPresented: Bool

    init(isPresented: Binding<Bool>, onResultsHandler: @escaping ([PHPickerResult]) -> Void) {
        self._isPresented = isPresented
        self.onResultsHandler = onResultsHandler
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        onResultsHandler(results)
        isPresented = false
    }
}
