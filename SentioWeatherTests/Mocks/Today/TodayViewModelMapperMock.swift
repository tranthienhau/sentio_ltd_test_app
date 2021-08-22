//
//  TodayViewModelMapperMock.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class TodayViewModelMapperMock: TodayViewModelMapping {
    enum Invocation {
        case todayViewModel
    }
    
    var invocations: [Invocation] = []
    var stubViewModel: TodayViewModel = TodayViewModel(
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
    
    func todayViewModel(from response: WeatherForecastResponse) -> TodayViewModel {
        invocations.append(.todayViewModel)
        return stubViewModel
    }
    
    
}
