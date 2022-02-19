//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Сергей Иванчихин on 19.02.2022.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
