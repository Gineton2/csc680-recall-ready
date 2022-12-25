//
//  RecallApp.swift
//  Recall
//
//  Created by BOBBY ROOTS on 12/20/22.
//

import SwiftUI

@main
struct RecallApp: App {
    @StateObject var locationService = LocationService()
    var body: some Scene {
        WindowGroup {
//            FirstView()
//                .environmentObject(locationService)
            ContentView()
        }
    }
}
