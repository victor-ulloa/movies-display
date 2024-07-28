//
//  ViewModel.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-27.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchTerm: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let omdbService = NetworkManager()
    
    init() {
        $searchTerm
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] searchTerm in
                self?.fetchMovies(searchTerm: searchTerm)
            }
            .store(in: &cancellables)
    }
    
    func fetchMovies(searchTerm: String) {
        guard !searchTerm.isEmpty else {
            self.movies = []
            return
        }
        
        omdbService.fetchMovies(searchTerm: searchTerm) { [weak self] movies, error in
            DispatchQueue.main.async {
                if let movies = movies {
                    self?.movies = movies
                } else {
                    self?.movies = []
                }
            }
        }
    }
}
