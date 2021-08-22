//
//  TodayViewModelMapperMock.swift
//  SentioWeatherTests
//
//  Created by Hau Tran on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class TodayViewModelMapperMock: TodayViewModelMapping {
    enum Invocation {
        case todayViewModel
    }

    var invocations: [Invocation] = []
    var stubViewModel = TodayViewModel(
        temperature: "",
        locationName: "",
        mainWeather: "",
        icon: "",
        pop: "",
        windSpeed: "",
        sys: "",
        groundLevel: "",
        rain: ""
    )

    func todayViewModel(from _: WeatherForecastResponse) -> TodayViewModel {
        invocations.append(.todayViewModel)
        return stubViewModel
    }
}
