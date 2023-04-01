//
//  AlamofireNetworkDriver.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 31/03/2023.
//

import Foundation
import Alamofire

protocol NetworkDriverInterface {
    func makeRequest<T: Decodable>(type: T.Type, _ endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void)
}


class AlamofireNetworkDriver: NetworkDriverInterface {
    
    func makeRequest<T: Decodable>(type: T.Type, _ endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        AF.request(endpoint.makeRequest()!).validate().responseData
        { response in
            switch response.result {
            case .success(let value):
                guard let obj = try? JSONDecoder().decode(T.self, from: value) else {return}
                completion(.success(obj))
            case .failure:
                completion(.failure(.requestFailed))
            }
        }
    }
}
