//
//  MediaPickerView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/6/8.
//

import SwiftUI
import PhotosUI
import AVKit

struct MediaPickerView: View {
    enum MediaItem {
        case photo(UIImage)
        case video(URL)
        case livePhoto(PHLivePhoto)
    }

    @StateObject private var viewModel = CanvasViewModel()
    @State private var isShowingImagePicker = false
    @State private var isShowingCameraPicker = false
    @State private var isShowingCameraVideoPicker = false
    @State private var isPresentingLivePhotoConfirmation = false
    @State var mediaItems: [MediaItem] = []

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.fixed(175), spacing: 10), count: 2)) {
                    ForEach(viewModel.items.indices, id: \.self) { index in
                        let item = viewModel.items[index]
                        if case .photo(let image) = item {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                        } else if case .video(let url) = item {
                            VideoPlayer(player: AVPlayer(url: url))
                                .frame(height: 175)
                        } else if case .livePhoto(let livePhoto) = item {
                            LivePhotoView2(photo: livePhoto)
                                .frame(height: 175)
                        }
                    }
                }
        }
        .navigationBarItems(
            trailing:
                trailingButtons
        )
        .sheet(isPresented: $isShowingImagePicker) {
            // 选择图片和LivePhoto
            PhotosPickerView(isPresented: $isShowingImagePicker) {
                // onResultsHandler
                viewModel.handleResults($0)
            }
        }
        .sheet(isPresented: $isShowingCameraPicker) {
            CameraPickerView(
                isPresented: $isShowingCameraPicker,
                onOutput: .picture({ viewModel.handleAddedImage($0) })
            )
        }
        .sheet(isPresented: $isShowingCameraVideoPicker) {
            CameraPickerView(
                isPresented: $isShowingCameraVideoPicker,
                onOutput: .video({ viewModel.handleAddedVideo($0) }))
        }
        // 选择图片或者LivePhoto
        .confirmationDialog("Choose Image Type", isPresented: $isPresentingLivePhotoConfirmation, titleVisibility: .visible) {
            Button(action: {
                viewModel.isLoadingLivePhotos = false
                isShowingImagePicker.toggle()
            }) {
                Text("Image")
            }

            Button(action: {
                viewModel.isLoadingLivePhotos = true
                isShowingImagePicker.toggle()
            }) {
                Text("Live Photos")
            }
        } message: {
            Text("Choose how you want to display your photos")
        }
//        .onReceive(viewModel.$items) {
//            print("Added item count \($0.count)")
//            guard !$0.isEmpty else { return }
//            mediaItems = $0
//        }
    }

    private var trailingButtons: some View {
        HStack {
            if viewModel.isCameraAvailable {
                Button(action: {
                    isShowingCameraPicker.toggle()
                }) {
                    Image(systemName: "camera")
                }
                Button(action: {
                    isShowingCameraVideoPicker.toggle()
                }) {
                    Image(systemName: "film")
                }
            }
            Button(action: {
                isPresentingLivePhotoConfirmation.toggle()
            }) {
                Image(systemName: "plus.circle")
            }
        }
    }
}

struct MediaPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MediaPickerView()
        }
    }
}
