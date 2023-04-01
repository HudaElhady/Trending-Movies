//
//  MovieDetailsEndpoint.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 01/04/2023.
//

import Foundation

extension Endpoint {
    static func movieDetailsEndpoint(apiKey: String, movieId: String) -> Endpoint {
        return Endpoint(path: MoviesDetailsAPIsConstants.moviesDetailsEndPoint + movieId,
                        queryItems: [URLQueryItem(name: "api_key", value: apiKey)],
                        method: .get)
    }
}
