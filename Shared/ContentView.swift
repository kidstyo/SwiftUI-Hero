//
//  ContentView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                Section {
                    NavigationLink("3x3") {
                        Today3x3View()
                            .navigationTitle(Text("3x3"))
                    }
                    NavigationLink("Media Picker") {
                        MediaPickerView()
                            .navigationTitle(Text("Media Picker"))
                    }
                } header: {
                    Text("Sample")
                }

                Section {
                    NavigationLink("Text") {
                        TextView()
                            .navigationTitle(Text("Text"))
                    }

                    NavigationLink("CustomFont") {
                        CustomFontView()
                            .navigationTitle(Text("CustomFont"))
                    }
                } header: {
                    Text("Typography")
                }

                Section{
                    NavigationLink("Label") {
                        LabelView()
                            .navigationTitle(Text("Label"))
                    }

                    NavigationLink("TextField") {
                        TextFieldView(username: "", nickname: "")
                            .navigationTitle(Text("TextField"))
                    }

                    NavigationLink("TextEditor") {
                        TextEditorView()
                            .navigationTitle(Text("TextEditor"))
                    }

                    Group{
                        NavigationLink("Button") {
                            ButtonView()
                                .navigationTitle(Text("Button"))
                        }

                        NavigationLink("Image") {
                            ImageView()
                                .navigationTitle(Text("Image"))
                        }

                        NavigationLink("Mask") {
                            MaskView()
                                .navigationTitle(Text("Mask"))
                        }

                        NavigationLink("Scale and Rotation") {
                            ScaleRotationView()
                                .navigationTitle(Text("Scale and Rotation"))
                        }

                        NavigationLink("Image Download") {
                            ImageDownloadView()
                                .navigationTitle(Text("Image Download"))
                        }
                    }
                }

                Section {
                    NavigationLink("PHPicker") {
                        PHPickerView()
                            .navigationTitle(Text("PHPicker"))
                    }

                    NavigationLink("LivePhoto") {
                        LivePhotoSampleView()
                            .navigationTitle(Text("LivePhoto"))
                    }
                } header: {
                    Text("Photo")
                }

                Section {
                    NavigationLink("iCloud") {
                        CloudView()
                            .navigationTitle(Text("iCloud"))
                    }
                } header: {
                    Text("iCloud")
                }

                Section {
                    NavigationLink("LazyHStack") {
                        LazyHStackView()
                            .navigationTitle(Text("LazyHStack"))
                    }

                    NavigationLink("LazyVStack") {
                        LazyVStackView()
                            .navigationTitle(Text("LazyVStack"))
                    }
                } header: {
                    Text("LazyStack")
                }

                Section {
                    NavigationLink("LazyVGridView") {
                        LazyVGridView()
                            .navigationTitle(Text("LazyVGridView"))
                    }

                    NavigationLink("LazyHGridView") {
                        LazyHGridView()
                            .navigationTitle(Text("LazyHGridView"))
                    }
                } header: {
                    Text("LazyGrid")
                }

                Section {
                    NavigationLink("Shortcut") {
                        ShortcutView()
                            .navigationTitle(Text("Shortcut"))
                    }
                } header: {
                    Text("Shortcut")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
