//
//  ProView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/7/4.
//

import SwiftUI

struct ProView: View {
    @AppStorage(PRO_STORAGE_KEY) private var isPurchased: Bool = false

    var body: some View {
        Button {
            isPurchased = true
        } label: {
            Text("\(isPurchased ? "Pro" : "Normal")")
        }
    }
}

struct ProView_Previews: PreviewProvider {
    static var previews: some View {
        ProView()
    }
}
