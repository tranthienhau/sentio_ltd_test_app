//
//  WeatherServicing.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
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
    init(repository: WeatherRepositoring) {
        self.repository = repository
    }

    func fetchWeatherData(
        latitude: Double,
        longitude: Double,
        result: @escaping (Result<WeatherResponse, Error>) -> Void
    ) {
        repository.fetchWeatherData(latitude: latitude, longitude: longitude, result: result)
    }
}
