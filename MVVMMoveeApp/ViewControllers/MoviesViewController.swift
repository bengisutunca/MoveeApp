//
//  ViewController.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 21.12.2022.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var topRatedMoviesLabel: UILabel!
    @IBOutlet private weak var popularMoviesTitleLabel: UILabel!
    
    private var popularMoviesViewModel = PopularMoviesViewModel()
    private var topMoviesViewModel = TopMoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topRatedMoviesLoaded()
        popularMoviesLoaded()
        configPlaceHolders()
    }
    
    private func topRatedMoviesLoaded() {
        self.topMoviesViewModel.moviesLoaded = { [weak self] (_, success) in
            if success {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            } else {
                self?.showAlert(alertMessage: Localization.alertMessage)
            }
        }
    }
    
    private func popularMoviesLoaded() {
        self.popularMoviesViewModel.moviesLoaded = { [weak self] (_, success) in
            if success {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } else {
                self?.showAlert(alertMessage: Localization.alertMessage)
            }
        }
    }
    
    private func configPlaceHolders() {
        topRatedMoviesLabel.text = Localization.topRatedMoviesTitle
        popularMoviesTitleLabel.text = Localization.popularMoviesTitle
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.popularMoviesViewModel.numberOrRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PopularMoviesTableViewCell, let movieData = self.popularMoviesViewModel.getMovie (index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setMovieData(movieData: movieData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = popularMoviesViewModel.moviesList[indexPath.row]
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        controller.viewModel.movie = movie
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.topMoviesViewModel.numberOrRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? TopRatedMoviesViewCell, let movieData = self.topMoviesViewModel.getMovie (index: indexPath.item) else {
            return UICollectionViewCell()
        }
        cell.setMovieDataa(movieData: movieData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = topMoviesViewModel.moviesList[indexPath.row]
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        controller.viewModel.movie = movie
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
