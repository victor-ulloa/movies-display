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
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        Text("Year: \(movie.year)")
                            .font(.subheadline)
                        Text("Type: \(movie.type)")
                            .font(.subheadline)
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
