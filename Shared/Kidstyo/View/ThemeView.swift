//
//  ThemeView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/3.
//  📝Version: 1⃣️
//

import SwiftUI

struct ThemeView: View {
    @AppStorage(THEME_KEY) var appTheme: Theme = .classic

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(Theme.allCases){ theme in
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
                                appTheme = theme
                            }
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Theme")
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ThemeView()
        }
    }
}
