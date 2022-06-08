//
//  CanvasViewModel.swift
//  Collage (iOS)
//
//  Created by Tomas Trujillo on 2021-09-25.
//

import Foundation
import UIKit
import PhotosUI

final class CanvasViewModel: ObservableObject {
    @Published var items: [MediaPickerView.MediaItem] = []
    @Published var isLoadingLivePhotos: Bool = false
    private var tempDirectoryURL: URL {
        FileManager.default.temporaryDirectory
    }

    var isCameraAvailable: Bool {
        UIImagePickerController.isSourceTypeAvailable(.camera)
    }

    func handleAddedImage(_ addedImage: UIImage) {
        DispatchQueue.main.async {
            self.items.append(.photo(addedImage))
        }
    }

    func handleAddedVideo(_ videoURL: URL) {
        copyVideoURLToTempDirectory(url: videoURL)
    }

    func handleResults(_ results: [PHPickerResult]) {
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: PHLivePhoto.self) && isLoadingLivePhotos {
                loadLivePhoto(from: result)
            }
            else if result.itemProvider.hasItemConformingToTypeIdentifier(UTType.image.identifier) {
                loadImage(from: result)
            } else if result.itemProvider.hasItemConformingToTypeIdentifier(UTType.movie.identifier) {
                loadVideoURL(from: result)
            }
        }
    }
}

private extension CanvasViewModel {
    func loadLivePhoto(from result: PHPickerResult) {
        result.itemProvider.loadObject(ofClass: PHLivePhoto.self) { [weak self] photoObject, error in
            guard let livePhoto = photoObject as? PHLivePhoto else { return }
            DispatchQueue.main.async { [weak self] in
                self?.items.append(.livePhoto(livePhoto))
            }
        }
    }

    func loadImage(from result: PHPickerResult) {
        result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] imageObject, error in
            guard let image = imageObject as? UIImage else { return }
            DispatchQueue.main.async { [weak self] in
                self?.items.append(.photo(image))
            }
        }
    }

    func loadVideoURL(from result: PHPickerResult) {
        result.itemProvider.loadItem(forTypeIdentifier: UTType.movie.identifier, options: nil) { [weak self] videoURL, error in
            guard let url = videoURL as? URL else { return }
            self?.copyVideoURLToTempDirectory(url: url)
        }
    }

    func copyVideoURLToTempDirectory(url: URL) {
        let localVideoURL = tempDirectoryURL.appendingPathComponent("\(Date().timeIntervalSince1970).mov")
        do {
            try FileManager.default.copyItem(at: url, to: localVideoURL)
            DispatchQueue.main.async { [weak self] in
                self?.items.append(.video(localVideoURL))
            }
        } catch {
            print("error copying file \(error.localizedDescription)")
        }
    }
}
