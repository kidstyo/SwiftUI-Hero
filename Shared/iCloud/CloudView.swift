//
//  ContentView.swift
//  Shared
//
//  Created by kidstyo on 2022/5/27.
//

import SwiftUI
import CoreData

extension Item{
    static func getListItemFetchRequest() -> NSFetchRequest<Item>{
        let request = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)]
        return request
    }
}

struct CloudView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)

    private var items: FetchedResults<Item>

    @State private var syncStateStr = ""
    @State private var importing = false
    @State private var publisher = NotificationCenter.default.publisher(for: NSPersistentCloudKitContainer.eventChangedNotification)
    
    var body: some View {
        VStack{
            Text("syncState:\(syncStateStr)")
            if importing {
                ProgressView()
            }
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
    #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
    #endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .onReceive(publisher){ notification in
                if let userInfo = notification.userInfo {
                    if let event = userInfo["event"] as? NSPersistentCloudKitContainer.Event {
                        if event.type == .import {
                            importing = true
                            syncStateStr = "import"
                        }
                        else {
                            importing = false
                            if event.type == .export{
                                syncStateStr = "export"
                            }
                            else if event.type == .setup{
                                syncStateStr = "setup"
                            }
                            else{
                                syncStateStr = "default"
                            }
                        }
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct CloudView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CloudView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
