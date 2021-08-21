//
//  TodayViewPresenter.swift
//  SentioWeather
//
//  Created by Hau Tran on 21/08/2021.
//

import Foundation

protocol TodayViewPresenterProtocol: AnyObject {
    
}

class TodayViewPresenter {
    
    private weak var view: TodayViewControllerProtocol?
    private var interactor: TodayViewInteractorProtocol
    private var router: TodayViewRouterProtocol
    
    init(view: TodayViewControllerProtocol,
         interactor: TodayViewInteractorProtocol,
         router: TodayViewRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension TodayViewPresenter : TodayViewPresenterProtocol {
    
}
