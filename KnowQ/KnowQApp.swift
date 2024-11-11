//
//  KnowQApp.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 11/11/24.
//

import SwiftUI

@main
struct KnowQApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
