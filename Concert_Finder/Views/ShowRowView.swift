//
//  ShowRowView.swift
//  Concert_Finder
//
//  Created by Ghost on 2026/11/12.
//

import SwiftUI
import SwiftData

struct ShowRowView: View {
    let show: Show

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(show.artistName)
                .font(.headline)
            
            HStack(spacing: 4){
                Text(show.venueName)
                Text("-")
                Text(show.cityName)
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)

    let container = try! ModelContainer(
        for: Show.self,
        configurations: config
    )

    let sample = Show(
        artistName: "Brandy",
        venueName: "FNB Stadium",
        cityName: "Johannesburg",
        date: .now,
        status: .attended
    )

    container.mainContext.insert(sample)

    return ShowRowView(show: sample)
        .modelContainer(container)
}
