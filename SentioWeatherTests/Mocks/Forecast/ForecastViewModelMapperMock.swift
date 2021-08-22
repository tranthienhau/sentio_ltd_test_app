//
//  ForecastViewModelMapperMock.swift
//  SentioWeatherTests
//
//  Created by Hau Tran on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class ForecastViewModelMapperMock: ForecastViewModelMapping {
    enum Invocation {
        case forecastViewModels
    }

    var invocations: [Invocation] = []
    var stubViewModels: [ForecastViewModel] = [
        ForecastViewModel(
            header: ForecastHeaderViewModel(title: ""),
            items: [
                ForecastItemViewModel(time: "", description: "", temperature: "", iconUrl: ""),
            ]
        ),
    ]

    func forecastViewModels(from _: WeatherForecastResponse) -> [ForecastViewModel] {
        invocations.append(.forecastViewModels)
        return stubViewModels
    }
}
