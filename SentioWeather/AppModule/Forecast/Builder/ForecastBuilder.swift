//
//  ForecastBuilder.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Foundation

import UIKit

final class ForecaseBuilder {
    static func build() -> UIViewController {
        let view = ForecaseViewController()
        let item = UITabBarItem()
        item.title = "Forecast"
        item.image = UIImage(named: "home_icon") // TODO: icon
        view.tabBarItem = item

        return view
    }
}
