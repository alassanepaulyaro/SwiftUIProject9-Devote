//
//  Persistence.swift
//  SwiftUIProject9-Devote
//
//  Created by Yaro Paul  on 18/12/2024.
//

import CoreData

struct PersistenceController {
    // persistent controler
    static let shared = PersistenceController()

    // persitent container
    let container: NSPersistentContainer

    // initialization (load the persitant store)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "SwiftUIProject9_Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    
    // preview
    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
