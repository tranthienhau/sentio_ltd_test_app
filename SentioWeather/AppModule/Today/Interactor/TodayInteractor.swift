//
//  TodayInteractor.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import Foundation

protocol TodayInteracting {
    func weatherData(
        completion: @escaping (Result<WeatherForecastResponse, Error>) -> Void
    )
}

class TodayInteractor {
    private let service: WeatherServicing
    private let locationService: LocationServicing

    private var userLocation: (Double, Double)?

    init(service: WeatherServicing, locationService: LocationServicing) {
        self.service = service
        self.locationService = locationService
    }
}

extension TodayInteractor: TodayInteracting {
    func weatherData(
        completion: @escaping (Result<WeatherForecastResponse, Error>) -> Void
    ) {
        locationService.userLocation { [weak self] result in
            switch result {
            case let .success((latitude, longitude)):
                self?.userLocation = (latitude, longitude)
                self?.fetchWeatherData(completion: completion)
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    private func fetchWeatherData(completion: @escaping (Result<WeatherForecastResponse, Error>) -> Void) {
        guard let latitude = userLocation?.0,
              let longitude = userLocation?.1,
              latitude > 0.0, longitude > 0.0
        else {
            completion(.failure(LocationServiceError.invalidCoordinate))
            return
        }
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
