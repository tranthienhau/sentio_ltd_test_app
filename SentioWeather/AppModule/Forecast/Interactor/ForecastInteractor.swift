//
//  ForecastInteractor.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Foundation

protocol ForecastInteracting {
    func fetchWeatherData(
        latitude: Double,
        longitude: Double,
        completion: @escaping (Result<WeatherForecastResponse, Error>) -> Void
    )
}

class ForecastInteractor: ForecastInteracting {
    private let service: WeatherServicing
    init(service: WeatherServicing) {
        self.service = service
    }

    func fetchWeatherData(
        latitude: Double,
        longitude: Double,
        completion: @escaping (Result<WeatherForecastResponse, Error>) -> Void
    ) {
        service.fetchWeatherData(latitude: latitude, longitude: longitude) { result in
            switch result {
            case let .success(response):
                guard response.status == "200" else {
                    completion(.failure(WeatherRepositoryError.failedRequest))
                    return
                }
                let weatherForecastResponse = (weatherDatas: response.datas, location: response.city)
                completion(.success(weatherForecastResponse))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
