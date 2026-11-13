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
                            
                            NavigationLink(value: show){
                                ShowRowView(show: show)
                            }
                            
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
            .searchable(text: $vm.searchText, prompt: "Artists, Venues, Cities")
            .navigationDestination(for: Show.self) { show in
                //ShowDetailView
            }
            .toolbar{
                Button("Add Show!", systemImage: "plus") {
                    viewModel.showingAddSheet = true
                }
            }
            .sheet(isPresented: $vm.showingAddSheet) {
                AddEditShowView()
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
