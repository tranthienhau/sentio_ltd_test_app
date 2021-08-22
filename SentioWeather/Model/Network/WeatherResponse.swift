//
//  WeatherDataResponse.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

struct WeatherResponse: Codable {
    let deviceId: String?
    let timestamp: Int?
    let status: String
    let message: Int
    let count: Int
    let datas: [WeatherDataResponse]
    let city: LocationResponse

    private enum CodingKeys: String, CodingKey {
        case status = "cod"
        case message
        case count = "cnt"
        case datas = "list"
        case city, timestamp
        case deviceId = "device_id"
    }
}

struct LocationResponse: Codable {
    let id: Int
    let name: String
    let coordinate: CoordinateResponse
    let country: String
    let population: Int
    let timezone: Int
    let sunrise: Int
    let sunset: Int

    private enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case id, name, country, population, timezone, sunrise, sunset
    }

    struct CoordinateResponse: Codable {
        let latitude: Double
        let longitude: Double

        private enum CodingKeys: String, CodingKey {
            case latitude = "lat"
            case longitude = "lon"
        }
    }
}

struct WeatherDataResponse: Codable {
    let datetime: Double
    let datetimeString: String
    let main: MainInfoResponse
    let weather: [WeatherInfoResponse]
    let clouds: CloudsInfoResponse
    let wind: WindInfoResponse
    let rain: RainInfoResponse?
    let sys: SysInfoResponse
    let visibility: Int
    let pop: Double

    private enum CodingKeys: String, CodingKey {
        case datetime = "dt"
        case datetimeString = "dt_txt"
        case main, weather, clouds, wind, rain, sys, visibility, pop
    }
}

struct MainInfoResponse: Codable {
    let temperature: Double
    let feelsLike: Double
    let minTemperature: Double
    let maxTemperature: Double
    let pressure: Int
    let seaLevel: Int
    let groundLevel: Int
    let humidity: Int
    let temperatureKf: Double

    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case maxTemperature = "temp_min"
        case minTemperature = "temp_max"
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case temperatureKf = "temp_kf"
        case pressure, humidity
    }
}

struct WeatherInfoResponse: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct CloudsInfoResponse: Codable {
    let all: Int
}

struct WindInfoResponse: Codable {
    let speed: Double
    let degree: Int
    let gust: Double

    private enum CodingKeys: String, CodingKey {
        case speed, gust
        case degree = "deg"
    }
}

struct SysInfoResponse: Codable {
    let pod: String
}

struct RainInfoResponse: Codable {
    let threeH: Double

    private enum CodingKeys: String, CodingKey {
        case threeH = "3h"
    }
}
