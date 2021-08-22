//
//  WeatherRouterMock.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

@testable import SentioWeather

final class WeatherRouterMock: WeatherRouting {
    enum Invocation {
        case setupTabBar
    }
    
    var invocations: [Invocation] = []
    
    
}
