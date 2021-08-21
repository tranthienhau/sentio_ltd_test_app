//
//  WeatherTabPresenter.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

protocol WeatherTabPresenting: AnyObject {
    func onViewWillAppear()
}

class WeatherTabPresenter {
    var router: WeatherTabRouting
    init(router: WeatherTabRouting) {
        self.router = router
    }
}

extension WeatherTabPresenter: WeatherTabPresenting {
    func onViewWillAppear() {
        router.setupTabBars()
    }
}
