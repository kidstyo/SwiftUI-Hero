//
//  SettingView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/2.
//

import SwiftUI

struct SettingView: View {
    @AppStorage(DARK_MODE_KEY) var appAppearance: AppearanceOptions = .system
 
    // Theme
    @Environment(\.colorScheme) private var colorScheme
    @AppStorage(THEME_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var appTheme: Theme = .classic
    @AppStorage(PRO_COLOR_LIGHT_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proLightColor: Color = Theme.orange.mainColor
    @AppStorage(PRO_COLOR_DARK_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proDarkColor: Color = Theme.orange.mainColor

    var body: some View {
        Form {
            // MARK: Theme
            NavigationLink {
                ThemeView()
            } label: {
                Label {
                    Text("Theme")
                } icon: {
                    Image(systemName: "squareshape.fill")
                }
                .foregroundColor(appTheme != .custom ? appTheme.mainColor : colorScheme == .dark ? proDarkColor : proLightColor)
            }

            // MARK: Dark Mode
            Label {
                Picker("Appearance", selection: $appAppearance) {
                    ForEach(AppearanceOptions.allCases, id: \.self) { option in
                        Text(option.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: appAppearance) { _ in
                    AppearanceController.shared.setAppearance()
                }
            } icon: {
                Image(systemName: "circle.righthalf.filled")
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                SettingView()
                    .navigationTitle("Setting")
            }
            .previewDevice("iPhone 13 Pro")
            
            NavigationView{
                SettingView()
                    .navigationTitle("Setting")
            }
            .previewDevice("iPhone 13 mini")
        }
    }
}
