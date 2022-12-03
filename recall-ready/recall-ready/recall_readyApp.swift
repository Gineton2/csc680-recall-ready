//  CSC 680
//  recall_readyApp.swift
//  recall-ready
//
//  Created by Gineton Alencar II on 12/2/22.
//

import SwiftUI

@main
struct recall_readyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
