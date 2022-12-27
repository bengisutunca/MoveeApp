//
//  TopRatedMoviesViewCell.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 21.12.2022.
//

import UIKit

final class TopRatedMoviesViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var moviePosterImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        makeRoundedCell()
        moviePosterImageView.addOverlay()
    }
    
    func setTopRatedMoviesData(movieData: MovieResponseModel) {
        moviePosterImageView.showImage(with: BaseURLs.getMoviePoster() + "\(movieData.posterPath ?? "")")
        movieTitleLabel.text = movieData.title
        movieRatingLabel.text = "⭐ \( String(describing: movieData.voteAverage ?? 0.0)) / 10"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        moviePosterImageView.image = nil
    }
}
