//
//  MovieResultResponseModel.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 20.12.2022.
//

import Foundation

struct MovieResultResponseModel: Codable {
    let page: Int?
    let totalResults: Int?
    let totalPages: Int?
    let results: [MovieResponseModel]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
