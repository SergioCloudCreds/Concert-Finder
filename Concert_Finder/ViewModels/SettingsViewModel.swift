//
//  SettingsViewModel.swift
//  Concert_Finder
//
//  Created by Ghost on 2026/11/27.
//

import SwiftData
import UserNotifications
import Foundation

@Observable
final class SettingsViewModel {
    var notificationsEnabled = false
    
    func attendedCount(_ shows: [Show]) -> Int {
        shows.filter { $0.status == .attended }.count
    }
    
    func upcomingCount(_ shows: [Show]) -> Int {
        shows.filter { $0.status == .upcoming }.count
    }
    
    func seenThisYear(_ shows: [Show]) -> Int {
        let year = Calendar.current.component(.year, from: .now)
        return shows.filter { $0.status == .attended && Calendar.current.component(.year, from: $0.date) == year}.count
    }
    
    func topArtists(_ shows: [Show]) -> String? {
        let attended = shows.filter { $0.status == .attended }
        let counts = Dictionary(grouping: attended, by: \.artistName)
            .mapValues(\.count)
        return counts.max { $0.value < $1.value }?.key
    }
    
    func exportText(_ shows: [Show]) -> String {
        let attended = shows
            .filter { $0.status == .attended }
            .sorted { $0.date > $1.date }
        guard !attended.isEmpty else { return "No Shows Logged!"}
        
        let lines = attended.map { show in
            let date = show.date.formatted(.dateTime.day().month().year())
            return "\(date) - \(show.artistName) at \(show.venueName), \(show.cityName)"
        }
        return "My Concert Finder History\n\n" + lines.joined(separator: "\n")
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound, .badge]) {
            granted, _ in
            
            DispatchQueue.main.async {
                self.notificationsEnabled = granted
            }
        }
    }
    
    func checkNotificationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.notificationsEnabled = settings.authorizationStatus == .authorized
            }
        }
    }
}
