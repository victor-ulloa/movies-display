//
//  MoviesResponse.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-27.
//

import Foundation

struct MovieResponse: Codable {
    let search: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
