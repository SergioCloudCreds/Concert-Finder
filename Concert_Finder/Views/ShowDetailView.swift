//
//  ShowDetailView.swift
//  Concert_Finder
//
//  Created by Ghost on 2026/11/27.
//

import SwiftUI

struct ShowDetailView: View {
    
    @Bindable var show: Show
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var showingEditSheet = false
    @State private var showingDeleteAlert = false
    @State private var newSetlistEntry = ""
    
    var body: some View {
        
        List{
            Section("Show Info"){
                LabeledContent("Artist", value: show.artistName)
                LabeledContent("Venue", value: show.venueName)
                LabeledContent("City", value: show.cityName)
                LabeledContent("Date", value: show.date.formatted(date: .long, time: .omitted))
                LabeledContent("Status", value: show.status.rawValue.capitalized)
            }
        }
        
    }
}

#Preview {
    ShowDetailView(show: Show(artistName: "Example Band", venueName: "example venue", cityName: "Example city", date: Date(), status: .attended))
}
