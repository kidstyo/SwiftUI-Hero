//
//  SwiftUI_HeroApp.swift
//  Shared
//
//  Created by kidstyo on 2022/5/27.
//

import SwiftUI

@main
struct SwiftUI_HeroApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
