//
//  MovieDetailsProtocols.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import UIKit

protocol MovieDetailsPresenterProtocol: AnyObject {
    var view: MovieDetailsPresenterOutputProtocol? {get set}
    func getMovieDetails()
    var movieImageUrl: String {get}
    var movieTitle: String {get}
    var releaseDate: String {get}
    var overview: String {get}
    var tagline: String? {get}
}

protocol MovieDetailsPresenterOutputProtocol : UIViewController  {
    func updateDetails(_ presenter: MovieDetailsPresenterProtocol)
}

protocol MovieDetailsInteractorProtocol {
    var presenter: MovieDetailsInteractorOutputProtocol?{get set}
    func fetchMovieDetails()
}

protocol MovieDetailsInteractorOutputProtocol: AnyObject {
    func movieDetails(_ details: MovieDetails)
    func movieDetailsFailure(_ error: NetworkError)
}

protocol MoviesDetailsRouterProtocol {
    func showAlert(message: String, view: UIViewController)
}
