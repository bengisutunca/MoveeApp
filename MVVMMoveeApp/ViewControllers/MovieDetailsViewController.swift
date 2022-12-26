//
//  MovieDetailsViewController.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 21.12.2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterBackDropView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var relaseDateLabel: UILabel!
    @IBOutlet weak var movieRuntimeLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var runtimePlaceHolder: UILabel!
    @IBOutlet weak var genrePlaceHolder: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    
    let viewModel = MovieDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configPlaceHolders()
        movieDetailsLoaded()
        viewModel.callDetail()
    }
    
    func movieDetailsLoaded() {
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
    
    func configureUI() {
        movieTitleLabel?.text = viewModel.movieDetails?.title
        moviePosterImageView.showImage(with: BaseURLs.getMoviePoster() + "\(viewModel.movieDetails?.posterPath ?? "")")
        moviePosterBackDropView?.showImage(with: BaseURLs.getMoviePoster() + "\(viewModel.movieDetails?.backdropPath ?? "")")
        moviePosterBackDropView.addOverlay()
        movieOverviewLabel?.text = viewModel.movieDetails?.overview
        relaseDateLabel?.text = "\(Localization.relaseDate) \(viewModel.movieDetails?.relaseDate?.toDate(releaseDate: viewModel.movieDetails?.relaseDate ?? "") ?? "")"
        movieRuntimeLabel.text = viewModel.movieDetails?.runtime.debugDescription.toRuntime(runtime: viewModel.movieDetails?.runtime ?? 0)
        movieRatingLabel.text = "\( String(describing: viewModel.movie?.voteAverage ?? 0.0)) / 10  ⭐"
        title = viewModel.movieDetails?.title
        if let genres = viewModel.movieDetails?.genres, genres.count > 0 {
            var genreString: String = ""
            for genre in genres {
                genreString = genre.name ?? ""
                movieGenreLabel.text = genreString
            }
        }
    }
    
    func configPlaceHolders() {
        runtimePlaceHolder.text = Localization.runtime
        genrePlaceHolder.text = Localization.genre
    }

}

