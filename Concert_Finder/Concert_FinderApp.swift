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
    
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                MainTabView()
            } else {
                OnboardingView()
            }
        }
        .modelContainer(for: Show.self)
    }
}
