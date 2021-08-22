//
//  ForecastViewMock.swift
//  SentioWeatherTests
//
//  Created by Hau Tran on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class ForecastViewMock: ForecastView {
    enum Invocation {
        case showError
        case showData
    }

    var invocations: [Invocation] = []

    func showError(title _: String, message _: String) {
        invocations.append(.showError)
    }

    func showData(viewModels _: [ForecastViewModel]) {
        invocations.append(.showData)
    }
}
