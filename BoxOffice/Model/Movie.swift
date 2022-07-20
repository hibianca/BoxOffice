//
//  Movie.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 12/07/22.
//

import Foundation

struct Movie: Codable {
    let title: String
    let posterPath: String
    let backdropPath: String
    let voteAverage: Float
    let releaseDate: String
    let overview: String
    let genres: [String]?
}
