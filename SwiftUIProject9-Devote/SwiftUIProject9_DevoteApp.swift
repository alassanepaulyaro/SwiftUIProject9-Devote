//
//  SwiftUIProject9_DevoteApp.swift
//  SwiftUIProject9-Devote
//
//  Created by Yaro Paul  on 18/12/2024.
//

import SwiftUI

@main
struct SwiftUIProject9_DevoteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
