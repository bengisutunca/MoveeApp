//
//  MovieDetailViewModel.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 24.12.2022.
//


import Foundation

class MovieDetailViewModel: BaseViewModel {
    
    var movie: MovieResponseModel?
    var movieDetails: MovieDetailResponseModel?
    var moviesLoaded: ((MovieDetailResponseModel?, Bool) -> Void)?
    
    override func callDetail() {
        if let movie = movie {
            ApiManager().movieDetails(id: movie.id, completion: { [weak self] result in
                switch result {
                case .success(let movie):
                    self?.movieDetails = movie
                    self?.handleResponse(response: movie, success: true)
                case .failure(let error):
                    self?.handleResponse(response: nil, success: false)
                    print(error)
                }
            })
        }
    }
    
    private func handleResponse(response: MovieDetailResponseModel?, success: Bool) {
        if let moviesLoaded = moviesLoaded {
            moviesLoaded(response, success)
        }
    }
}
