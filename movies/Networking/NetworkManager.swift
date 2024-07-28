//
//  NetworkManager.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-27.
//

import Foundation

final class NetworkManager {
    private let apiKey = "e779b65c"
    private let baseURL = "http://www.omdbapi.com/"
    
    func fetchMovies(searchTerm: String, completion: @escaping ([Movie]?, Error?) -> Void) {
        guard let url = URL(string: "\(baseURL)?apikey=\(apiKey)&s=\(searchTerm)") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "Data Error", code: 0, userInfo: nil))
                return
            }
            
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(movieResponse.search, nil)
            } catch let jsonError {
                completion(nil, jsonError)
            }
        }.resume()
    }
}
