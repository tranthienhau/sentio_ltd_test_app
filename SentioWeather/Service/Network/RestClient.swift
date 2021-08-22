//
//  RestClient.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import Foundation
import Moya

protocol RestClient {
    func executeRequest<T: TargetType, D: Codable>(
        target: T,
        completion: @escaping (Result<D, Error>) -> Void
    )
}

class RestClientImpl: RestClient {
    func executeRequest<T: TargetType, D: Codable>(
        target: T,
        completion: @escaping (Result<D, Error>) -> Void
    ) {
        let provider = MoyaProvider<T>(plugins: [
            NetworkLoggerPlugin(
                configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose)
            ),
        ])
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(D.self, from: response.data)
                    completion(.success(results))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
