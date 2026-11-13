//
//  UpcomingView.swift
//  Concert_Finder
//
//  Created by Ghost on 2026/11/12.
//

import SwiftUI
import SwiftData

struct UpcomingView: View {
    
    @Query(sort: \Show.date) private var allShows: [Show]
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = UpcomingViewModel()
    
    var body: some View {
        @Bindable var vm = viewModel
        
        NavigationStack{
            Group{
                
            }
        }
    }
}

#Preview {
    UpcomingView()
}
