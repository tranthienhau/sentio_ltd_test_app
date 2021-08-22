//
//  WeatherServiceMock.swift
//  SentioWeatherTests
//
//  Created by Hau Tran on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class WeatherServiceMock: WeatherServicing {
    enum Invocation {
        case fetchWeatherData
    }

    var invocations: [Invocation] = []

    var result: Result<WeatherResponse, Error> = .failure(MockError.sampleError)

    func fetchWeatherData(latitude _: Double, longitude _: Double, result: @escaping (Result<WeatherResponse, Error>) -> Void) {
        invocations.append(.fetchWeatherData)
        result(self.result)
    }
}
