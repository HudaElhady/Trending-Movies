//
//  MovieDetailsPresenter.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import Foundation

class MovieDetailsPresenter {
    var interactor: MovieDetailsInteractorProtocol
    let router: MoviesDetailsRouterProtocol
    weak var view: MovieDetailsPresenterOutputProtocol?
    var movieDetails: MovieDetails?
    
    init(interactor: MovieDetailsInteractorProtocol, router: MoviesDetailsRouterProtocol) {
        self.router = router
        self.interactor = interactor
        self.interactor.presenter = self
    }
    
}

extension MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    var movieImageUrl: String {
        MoviesListAPIsConstants.imageBaseUrl + (movieDetails?.posterPath ?? "")
    }
    
    var movieTitle: String {
        movieDetails?.title ?? ""
    }
    
    var releaseDate: String {
        movieDetails?.releaseDate ?? ""
    }
    
    var overview: String {
        movieDetails?.overview ?? ""
    }
    
    var tagline: String? {
        movieDetails?.tagline
    }
    
    func getMovieDetails() {
        interactor.fetchMovieDetails()
    }
}

extension MovieDetailsPresenter: MovieDetailsInteractorOutputProtocol {
    func movieDetails(_ details: MovieDetails) {
        movieDetails = details
        view?.updateDetails(self)
    }
    
    func movieDetailsFailure(_ error: NetworkError) {
        guard let view = view else { return }
        router.showAlert(message: error.errorMessage, view: view)
    }
    
}
