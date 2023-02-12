//
//  Movie.swift
//  MovieApp
//
//  Created by Asad mero on 2/2/23.
//


import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}
struct Movie: Decodable{
    let original_title: String
    let overview: String
    let poster_path: URL
    
    
    
    // Detail properties
    let popularity: Double
    let vote_average: Double
    let release_date: Date
    let vote_count: Int
    
}
/*
extension Movie {

    /// An array of mock tracks
    static var mockMovies: [Movie]  = [Movie(movieName: "The Godfather", description: "The Godfather is a 1972 American crime film directed by Francis Ford Coppola, who co-wrote the screenplay with Mario Puzo, based on Puzo's best-selling 1969 novel of the same title. The film stars Marlon Brando, Al Pacino, James Caan, Richard Castellano, Robert Duvall, Sterling Hayden, John Marley, Richard Conte, and Diane Keaton. It is the first installment in The Godfather trilogy, chronicling the Corleone family under patriarch Vito Corleone (Brando) from 1945 to 1955. It focuses on the transformation of his youngest son, Michael Corleone (Pacino), from reluctant family outsider to ruthless mafia boss. ", artworkUrl100:URL(string: "https://www.themoviedb.org/t/p/original/3Tf8vXykYhzHdT0BtsYTp570JGQ.jpg")!, popularity: "POPULARITY: 61", rating: "IMDb RATING:9.2/10", releaseDate: "Release Date: 1972"),
                                    
                                       Movie(movieName: "Forrest Gump", description: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.", artworkUrl100:URL(string: "https://www.themoviedb.org/t/p/original/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg")!, popularity: "POPULARITY: 164", rating: "IMDb RATING: 8.8/10", releaseDate: "Release Date: 1994"),
                                       Movie(movieName: "Inception", description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.", artworkUrl100:URL(string: "https://www.themoviedb.org/t/p/original/8IB2e4r4oVhHnANbnm7O3Tj6tF8.jpg")!, popularity: "POPULARITY: 121", rating: "IMDb RATING: 8.8/10", releaseDate: "Release Date: 2010"),
                                       Movie(movieName: "WALL·E", description: "In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.", artworkUrl100:URL(string: "https://www.themoviedb.org/t/p/original/2Wjn5vxvJmomJQkLuUwyX2hBaif.jpg")!, popularity: "POPULARITY: 971", rating: "IMDb RATING: 8.4/10", releaseDate: "Release Date: 2008"),
                                       Movie(movieName: "John Wick: Chapter 4", description: "John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.", artworkUrl100:URL(string: "https://www.themoviedb.org/t/p/original/rAvgE4ms5eBJAz15Elk9t6MJzyU.jpg")!, popularity: "POPULARITY: 131", rating: "IMDb RATING: ./10", releaseDate: "Release Date: March 24, 2023")]
        }*/
