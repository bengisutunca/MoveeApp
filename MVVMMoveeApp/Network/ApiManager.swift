//
//  ApiManager.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 20.12.2022.
//

import Foundation

class ApiManager {
    
    public static let shared = ApiManager()
    
    let apiService: ApiService
    
    init(apiService: ApiService = ApiService()) {
        self.apiService =  apiService
    }
    
    func movieList(completion: @escaping (Result<MovieResultResponseModel, APIError>) -> Void) {
        apiService.loadData(from: ApiEndpoints.getPopularMoviesList()) { (result: Result<MovieResultResponseModel, APIError>) in
            switch result {
                case .success(let data):
                completion(.success(data))
                case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func movieDetails(id: Int, completion: @escaping (Result<MovieDetailResponseModel, APIError>) -> Void) {
            apiService.loadData(from: ApiEndpoints.getMovie(id: id)) { (result: Result<MovieDetailResponseModel, APIError>) in
            switch result {
                case .success(let data):
                completion(.success(data))
                case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func topRatedMovieList(completion: @escaping (Result<MovieResultResponseModel, APIError>) -> Void) {
        apiService.loadData(from: ApiEndpoints.getTopRankedMoviesList()) { (result: Result<MovieResultResponseModel, APIError>) in
            switch result {
                case .success(let data):
                completion(.success(data))
                case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
