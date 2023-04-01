//
//  MoviesListRouter.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import UIKit

class MoviesListRouter: MoviesListRouterProtocol {
    
    var rootViewController: UIViewController {
        let interactor = MoviesListInteractor()
        let moviesListVC =  UIStoryboard(name: StoryBoardsIDs.main.id, bundle: nil).instantiateViewController(withIdentifier: ViewControllersIDs.MoviesListVC.id) as! MoviesListView
        moviesListVC.presenter = MoviesListPresenter(interactor: interactor, router: self)
        let navigationController = UINavigationController(rootViewController: moviesListVC)
        return navigationController
    }
    
    
    func showAlert(message: String, view: UIViewController) {
        view.alert(message: message, actions: [("Cancel", .cancel)])
    }
    
    func pushMovieDetails(interactor: MovieDetailsInteractorProtocol, vc: UIViewController) {
        let moviesDetailsVC =  UIStoryboard(name: StoryBoardsIDs.main.id, bundle: nil).instantiateViewController(withIdentifier: ViewControllersIDs.MovieDetailsVC.id) as! MovieDetailsView
        let presenter = MovieDetailsPresenter(interactor: interactor, router: MovieDetailsRouter())
        moviesDetailsVC.presenter = presenter
        vc.navigationController?.pushViewController(moviesDetailsVC, animated: true)
    }
}
