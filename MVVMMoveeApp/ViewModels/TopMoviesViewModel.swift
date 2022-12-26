//
//  TopMoviesViewModel.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 24.12.2022.
//

import Foundation

class TopMoviesViewModel: BaseViewModel {
    
    var moviesLoaded: (([MovieResponseModel]?, Bool) -> Void)?
    var moviesList: [MovieResponseModel] = []
    var dataSource: MovieResponseModel?
    
    override func callService() {
        ApiManager().topRatedMovieList(completion: { [self] result in
            switch result {
            case .success(let movie):
                self.moviesList = movie.results
                self.handleResponse(response: moviesList, success: true)
            case .failure(let error):
                print(error)
                self.handleResponse(response: nil, success: false)
            }
        })
    }

    private func handleResponse(response: [MovieResponseModel]?, success: Bool) {
        if let moviesLoaded = moviesLoaded {
            moviesLoaded(response, success)
        }
    }
    
    func numberOrRows() -> Int {
        return self.moviesList.count
    }

    func getMovie(index: Int) -> MovieResponseModel? {
        return self.moviesList[index]
    }

}
