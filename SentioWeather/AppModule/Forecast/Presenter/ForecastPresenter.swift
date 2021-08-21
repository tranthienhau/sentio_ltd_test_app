//
//  ForecastPresenter.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Foundation

protocol ForecastPresenting {
    func onViewWillAppear()
}

class ForecastPresenter: ForecastPresenting {
    var view: ForecastView?
    private let interactor: ForecastInteracting
    private let mapper: ForecastViewModelMapping
    init(view: ForecastView, interactor: ForecastInteracting, mapper: ForecastViewModelMapping) {
        self.view = view
        self.interactor = interactor
        self.mapper = mapper
    }

    func onViewWillAppear() {
        interactor.fetchWeatherData(latitude: 1.3116719, longitude: 103.8336574) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.handleResponse(response)
            case let .failure(error):
                // TODO: add title
                self.view?.showError(title: "TODO", message: error.localizedDescription)
            }
        }
    }
}

private extension ForecastPresenter {
    func handleResponse(_ response: WeatherForecastResponse) {
        let viewModels = mapper.forecastViewModels(from: response)
        view?.showData(viewModels: viewModels)
    }
}
