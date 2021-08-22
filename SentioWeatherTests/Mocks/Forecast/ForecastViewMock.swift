//
//  ForecastViewMock.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class ForecastViewMock: ForecastView {
    enum Invocation {
        case showError
        case showData
    }
    
    var invocations: [Invocation] = []
    
    func showError(title: String, message: String) {
        invocations.append(.showError)
    }
    
    func showData(viewModels: [ForecastViewModel]) {
        invocations.append(.showData)
    }
}
