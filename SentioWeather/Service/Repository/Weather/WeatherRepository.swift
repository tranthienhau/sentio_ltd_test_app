//
//  WeatherRepository.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

enum WeatherRepositoryError: Error {
    case failedRequest
}

protocol WeatherRepositoring {
    func fetchWeatherData(
        latitude: Double,
        longitude: Double,
        result: @escaping (Result<WeatherResponse, Error>) -> Void
    )
}

final class WeatherRepository: WeatherRepositoring {
    private let restClient: RestClient
    init(restClient: RestClient) {
        self.restClient = restClient
    }

    func fetchWeatherData(
        latitude: Double,
        longitude: Double,
        result: @escaping (Result<WeatherResponse, Error>) -> Void
    ) {
        let params = FetchWeatherRequest(units: "metric", latitude: latitude, longitude: longitude)
        restClient.executeRequest(target: WeatherResource.fetch(params: params), completion: result)
    }
}
