//
//  ContentView.swift
//  Concert_Finder
//
//  Created by Ghost on 2026/11/10.
//

import SwiftUI
import SwiftData

struct AttendedView: View {
    
    @Query(sort: \Show.date, order: .reverse)private var allShows: [Show]
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = AttendedViewModel()
    
    var body: some View {
        
        @Bindable var vm = viewModel
    
        NavigationStack{
            Group {
                if viewModel.filteredShows(allShows).isEmpty{
                    ContentUnavailableView("No Results", systemImage: "magnifyingglass")
                } else {
                    List{
                        ForEach(viewModel.filteredShows(allShows)){
                            show in
                            Text(show.artistName)
                        }
                        .onDelete{
                            indexSet in
                            let shows = viewModel.filteredShows(allShows)
                            
                            for index in indexSet {
                                viewModel.delete(shows[index], context: modelContext)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Attended")
            .toolbar{
                Button("Add Show!", systemImage: "plus") {
                    modelContext.insert(Show(artistName: "Yanni",
                                     venueName: "Maddison Square Garden",
                                     cityName: "New York",
                                     date: .now ,
                                     status: .attended))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AttendedView()
            .modelContainer(for: Show.self, inMemory: true)
    }
}
