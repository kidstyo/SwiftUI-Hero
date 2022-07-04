//
//  ThemeView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/3.
//  📝Version: 1⃣️
//

import SwiftUI
import WidgetKit

struct ThemeView: View {
    // 是否Pro
    @AppStorage(PRO_STORAGE_KEY) private var isPurchased: Bool = false

    // Theme
    @Environment(\.colorScheme) private var colorScheme

    @AppStorage(THEME_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var appTheme: Theme = .classic
    @AppStorage(PRO_COLOR_LIGHT_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proLightColor: Color = Theme.orange.mainColor
    @AppStorage(PRO_COLOR_DARK_STORAGE_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proDarkColor: Color = Theme.orange.mainColor

    let columns = [
        GridItem(.adaptive(minimum: 70))
    ]
    @State var showProView: Bool  = false

    var body: some View {
        List{
            Section {
                if colorScheme == .dark{
                    ColorPicker("Pro Color Dark", selection: $proDarkColor)
                        .foregroundColor(proDarkColor)
                }
                else{
                    ColorPicker("Pro Color Light", selection: $proLightColor)
                        .foregroundColor(proLightColor)
                }

                LazyVGrid(columns: columns, spacing: 20) {
                    VStack{
                        Text("Pro \(colorScheme == .dark ? "Dark" : "Light")")
                            .font(.system(.caption, design: .rounded))
                            .foregroundColor(ThemeManager.shared.currentProColor(colorScheme: colorScheme))
                            .lineLimit(1)

                        Spacer()

                        Image(systemName: appTheme == .custom ? "circle.fill" : "circle")
                            .font(.title3)
                            .foregroundColor(ThemeManager.shared.currentProColor(colorScheme: colorScheme))
                            .onTapGesture {
                                HapticManager.instance.impact()
                                // MARK: Pro 判定
                                if isPurchased{
                                    withAnimation{
                                        appTheme = Theme.custom
                                    }
                                }
                                else{
                                    showProView.toggle()
                                }
                            }
                    }

                    ForEach(Theme.allCases){ theme in
                        if theme != .custom{
                            VStack{
                                Text(theme.name)
                                    .font(.system(.caption, design: .rounded))
                                    .foregroundColor(theme.mainColor)
                                    .lineLimit(1)

                                Spacer()

                                Image(systemName: appTheme == theme ? "circle.fill" : "circle")
                                    .font(.title3)
                                    .foregroundColor(theme.mainColor)
                                    .onTapGesture {
                                        HapticManager.instance.impact()
                                        withAnimation {
                                            appTheme = theme
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding(.vertical)
                .sheet(isPresented: $showProView) {
                    ProView()
                }
                
            } header: {
                Text("主题色选择（只在本地保存）")
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Theme")
        .onChange(of: appTheme) { newValue in
            WidgetCenter.shared.reloadAllTimelines()
        }
        .onChange(of: proLightColor) { newValue in
            if appTheme == .custom{
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
        .onChange(of: proDarkColor) { newValue in
            if appTheme == .custom{
                WidgetCenter.shared.reloadAllTimelines()
            }
        }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ThemeView()
                .environmentObject(ViewManager())
        }
    }
}
