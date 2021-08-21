//
//  TodayBuilder.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import UIKit

final class TodayBuilder {
    static func build() -> UIViewController {
        let view = TodayViewController()
        let item = UITabBarItem()
        item.title = "Today"
        item.image = UIImage(named: "home_icon") // TODO: icon
        view.tabBarItem = item

        return view
    }
}
