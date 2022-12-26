//
//  MovieResponseModel.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 20.12.2022.
//

import Foundation

struct MovieResponseModel: Codable {
    let id: Int
    let posterPath: String?
    let voteAverage: Double?
    let releaseDate: String?
    let title: String?
    let results: [MovieResponseModel]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case title
        case results
    }
}
