//
//  MoviesListPresenter.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import Foundation

class MoviesListPresenter {
    var interactor: MoviesListInteractorProtocol
    weak var view: MoviesListPresenterOutputProtocol?
    let router: MoviesListRouterProtocol
    var moviesList = [Movie]()
    
    
    init(interactor: MoviesListInteractorProtocol, router: MoviesListRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.interactor.presenter = self
    }
    
}

extension MoviesListPresenter: MoviesListPresenterProtocol {
    var moviesCount: Int {
        return moviesList.count
    }
    
    func getMoviesList() {
        interactor.fetchMovies()
    }
    
    func configureCell(_ cell: MovieCellProtocol,at index: Int) {
        let movie = moviesList[index]
        cell.setMovie(title: movie.title ?? "", releaseDate: movie.releaseDate ?? "", image: MoviesListAPIsConstants.imageBaseUrl + (movie.posterPath ?? "") )
    }
    
    func openMovieDetails(at index: Int) {
        guard let view = view else { return }
        let interactor = MovieDetailsInteractor(movieId: moviesList[index].id ?? 0)
        router.pushMovieDetails(interactor: interactor, vc: view)
    }
}

extension MoviesListPresenter: MoviesListInteractorOutputProtocol {
    func moviesListFailure(error: NetworkError) {
        router.showAlert(message: error.errorMessage, view: view!)
    }
    
    func moviesList(_ list: [Movie]) {
        moviesList = list
        view?.addNewMovies()
    }
}
