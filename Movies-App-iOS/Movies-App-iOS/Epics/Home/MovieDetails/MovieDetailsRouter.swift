//
//  MovieDetailsRouter.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import UIKit

class MovieDetailsRouter: MoviesDetailsRouterProtocol {
    func showAlert(message: String, view: UIViewController) {
        view.alert(message: message, actions: [("Cancel", .cancel)])
    }
}
