//
//  CameraPickerView.swift
//  Collage (iOS)
//
//  Created by Tomas Trujillo on 2021-09-27.
//

import SwiftUI


struct CameraPickerView: UIViewControllerRepresentable {
    enum Output {
        case picture((UIImage) -> Void)
        case video((URL) -> Void)
    }
    @Binding var isPresented: Bool
    let onOutput: Output

    func makeCoordinator() -> CameraPickerViewCoordinator {
        return CameraPickerViewCoordinator(isPresented: _isPresented, onOutput: onOutput)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .camera
        if case .video = onOutput {
            controller.mediaTypes = ["public.movie"]
            controller.cameraCaptureMode = .video
        }
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }

}

final class CameraPickerViewCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @Binding var isPresented: Bool
    let onOutput: CameraPickerView.Output
    
    init(isPresented: Binding<Bool>, onOutput: CameraPickerView.Output) {
        self._isPresented = isPresented
        self.onOutput = onOutput
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if case .picture(let onPictureOutput) = onOutput {
            processImage(info: info, onPictureOutput: onPictureOutput)
        } else if case .video(let onVideoOutput) = onOutput {
            processVideo(info: info, onVideoOutput: onVideoOutput)
        }
        isPresented = false
    }

    private func processImage(info: [UIImagePickerController.InfoKey : Any], onPictureOutput: @escaping (UIImage) -> Void) {
        if let image = info[.originalImage] as? UIImage {
            DispatchQueue.main.async {
                onPictureOutput(image)
            }
        }
    }

    private func processVideo(info: [UIImagePickerController.InfoKey : Any], onVideoOutput: @escaping (URL) -> Void) {
        if let videoURL = info[.mediaURL] as? URL {
            DispatchQueue.main.async {
                onVideoOutput(videoURL)
            }
        }
    }
}
