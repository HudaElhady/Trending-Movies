//
//  MovieDetailsView.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import UIKit

class MovieDetailsView: UIViewController {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    
   var presenter: MovieDetailsPresenterProtocol? {
        didSet {
            presenter?.view = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getMovieDetails()
    }
}

extension MovieDetailsView: MovieDetailsPresenterOutputProtocol {
    func updateDetails(_ presenter: MovieDetailsPresenterProtocol) {
        movieImageView.sd_setImage(with: URL(string: presenter.movieImageUrl)!)
        movieTitleLabel.text = presenter.movieTitle
        overviewLabel.text = presenter.overview
        releaseDateLabel.text = presenter.releaseDate
        taglineLabel.text = presenter.tagline
    }
}
