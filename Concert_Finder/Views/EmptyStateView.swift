//
//  EmptyStateView.swift
//  Concert_Finder
//
//  Created by Ghost on 2026/11/27.
//

import SwiftUI

struct EmptyStateView: View {
    let icon: String
    let title: String
    let message: String
    
    var body: some View {
        ContentUnavailableView(title, systemImage: icon, description: Text (message))
    }
}

#Preview {
    EmptyStateView()
}
