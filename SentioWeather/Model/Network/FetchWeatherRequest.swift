//
//  FetchWeatherRequest.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

struct FetchWeatherRequest {
    let units: String
    let latitude: Double
    let longitude: Double
}

extension FetchWeatherRequest {
    func bodyParameters() -> [String: Any] {
        return [
            "units": units,
            "lat": latitude,
            "lon": longitude,
        ]
    }
}
