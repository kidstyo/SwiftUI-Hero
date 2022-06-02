//
//  ShortcutView.swift
//  SwiftUI-Hero
//
//  Created by kidstyo on 2022/5/30.
//

import SwiftUI

struct ShortcutView: View {
    var body: some View {
        PeopleListView()
    }
}

struct ShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ShortcutView()
        }
    }
}
