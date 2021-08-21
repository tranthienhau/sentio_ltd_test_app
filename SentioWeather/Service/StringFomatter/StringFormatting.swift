//
//  StringFormatting.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
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
}

final class StringFormatter: StringFormatting {
    func temperature(temperature: Double, metric: TemperatureMetric) -> String {
        return String(format: "%.2f %@", temperature, metric.stringValue)
    }

    func icon(name: String?) -> String? {
        guard let name = name else { return nil }
        return "http://openweathermap.org/img/w/" + name + ".png"
    }
}
