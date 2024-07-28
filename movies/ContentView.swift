//
//  ContentView.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-27.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                NavigationLink {
                    MovieDetailView(movie: movie)
                } label: {
                    ListItem(movie: movie)
                }
            }
            .navigationTitle("Movies")
            .searchable(text: $viewModel.searchTerm)
        }
    }
}

#Preview {
    ContentView()
}
