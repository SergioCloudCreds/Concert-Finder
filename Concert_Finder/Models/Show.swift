//
//  Show.swift
//  Concert_Finder
//
//  Created by Ghost on 2026/11/11.
//

import Foundation
import SwiftData
import SwiftUI

enum ShowStatus : String, Codable, CaseIterable{
    case attended
    case upcoming
    case missed
}

@Model
final class Show{
    
    var artistName : String
    var venueName : String
    var cityName : String
    var date : Date
    var status : ShowStatus
 
    var rating : Int?
    var notes : String?
    var setlist : [String]
    var createdAt: Date
    
    init(artistName: String, venueName: String, cityName: String, date: Date, status: ShowStatus) {
        self.artistName = artistName
        self.venueName = venueName
        self.cityName = cityName
        self.date = date
        self.status = status
        self.rating = nil
        self.notes = nil
        self.setlist = []
        self.createdAt = .now
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)

    let container = try! ModelContainer(for: Show.self,configurations: config)

    let sample = Show(
        artistName: "Sting",
        venueName: "Sunbet Arena",
        cityName: "Pretoria",
        date: .now,
        status: .attended
    )

    container.mainContext.insert(sample)

    return Text(sample.artistName)
        .modelContainer(container)
}
