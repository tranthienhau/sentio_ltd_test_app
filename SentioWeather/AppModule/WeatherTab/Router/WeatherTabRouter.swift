//
//  WeatherTabRouter.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import UIKit

protocol WeatherTabRouting {
    func setupTabBars()
}

class WeatherTabRouter {
    weak var viewController: UIViewController?
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension WeatherTabRouter: WeatherTabRouting {
    func setupTabBars() {
        guard let tabBarController = viewController as? UITabBarController else { return }
        let todayView = TodayBuilder.build()
        let forecastView = ForecaseBuilder.build()
        tabBarController.viewControllers = [todayView, forecastView]
    }
}
