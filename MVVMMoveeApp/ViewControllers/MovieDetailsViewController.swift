//
//  MovieDetailsViewController.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 21.12.2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet private weak var moviePosterImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var moviePosterBackDropView: UIImageView!
    @IBOutlet private weak var movieOverviewLabel: UILabel!
    @IBOutlet private weak var relaseDateLabel: UILabel!
    @IBOutlet private weak var movieRuntimeLabel: UILabel!
    @IBOutlet private weak var movieRatingLabel: UILabel!
    @IBOutlet private weak var runtimePlaceHolder: UILabel!
    @IBOutlet private weak var genrePlaceHolder: UILabel!
    @IBOutlet private weak var movieGenreLabel: UILabel!
    
    let viewModel = MovieDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configPlaceHolders()
        movieDetailsLoaded()
        viewModel.callDetail()
    }
    
    private func movieDetailsLoaded() {
        self.view.activityStartAnimating(activityColor: UIColor.black, backgroundColor: UIColor.systemBackground)
        self.viewModel.moviesLoaded = { [weak self] (_, success) in
            if success {
                DispatchQueue.main.async {
                    self?.configureUI()
                    self?.view.activityStopAnimating()
                }
            } else {
                self?.showAlert(alertMessage: Localization.alertMessage)
            }
        }
    }
    
    private func configureUI() {
        movieTitleLabel?.text = viewModel.movieDetails?.title
        moviePosterImageView.showImage(with: BaseURLs.getMoviePoster() + "\(viewModel.movieDetails?.posterPath ?? "")")
        moviePosterBackDropView?.showImage(with: BaseURLs.getMoviePoster() + "\(viewModel.movieDetails?.backdropPath ?? "")")
        moviePosterBackDropView.addOverlay()
        movieOverviewLabel?.text = viewModel.movieDetails?.overview
        relaseDateLabel?.text = "\(Localization.relaseDate) \(viewModel.movieDetails?.relaseDate?.toDate(releaseDate: viewModel.movieDetails?.relaseDate ?? "") ?? "")"
        movieRuntimeLabel.text = viewModel.movieDetails?.runtime.debugDescription.toRuntime(runtime: viewModel.movieDetails?.runtime ?? 0)
        movieRatingLabel.text = "\( String(describing: viewModel.movie?.voteAverage ?? 0.0)) / 10  ???"
        title = viewModel.movieDetails?.title
        if let genres = viewModel.movieDetails?.genres, genres.count > 0 {
            var genreString: String = ""
            for genre in genres {
                genreString = genre.name ?? ""
                movieGenreLabel.text = genreString
            }
        }
    }
    
    private func configPlaceHolders() {
        runtimePlaceHolder.text = Localization.runtime
        genrePlaceHolder.text = Localization.genre
    }
}
