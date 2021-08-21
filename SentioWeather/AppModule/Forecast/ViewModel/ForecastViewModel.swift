//
//  ForecastViewModel.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

struct ForcastItemViewModel {
    let time: String
    let description: String
    let temperature: String
    let iconUrl: String
}

struct ForecastViewModel {
    let title: String
    let items: [ForcastItemViewModel]
}
