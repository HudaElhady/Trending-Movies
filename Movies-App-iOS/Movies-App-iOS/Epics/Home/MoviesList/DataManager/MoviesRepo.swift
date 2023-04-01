//
//  MoviesRepo.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import Foundation

protocol MoviesRepo {
    func getMoviesList(completionHandler: @escaping (Result<MoviesListResponse,NetworkError>)->Void)
    
}

class MoviesRepoImpl: MoviesRepo {
    let networkManager: NetworkDriverInterface
    
    init(networkManager: NetworkDriverInterface = AlamofireNetworkDriver()) {
        self.networkManager = networkManager
    }
    
    func getMoviesList(completionHandler: @escaping (Result<MoviesListResponse,NetworkError>)->Void) {
        
        networkManager.makeRequest(type: MoviesListResponse.self, .moviesListEndpoint(apiKey: MoviesListAPIsConstants.apiKey)) {response in
            switch response {
            case .success(let movies):
                completionHandler(.success(movies))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
