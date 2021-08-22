//
//  ForecastBuilder.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import Foundation

import UIKit

final class ForecaseBuilder {
    static func build() -> UIViewController {
        let view = ForecastViewController()
        let item = UITabBarItem()
        item.title = "Forecast"
        item.image = UIImage(named: "home_icon") // TODO: icon
        view.tabBarItem = item

        let service: WeatherServicing = DependencyContainer.sharedInstance.getService()
        let formatter: DateTimeFormatting = DependencyContainer.sharedInstance.getService()
        let stringFormatter: StringFormatting = DependencyContainer.sharedInstance.getService()
        let locationService: LocationServicing = DependencyContainer.sharedInstance.getService()
        let mapper = ForecastViewModelMapper(formatter: formatter, stringFormatter: stringFormatter)
        let interactor = ForecastInteractor(service: service, locationService: locationService)
        let presenter = ForecastPresenter(view: view, interactor: interactor, mapper: mapper)
        view.presenter = presenter
        return view
    }
}
