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

        let service: WeatherServicing = DependencyContainer.sharedInstance.getService()
        let formatter: DateTimeFormatting = DependencyContainer.sharedInstance.getService()
        let stringFormatter: StringFormatting = DependencyContainer.sharedInstance.getService()
        let mapper = TodayViewModelMapper(formatter: formatter, stringFormatter: stringFormatter)
        let interactor = TodayInteractor(service: service)
        let presenter = TodayPresenter(view: view, interactor: interactor, mapper: mapper)
        view.presenter = presenter

        return view
    }
}
