//
//  StringFormatting.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import Foundation

enum TemperatureMetric {
    case celsius
    case fahrenheit

    var stringValue: String {
        switch self {
        case .celsius:
            return "°C"
        case .fahrenheit:
            return "°F"
        }
    }
}

protocol StringFormatting {
    func temperature(temperature: Double, metric: TemperatureMetric) -> String
    func icon(name: String?) -> String?
    func pop(value: Double?) -> String?
    func windSpeed(value: Double?) -> String?
    func groundLevel(value: Int?) -> String?
    func rain(value: Double?) -> String?
}

final class StringFormatter: StringFormatting {
    func temperature(temperature: Double, metric: TemperatureMetric) -> String {
        return String(format: "%.2f %@", temperature, metric.stringValue)
    }

    func icon(name: String?) -> String? {
        guard let name = name else { return nil }
        return "http://openweathermap.org/img/w/" + name + ".png"
    }

    func pop(value: Double?) -> String? {
        guard let value = value else {return nil}
        let roundValue = value.rounded(toPlaces: 2)
        return "\(roundValue * 100)%"
    }

    func windSpeed(value: Double?) -> String? {
        guard let value = value else {return nil}
        let roundValue = value.rounded(toPlaces: 2)
        return "\(roundValue) km/h"
    }

    func groundLevel(value: Int?) -> String? {
        guard let value = value else { return nil }
        return "\(value) hPa"
    }

    func rain(value: Double?) -> String? {
        guard let value = value else {return nil}
        let roundValue = value.rounded(toPlaces: 2)
        return "\(roundValue) mm"
    }
}
