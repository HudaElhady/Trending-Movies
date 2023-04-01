//
//  MoviesListProtocols.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import UIKit

protocol MoviesListInteractorProtocol {
    var presenter: MoviesListInteractorOutputProtocol? {get set}
    func fetchMovies()
}

protocol MoviesListInteractorOutputProtocol: AnyObject {
    func moviesList(_ list: [Movie])
    func moviesListFailure(error: NetworkError)
}

protocol MoviesListPresenterProtocol {
    var view: MoviesListPresenterOutputProtocol?{ get set }
    var moviesCount:Int {get}
    func getMoviesList()
    func configureCell(_ cell: MovieCellProtocol,at index: Int)
    func openMovieDetails(at index: Int)
}

protocol MoviesListPresenterOutputProtocol: UIViewController {
    func addNewMovies()
}

protocol MovieCellProtocol: AnyObject {
    func setMovie(title: String, image: String)
}

protocol MoviesListRouterProtocol {
    var rootViewController: UIViewController { get }
    func showAlert(message: String, view: UIViewController)
    func pushMovieDetails(interactor: MovieDetailsInteractorProtocol, vc: UIViewController)
}
