//
//  ApiEndpoints.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 20.12.2022.
//

import Foundation

struct ApiEndpoints {
    var path: String
    var queryItemAPIKey: [URLQueryItem]
    var queryItemLanguage: [URLQueryItem]
}

extension ApiEndpoints {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3" + path
        components.queryItems = queryItemAPIKey + queryItemLanguage
        
        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }
        return url
    }
}

extension ApiEndpoints {
    static func getKeyQueryItem() -> URLQueryItem {
        return URLQueryItem(name: "api_key", value: "af0b607e98d432a662ed7a1af160f51b")
    }
    static func getLanguageQueryItem() -> URLQueryItem {
        return URLQueryItem(name: "language", value: Localization.language)
    }
    
    static func getPopularMoviesList() -> URL {
        ApiEndpoints(path: "/movie/popular", queryItemAPIKey: [ApiEndpoints.getKeyQueryItem()], queryItemLanguage: [ApiEndpoints.getLanguageQueryItem()]).url
    }
    
    static func getTopRankedMoviesList() -> URL {
        ApiEndpoints(path: "/movie/top_rated", queryItemAPIKey: [ApiEndpoints.getKeyQueryItem()], queryItemLanguage: [ApiEndpoints.getLanguageQueryItem()]).url
    }
    
    static func getMovie(id: Int) -> URL {
        ApiEndpoints(path: "/movie/\(id))", queryItemAPIKey: [ApiEndpoints.getKeyQueryItem()], queryItemLanguage: [ApiEndpoints.getLanguageQueryItem()]).url
    }
}
