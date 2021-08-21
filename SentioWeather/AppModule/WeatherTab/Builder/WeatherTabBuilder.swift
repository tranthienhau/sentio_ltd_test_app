//
//  WeatherTabBuilder.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import UIKit

final class WeatherTabBuilder {
    static func build() -> UIViewController {
        let view = WeatherTabViewController()
        let router = WeatherTabRouter()
        let presenter = WeatherTabPresenter(router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}
