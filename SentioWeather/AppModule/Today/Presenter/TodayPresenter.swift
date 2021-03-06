//
//  TodayPresenter.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//
import UIKit

protocol TodayPresenting {
    func onViewWillAppear()
    func onShare(param: UIImage)
}

class TodayPresenter {
    weak var view: TodayView?
    private let interactor: TodayInteracting
    private let router: TodayRouting
    private let mapper: TodayViewModelMapping

    init(view: TodayView, interactor: TodayInteracting, router: TodayRouting, mapper: TodayViewModelMapping) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.mapper = mapper
    }
}

extension TodayPresenter: TodayPresenting {
    func onViewWillAppear() {
        interactor.weatherData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.handleResponse(response)
            case let .failure(error):
                self.view?.showError(title: "Oops!", message: error.localizedDescription)
            }
        }
    }

    func onShare(param: UIImage) {
        router.presentShareView(with: param)
    }
}

private extension TodayPresenter {
    func handleResponse(_ response: WeatherForecastResponse) {
        let viewModel = mapper.todayViewModel(from: response)
        view?.showData(viewModel: viewModel)
    }
}
