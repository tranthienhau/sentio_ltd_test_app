//
//  WeatherRouterMock.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

@testable import SentioWeather

final class WeatherTabRouterMock: WeatherTabRouting {
    enum Invocation {
        case setupTabBar
    }
    
    var invocations: [Invocation] = []
    
    func setupTabBars() {
        invocations.append(.setupTabBar)
    }
}
