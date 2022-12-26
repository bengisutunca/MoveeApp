//
//  GenreResponseModel.swift
//  MVVMMoveeApp
//
//  Created by Bengi Tunca on 26.12.2022.
//

import Foundation

struct GenreResponseModel: Codable {
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
