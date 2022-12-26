//
//  MovieDetailResponseModel.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 20.12.2022.
//

import Foundation

struct MovieDetailResponseModel: Codable {
    let id: Int
    let overview: String?
    let title: String?
    let runtime: Int?
    let posterPath: String?
    let relaseDate: String?
    let backdropPath: String?
    let voteAverage: Double?
    let genres: [GenreResponseModel]?
        
    enum CodingKeys: String, CodingKey {
        case id, overview, title, runtime, genres
        case posterPath = "poster_path"
        case relaseDate = "release_date"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
    }
}
