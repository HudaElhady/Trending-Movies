//
//  Endpoint.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import Foundation
import Alamofire

struct Endpoint {
    var host: String = "api.themoviedb.org"
    var path: String
    var queryItems = [URLQueryItem]()
    var method: HTTPMethod
    var headers: HTTPHeaders = getDefaultHeaders()
    var body :[String: Any] = [:]
}

extension Endpoint {
    func makeRequest() -> URLRequestConvertible? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = "/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems

        guard let url = components.url else {
            return nil
        }
        
        guard var request = try? URLRequest(url: url, method: method, headers: headers) else {
            return nil
        }
        if !body.isEmpty {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        }
        
        return request

    }
}

private extension Endpoint {

    static func getDefaultHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        return headers
    }

}
