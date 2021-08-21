//
//  WeatherTabBuilder.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import UIKit

final class WeatherTabBuilder {
    static func build() -> UIViewController {
        let view = WeatherTabViewController()
        let router = WeatherTabRouter(viewController: view)
        let presenter = WeatherTabPresenter(router: router)
        view.presenter = presenter
        return view
    }
}
