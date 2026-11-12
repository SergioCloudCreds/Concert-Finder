//
//  MainTabView.swift
//  Concert_Finder
//
//  Created by Ghost on 2026/11/12.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {

            AttendedView()
                .tabItem {
                    Label("Attended", systemImage: "music.mic")
                }

            UpcomingView()
                .tabItem {
                    Label("Upcoming", systemImage: "calendar")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
