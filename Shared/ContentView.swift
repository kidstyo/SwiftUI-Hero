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
                // MARK: Sample
                Section {
                    NavigationLink("3x3") {
                        Today3x3View()
                            .navigationTitle(Text("3x3"))
                    }
                    NavigationLink("Media Picker") {
                        MediaPickerView()
                            .navigationTitle(Text("Media Picker"))
                    }

                    NavigationLink("DisclosureGroup") {
                        DisclosureGroupView()
                            .navigationTitle(Text("DisclosureGroup"))
                    }

                    Section {
                        NavigationLink("Shortcut") {
                            ShortcutView()
                                .navigationTitle(Text("Shortcut"))
                        }
                    } header: {
                        Text("Shortcut")
                    }
                } header: {
                    Text("Sample")
                }

                Section {
                    NavigationLink("CalendarSample") {
                        CalendarSampleView()
                            .navigationTitle(Text("CalendarSample"))
                    }
                } header: {
                    Text("Calendar")
                }
                
                // MARK: Typography
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

                    NavigationLink("Button") {
                        ButtonView()
                            .navigationTitle(Text("Button"))
                    }
                }

                // MARK: Image
                Section {
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
                } header: {
                    Text("Image")
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

                // MARK: LazyStack
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

                // MARK: LazyGrid
                Section {
                    NavigationLink("LazyVGrid") {
                        LazyVGridView()
                            .navigationTitle(Text("LazyVGrid"))
                    }

                    NavigationLink("LazyHGrid") {
                        LazyHGridView()
                            .navigationTitle(Text("LazyHGrid"))
                    }
                } header: {
                    Text("LazyGrid")
                }

                // MARK: Sheet
                Section {
                    NavigationLink("BottomSheet") {
                        BottomSheetView()
                            .navigationTitle(Text("BottomSheet"))
                    }
                } header: {
                    Text("Sheet")
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
