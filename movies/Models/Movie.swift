//
//  Movie.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-27.
//

import Foundation

struct Movie: Codable, Identifiable {
    
    let id = UUID()
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
