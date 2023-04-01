//
//  MovieDetailsRepo.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import Foundation

protocol MovieDetailsRepo {
    func getMovieDetails(movieId: Int, completionHandler: @escaping (Result<MovieDetails,NetworkError>)->Void)
    
}

class MovieDetailsRepoImpl: MovieDetailsRepo {
    
    let networkManager: NetworkDriverInterface
    
    init(networkManager: NetworkDriverInterface = AlamofireNetworkDriver()) {
        self.networkManager = networkManager
    }
    
    func getMovieDetails(movieId: Int, completionHandler: @escaping (Result<MovieDetails,NetworkError>)->Void) {
        networkManager.makeRequest(type: MovieDetails.self, .movieDetailsEndpoint(apiKey: MoviesListAPIsConstants.apiKey, movieId: "\(movieId)")) {response in
            switch response {
            case .success(let movie):
                completionHandler(.success(movie))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
