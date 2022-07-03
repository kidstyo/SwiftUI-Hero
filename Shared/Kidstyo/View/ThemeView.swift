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
    @AppStorage(THEME_KEY, store: UserDefaults(suiteName: GROUP_ID)) var appTheme: Theme = .classic

    @AppStorage(PRO_COLOR_KEY, store: UserDefaults(suiteName: GROUP_ID)) var proColor: Color = Theme.orange.mainColor

    let columns = [
        GridItem(.adaptive(minimum: 70))
    ]

    var body: some View {
        List{
            Section {
                ColorPicker("Pro Color Setting", selection: $proColor)
                    .foregroundColor(proColor)

                LazyVGrid(columns: columns, spacing: 20) {
                    VStack{
                        Text("Pro Color")
                            .font(.system(.footnote, design: .rounded))
                            .foregroundColor(proColor)
                            .lineLimit(1)

                        Spacer()

                        Image(systemName: appTheme == .custom ? "circle.fill" : "circle")
                            .font(.title)
                            .foregroundColor(proColor)
                            .onTapGesture {
                                HapticManager.instance.impact()
                                withAnimation {
                                    appTheme = Theme.custom
                                }
                            }
                    }

                    ForEach(Theme.allCases){ theme in
                        if theme != .custom{
                            VStack{
                                Text(theme.name)
                                    .font(.system(.footnote, design: .rounded))
                                    .foregroundColor(theme.mainColor)
                                    .lineLimit(1)

                                Spacer()

                                Image(systemName: appTheme == theme ? "circle.fill" : "circle")
                                    .font(.title)
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
            } header: {
                Text("主题色选择（只在本地保存）")
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Theme")
        .onChange(of: appTheme) { newValue in
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ThemeView()
        }
    }
}
