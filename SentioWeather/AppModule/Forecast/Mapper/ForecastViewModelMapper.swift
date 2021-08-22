//
//  ForecastViewModelMapper.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import Foundation

protocol ForecastViewModelMapping {
    func forecastViewModels(from response: WeatherForecastResponse) -> [ForecastViewModel]
}

final class ForecastViewModelMapper: ForecastViewModelMapping {
    private let formatter: DateTimeFormatting
    private let stringFormatter: StringFormatting
    init(formatter: DateTimeFormatting, stringFormatter: StringFormatting) {
        self.formatter = formatter
        self.stringFormatter = stringFormatter
    }

    func forecastViewModels(from response: WeatherForecastResponse) -> [ForecastViewModel] {
        let responses = groupWeatherDateResponses(responses: response.weatherDatas)
        return responses.compactMap { (_, item) -> ForecastViewModel? in
            guard let firstItem = item.first else { return nil }
            let date = self.formatter.date(from: firstItem.datetime)
            let relativeDay = self.formatter.relativeDate(lhs: date, rhs: Date())
            let forecastHeaderViewModel = ForecastHeaderViewModel(title: relativeDay)
            let items = item.compactMap { [weak self] item -> ForecastItemViewModel? in
                guard let self = self else { return nil }
                let time = self.formatter.time(from: item.datetime)
                let weather = self.stringFormatter.temperature(temperature: item.main.temperature, metric: .celsius)
                let iconUrl = self.stringFormatter.icon(name: item.weather.first?.icon)
                return ForecastItemViewModel(
                    time: time,
                    description: item.weather.first?.main ?? "",
                    temperature: weather,
                    iconUrl: iconUrl
                )
            }
            let viewModel = ForecastViewModel(header: forecastHeaderViewModel, items: items)
            return viewModel
        }
    }

    private func groupWeatherDateResponses(
        responses: [WeatherDataResponse]
    ) -> [(key: Date, value: [WeatherDataResponse])] {
        return Dictionary(grouping: responses) { (response) -> Date in
            let datetime = formatter.date(from: response.datetime)
            return Calendar.current.startOfDay(for: datetime)
        }
        .sorted { $0.0 < $1.0 }
    }
}
