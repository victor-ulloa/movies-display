//
//  ListItem.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-27.
//

import SwiftUI

struct ListItem: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.headline)
            if let production = movie.production {
                Text("Studio: \(production)")
                    .font(.subheadline)
            }
            if let rating = movie.ratings?.first {
                Text("\(rating.source): \(rating.value)")
                    .font(.footnote)
            }
            Text((movie.year))
                .font(.footnote)
        }
    }
}

#Preview {
    ListItem(movie: Movie(
        title: "The Dark Knight",
        year: "2008",
        rated: "PG-13",
        released: "18 Jul 2008",
        runtime: "152 min",
        genre: "Action, Crime, Drama",
        director: "Christopher Nolan",
        writer: "Jonathan Nolan, Christopher Nolan, David S. Goyer",
        actors: "Christian Bale, Heath Ledger, Aaron Eckhart",
        plot: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
        language: "English, Mandarin",
        country: "United States, United Kingdom",
        awards: "Won 2 Oscars. 159 wins & 163 nominations total",
        poster: "https://m.media-amazon.com/images/M/MV5BNzA5ZDgyNTAtZmE3My00N2M3LTg1YjYtNjZkOWI1ZWRkMDQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg",
        ratings: [
            Rating(source: "Internet Movie Database", value: "9.0/10"),
            Rating(source: "Rotten Tomatoes", value: "94%"),
            Rating(source: "Metacritic", value: "84/100")
        ],
        metascore: "84",
        imdbRating: "9.0",
        imdbVotes: "2,404,784",
        imdbID: "tt0468569",
        type: "movie",
        dvd: "09 Dec 2008",
        boxOffice: "$535,234,033",
        production: "Warner Bros. Pictures, Legendary Entertainment, Syncopy",
        website: "N/A",
        response: "True"
    ))
}
