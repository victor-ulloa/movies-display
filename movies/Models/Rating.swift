//
//  Rating.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-27.
//

import Foundation

struct Rating: Codable {
    let source: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
