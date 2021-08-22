//
//  TodayRouterMock.swift
//  SentioWeatherTests
//
//  Created by Hau Tran on 8/22/21.
//

@testable import SentioWeather
import UIKit

final class TodayRouterMock: TodayRouting {
    enum Invocation {
        case presentShareView
    }
    
    var invocations: [Invocation] = []
    
    func presentShareView(with param: UIImage) {
        invocations.append(.presentShareView)
    }
}
