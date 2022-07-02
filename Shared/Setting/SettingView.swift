//
//  SettingView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/2.
//

import SwiftUI

struct SettingView: View {
    @AppStorage(DARK_MODE_KEY) var appAppearance: AppearanceOptions = .system

    var body: some View {
        Form {
           Picker("Appearance", selection: $appAppearance) {
               // This is where CaseIterable comes into play, allowing us to loop over our AppearanceOptions enum
               ForEach(AppearanceOptions.allCases, id: \.self) { option in
                   Text(option.rawValue.capitalized)
               }
           }
           .pickerStyle(.inline)
           .onChange(of: appAppearance) { _ in
               AppearanceController.shared.setAppearance()
           }
       }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
