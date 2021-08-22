//
//  WeatherResource.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import Moya

enum WeatherResource {
    case fetch(params: FetchWeatherRequest)
}

extension WeatherResource: BaseTargetType {
    var path: String {
        switch self {
        case .fetch:
            return "forecast"
        }
    }

    var method: Method {
        switch self {
        case .fetch:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .fetch(params: params):
            return .requestParameters(parameters: params.bodyParameters(), encoding: URLEncoding.default)
        }
    }
}
