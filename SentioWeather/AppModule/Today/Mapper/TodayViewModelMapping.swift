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
            locationName: response.location.name,
            mainWeather: todayDatas.first?.weather.first?.main ?? "",
            icon: stringFormatter.icon(name: todayDatas.first?.weather.first?.icon) ?? "",
            pop: stringFormatter.pop(value: todayDatas.first?.pop) ?? "" ,
            windSpeed: stringFormatter.windSpeed(value: todayDatas.first?.wind.speed) ?? "",
            sys: todayDatas.first?.sys.pod ?? "",
            grndLevel: stringFormatter.grndLevel(value: todayDatas.first?.main.groundLevel) ?? "",
            rain: stringFormatter.rain(value: todayDatas.first?.rain?.threeH) ?? ""
        )
    }

    private func todayWeatherDateResponses(responses: [WeatherDataResponse]) -> [WeatherDataResponse] {
        return responses.filter { [weak self] weatherData -> Bool in
            guard let self = self else { return false }
            let datetime = self.formatter.date(from: weatherData.datetime)
            return self.formatter.isSameDate(lhs: datetime, rhs: Date())
        }
    }
}
