//
//  WeatherServiceMock.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class WeatherServiceMock: WeatherServicing {
    enum Invocation {
        case fetchWeatherData
    }
    
    var invocations: [Invocation] = []
    
    var result: Result<WeatherResponse, Error> = .failure(MockError.sampleError)
    
    func fetchWeatherData(latitude: Double, longitude: Double, result: @escaping (Result<WeatherResponse, Error>) -> Void) {
        invocations.append(.fetchWeatherData)
        result(self.result)
    }
}
