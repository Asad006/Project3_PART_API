//
//  Poster.swift
//  MovieApp
//
//  Created by Asad mero on 2/9/23.
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
    
}
