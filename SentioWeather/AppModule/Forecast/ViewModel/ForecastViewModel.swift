//
//  ForecastViewModel.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

struct ForecastItemViewModel {
    let time: String
    let description: String
    let temperature: String
    let iconUrl: String?
}

struct ForecastHeaderViewModel {
    let title: String
}

struct ForecastViewModel {
    let header: ForecastHeaderViewModel
    let items: [ForecastItemViewModel]
}
