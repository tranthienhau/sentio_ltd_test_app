//
//  TodayPresenter.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

protocol TodayPresenting {
    func onViewWillAppear()
}

class TodayPresenter {
    weak var view: TodayView?
    private let interactor: TodayInteracting
    private let mapper: TodayViewModelMapping

    init(view: TodayView, interactor: TodayInteracting, mapper: TodayViewModelMapping) {
        self.view = view
        self.interactor = interactor
        self.mapper = mapper
    }
}

extension TodayPresenter: TodayPresenting {
    func onViewWillAppear() {
        interactor.fetchWeatherData(latitude: 1.3116719, longitude: 103.8336574) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.handleResponse(response)
            case let .failure(error):
                self.view?.showError(title: "TODO", message: error.localizedDescription)
            }
        }
    }
}

private extension TodayPresenter {
    func handleResponse(_ response: WeatherForecastResponse) {
        let viewModel = mapper.todayViewModel(from: response)
        view?.showData(viewModel: viewModel)
    }
}
