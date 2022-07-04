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
    @State var personToShow: Person? = nil // The person we'll pass in to our detail view
    @State var note: String = "" // The note we'll pass into our detail view
    
    let persistenceController = PersistenceController.shared
    @StateObject var viewManager = ViewManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(viewManager)
                .sheet(item: $personToShow) { person in
                    NavigationView {
                        PersonDetailView(person: person, note: $note)
                    }
                }
                .onContinueUserActivity("kidstyo.SwiftUI-Hero.viewPerson") { userActivity in
                    if let intent = userActivity.interaction?.intent as? ViewPersonIntent,
                       let person = peopleArray.filter({ $0.name == intent.person?.displayString ?? "" }).first {
                        note = intent.note ?? ""
                        personToShow = person
                    }
                }
                .task {
                    AppearanceController.shared.setAppearance()
                }
                .sheet(isPresented: $viewManager.testSheet) {
                    ProView()
                }
        }
    }

    // This class lets us respond to intents in an iOS14 SwiftUI app
    class AppDelegate: UIResponder, UIApplicationDelegate {
        func application(_ application: UIApplication, handlerFor intent: INIntent) -> Any? {

            switch intent {
                // Call the appropriate intent handler
                case is GetPeopleIntent:
                    return GetPeopleIntentHandler()
                case is ViewPersonIntent:
                    return ViewPersonIntentHandler()

                default:
                    return nil
            }
        }
    }
}
