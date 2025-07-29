//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Fatemeh ALIZADEH on 30/7/2025.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
