//
//  Movie.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 09/01/24.
//

import Foundation

struct Movie: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
