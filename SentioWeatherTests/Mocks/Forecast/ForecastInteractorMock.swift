//
//  ForecastInteractorMock.swift
//  SentioWeatherTests
//
//  Created by Hau Tran on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class ForecastInteractorMock: ForecastInteracting {
    enum Invocation {
        case weatherData
    }

    var invocations: [Invocation] = []

    var result: Result<WeatherForecastResponse, Error> = .failure(MockError.sampleError)

    func weatherData(completion: @escaping (Result<WeatherForecastResponse, Error>) -> Void) {
        invocations.append(.weatherData)
        completion(result)
    }
}
