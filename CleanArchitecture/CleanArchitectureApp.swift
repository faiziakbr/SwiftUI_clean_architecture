//
//  CleanArchitectureApp.swift
//  CleanArchitecture
//
//  Created by Faizan Akbar on 03/03/2025.
//

import SwiftUI

@main
struct CleanArchitectureApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
