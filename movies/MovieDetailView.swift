//
//  MovieDetailView.swift
//  movies
//
//  Created by Victor Ulloa on 2024-07-27.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text(movie.title)
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                if let posterURL = URL(string: movie.poster) {
                    AsyncImage(url: posterURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(maxWidth: .infinity)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .padding(.bottom, 10)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        HStack {
                            Text("Year:")
                                .font(.headline)
                            Spacer()
                            Text(movie.year)
                        }
                        Divider()
                        HStack {
                            Text("Rated:")
                                .font(.headline)
                            Spacer()
                            Text(movie.rated ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Released:")
                                .font(.headline)
                            Spacer()
                            Text(movie.released ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Runtime:")
                                .font(.headline)
                            Spacer()
                            Text(movie.runtime ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Genre:")
                                .font(.headline)
                            Spacer()
                            Text(movie.genre ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Director:")
                                .font(.headline)
                            Spacer()
                            Text(movie.director ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Writer:")
                                .font(.headline)
                            Spacer()
                            Text(movie.writer ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Actors:")
                                .font(.headline)
                            Spacer()
                            Text(movie.actors ?? "N/A")
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Plot:")
                            .font(.headline)
                        Text(movie.plot ?? "N/A")
                    }
                    
                    Divider()
                    
                    Group {
                        HStack {
                            Text("Language:")
                                .font(.headline)
                            Spacer()
                            Text(movie.language ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Country:")
                                .font(.headline)
                            Spacer()
                            Text(movie.country ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Awards:")
                                .font(.headline)
                            Spacer()
                            Text(movie.awards ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Production:")
                                .font(.headline)
                            Spacer()
                            Text(movie.production ?? "N/A")
                        }
                    }
                    
                    Divider()
                    
                    if let ratings = movie.ratings {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Ratings:")
                                .font(.headline)
                            ForEach(ratings, id: \.source) { rating in
                                HStack {
                                    Text("\(rating.source):")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(rating.value)
                                }
                                .padding(.vertical, 2)
                            }
                        }
                    }
                    
                    Divider()
                    
                    Group {
                        HStack {
                            Text("Metascore:")
                                .font(.headline)
                            Spacer()
                            Text(movie.metascore ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("IMDB Rating:")
                                .font(.headline)
                            Spacer()
                            Text(movie.imdbRating ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("IMDB Votes:")
                                .font(.headline)
                            Spacer()
                            Text(movie.imdbVotes ?? "N/A")
                        }
                    }
                    
                    Divider()
                    
                    Group {
                        HStack {
                            Text("DVD:")
                                .font(.headline)
                            Spacer()
                            Text(movie.dvd ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Box Office:")
                                .font(.headline)
                            Spacer()
                            Text(movie.boxOffice ?? "N/A")
                        }
                        Divider()
                        HStack {
                            Text("Website:")
                                .font(.headline)
                            Spacer()
                            Text(movie.website ?? "N/A")
                        }
                    }
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    MovieDetailView(movie: Movie(
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
