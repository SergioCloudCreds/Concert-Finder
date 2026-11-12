//
//  Concert_FinderApp.swift
//  Concert_Finder
//
//  Created by Ghost on 2026/11/10.
//

import SwiftUI
import SwiftData

@main
struct Concert_FinderApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: Show.self)
    }
}
