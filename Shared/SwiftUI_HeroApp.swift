//
//  SwiftUI_HeroApp.swift
//  Shared
//
//  Created by kidstyo on 2022/5/27.
//

import SwiftUI
import Intents

@main
struct SwiftUI_HeroApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }

    // This class lets us respond to intents in an iOS14 SwiftUI app
    class AppDelegate: UIResponder, UIApplicationDelegate {
        func application(_ application: UIApplication, handlerFor intent: INIntent) -> Any? {

            switch intent {
                // Call the appropriate intent handler
                case is GetPeopleIntent:
                    return GetPeopleIntentHandler()
//                case is ViewPersonIntent:
//                    return ViewPersonIntentHandler()

                default:
                    return nil
            }
        }
    }
}
