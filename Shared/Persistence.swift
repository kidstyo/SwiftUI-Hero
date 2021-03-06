//
//  Persistence.swift
//  Shared
//
//  Created by kidstyo on 2022/5/27.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "SwiftUI_Hero")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        // MARK pos notie
        guard let description = container.persistentStoreDescriptions.first else{
            fatalError("No Descriptions found")
        }
        description.setOption(true as NSObject, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true

        // MARK what
        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy

//        CloudManager.instance.addObserver()
    }
}

class CloudManager{
    static let instance = CloudManager()

    func addObserver(){
        print("DEBUG addObserver")
        NotificationCenter.default.addObserver(self, selector: #selector(self.processUpdate), name: .NSPersistentStoreRemoteChange, object: nil)
    }

    @objc func processUpdate(notioncation: NSNotification){
        operationQueue.addOperation {
            // process notification
            print("DEBUG processUpdate")
            // get our context

            // get list items out of store
        }
    }

    lazy var operationQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

//    func save(){
//        do{
//            try context.save()
//
//            // MARK ???????????????
////            WidgetCenter.shared.reloadAllTimelines()
//
////            if managedObjectContext.hasChanges {
////                    do {
////                        try managedObjectContext.save()
////                        WidgetCenter.shared.reloadAllTimelines()
////                    } catch let error {
////                        print("Error Save Oppty: \(error.localizedDescription)")
////                    }
////
////                }
//
//            print("DEBUG Success save.")
//        }catch let error{
//            print("DEBUG Error saving. \(error.localizedDescription)")
//        }
//    }
}
