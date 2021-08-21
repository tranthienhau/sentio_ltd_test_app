//
//  TodayViewRouter.swift
//  SentioWeather
//
//  Created by Hau Tran on 21/08/2021.
//

import UIKit

protocol TodayViewRouterProtocol: AnyObject {
    
}

class TodayViewRouter {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension TodayViewRouter : TodayViewRouterProtocol {
    
}
