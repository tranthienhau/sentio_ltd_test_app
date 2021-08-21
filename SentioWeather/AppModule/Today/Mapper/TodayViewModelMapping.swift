//
//  TodayViewModelMapping.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Foundation

protocol TodayViewModelMapping {
    func todayViewModel(from response: WeatherForecastResponse) -> TodayViewModel
}

final class TodayViewModelMapper: TodayViewModelMapping {
    private let formatter: DateTimeFormatting
    private let stringFormatter: StringFormatting
    init(formatter: DateTimeFormatting, stringFormatter: StringFormatting) {
        self.formatter = formatter
        self.stringFormatter = stringFormatter
    }

    func todayViewModel(from response: WeatherForecastResponse) -> TodayViewModel {
        let todayDatas = todayWeatherDateResponses(responses: response.weatherDatas)
        return TodayViewModel(
            temperature: stringFormatter.temperature(
                temperature: todayDatas.first?.main.temperature ?? 0,
                metric: .celsius
            ),
            locationName: response.location.name
        )
    }

    private func todayWeatherDateResponses(responses: [WeatherDataResponse]) -> [WeatherDataResponse] {
        return responses.filter { weatherData -> Bool in
            let datetime = formatter.date(from: weatherData.datetime)
            return formatter.isSameDate(lhs: datetime, rhs: Date())
        }
    }
}