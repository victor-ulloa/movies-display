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
    @Published var selectedMovie: Movie?
    
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
                    self?.fetchDetailsForMovies(movies: movies)
                } else {
                    self?.movies = []
                }
            }
        }
    }
    
    private func fetchDetailsForMovies(movies: [Movie]) {
        let group = DispatchGroup()
        var detailedMovies: [Movie] = []
        
        for movie in movies {
            group.enter()
            omdbService.fetchMovieDetails(imdbID: movie.imdbID) { movieDetails, error in
                if let movieDetails = movieDetails {
                    detailedMovies.append(movieDetails)
                } else {
                    detailedMovies.append(movie)
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.movies = detailedMovies
        }
    }
    
    func fetchMovieDetails(imdbID: String) {
        omdbService.fetchMovieDetails(imdbID: imdbID) { [weak self] movie, error in
            DispatchQueue.main.async {
                if let movie = movie {
                    self?.selectedMovie = movie
                }
            }
        }
    }
}
