//
//  MoviesListEndpoint.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 01/04/2023.
//

import Foundation

extension Endpoint {
    static func moviesListEndpoint(apiKey: String) -> Endpoint {
        return Endpoint(path: MoviesListAPIsConstants.moviesListEndPoint,
                        queryItems: [URLQueryItem(name: "api_key", value: apiKey)],
                        method: .get)
    }
}
