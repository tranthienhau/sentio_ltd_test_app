//
//  TodayViewInteractor.swift
//  SentioWeather
//
//  Created by Hau Tran on 21/08/2021.
//

import Foundation

protocol TodayViewInteractorProtocol: AnyObject {
    
}

class TodayViewInteractor {
    weak var presenter: TodayViewPresenterProtocol?
}

extension TodayViewInteractor : TodayViewInteractorProtocol {
    
}
