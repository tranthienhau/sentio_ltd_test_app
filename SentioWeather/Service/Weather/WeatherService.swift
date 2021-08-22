//
//  WeatherServicing.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

typealias WeatherForecastResponse = (weatherDatas: [WeatherDataResponse], location: LocationResponse)

protocol WeatherServicing {
    func fetchWeatherData(
        latitude: Double,
        longitude: Double,
        result: @escaping (Result<WeatherResponse, Error>) -> Void
    )
}

final class WeatherService: WeatherServicing {
    private let repository: WeatherRepositoring
    private let database: WeatherDatabaseServicing
    init(repository: WeatherRepositoring, database: WeatherDatabaseServicing) {
        self.database = database
        self.repository = repository
    }

    func fetchWeatherData(
        latitude: Double,
        longitude: Double,
        result: @escaping (Result<WeatherResponse, Error>) -> Void
    ) {
        repository.fetchWeatherData(latitude: latitude, longitude: longitude) { [weak self] repoResult in
            switch repoResult {
            case let .success(response):
                self?.saveToDatabase(response)
                result(.success(response))
            case .failure:
                self?.database.fetch(completion: result)
            }
        }
    }

    private func saveToDatabase(_ response: WeatherResponse) {
        database.save(response: response)
    }
}
