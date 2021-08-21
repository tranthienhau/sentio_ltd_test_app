//
//  ForecastViewModelMapper.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Foundation

protocol ForecastViewModelMapping {
    func forecastViewModels(from response: WeatherForecastResponse) -> ForecastViewModel
}

final class ForecastViewModelMapper: ForecastViewModelMapping {
    private let formatter: DateTimeFormatting
    private let stringFormatter: StringFormatting
    init(formatter: DateTimeFormatting, stringFormatter: StringFormatting) {
        self.formatter = formatter
        self.stringFormatter = stringFormatter
    }

    func forecastViewModels(from _: WeatherForecastResponse) -> ForecastViewModel {
        return ForecastViewModel(title: "", items: [])
    }
}
