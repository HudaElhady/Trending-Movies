//
//  MovieDetailsInteractor.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import Foundation

class MovieDetailsInteractor {
    let movieDetailsRepo: MovieDetailsRepo
    let movieId: Int
    weak var presenter: MovieDetailsInteractorOutputProtocol?
    
    init(movieId: Int, movieDetailsRepo: MovieDetailsRepo = MovieDetailsRepoImpl()) {
        self.movieId = movieId
        self.movieDetailsRepo = movieDetailsRepo
    }
}

extension MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    func fetchMovieDetails() {
        movieDetailsRepo.getMovieDetails(movieId: movieId) { [weak self] result in
            switch result {
            case .success(let details):
                self?.presenter?.movieDetails(details)
            case .failure(let error):
                self?.presenter?.movieDetailsFailure(error)
            }
        }
    }
}
