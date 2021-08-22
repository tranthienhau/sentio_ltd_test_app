//
//  TodayViewMock.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class TodayViewMock: TodayView {
    enum Invocation {
        case showError
        case showData
    }
    
    var invocations: [Invocation] = []
    
    func showError(title: String, message: String) {
        invocations.append(.showError)
    }
    
    func showData(viewModel: TodayViewModel) {
        invocations.append(.showData)
    }
}
