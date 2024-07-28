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
        NavigationView {
            List(viewModel.movies) { movie in
                ListItem(movie: movie)
                    .onTapGesture {
                        viewModel.fetchMovieDetails(imdbID: movie.imdbID)
                    }
            }
            .navigationTitle("Movies")
            .searchable(text: $viewModel.searchTerm)
            .sheet(item: $viewModel.selectedMovie) { movie in
                MovieDetailView(movie: movie)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    ContentView()
}
