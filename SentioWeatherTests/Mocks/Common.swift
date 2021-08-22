//
//  Common.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import Foundation
@testable import SentioWeather

enum MockError: Error {
    case sampleError
}

func weatherResponse(status: Int = 200) -> WeatherResponse {
    WeatherResponse(
        deviceId: nil,
        timestamp: nil,
        status: String(status),
        message: 0,
        count: 0,
        datas: weatherForecastResponse.weatherDatas,
        city: weatherForecastResponse.location
    )
}

var weatherForecastResponse = (
    weatherDatas: [
        WeatherDataResponse(
            datetime: 0.0,
            datetimeString: "",
            main: MainInfoResponse(
                temperature: 0.0,
                feelsLike: 0.0,
                minTemperature: 0.0,
                maxTemperature: 0.0,
                pressure: 0,
                seaLevel: 0,
                groundLevel: 0,
                humidity: 0,
                temperatureKf: 0.0),
            weather: [
                WeatherInfoResponse(id: 1, main: "main", description: "", icon: ""),
                WeatherInfoResponse(id: 2, main: "main", description: "", icon: ""),
                WeatherInfoResponse(id: 3, main: "main", description: "", icon: ""),
                WeatherInfoResponse(id: 4, main: "main", description: "", icon: ""),
            ],
            clouds: CloudsInfoResponse(all: 0),
            wind: WindInfoResponse(speed: 0.0, degree: 0, gust: 0.0),
            rain: nil,
            sys: SysInfoResponse(pod: "S"),
            visibility: 0,
            pop: 0.0
        )
    ],
    location: LocationResponse(
        id: 0,
        name: "",
        coordinate: LocationResponse.CoordinateResponse(latitude: 0.0, longitude: 0.0),
        country: "",
        population: 0,
        timezone: 0,
        sunrise: 0,
        sunset: 0
    )
)
