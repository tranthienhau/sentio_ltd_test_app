//
//  BaseTargetType.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Moya

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    var baseURL: URL {
        URL(string: "https://community-open-weather-map.p.rapidapi.com/")!
    }

    var sampleData: Data {
        return Data()
    }

    var headers: [String: String]? {
        return [
            "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
            "x-rapidapi-key": "3ce35b3411msh059f7043977e832p1a476ejsnd9fb189d0811",
        ]
    }
}
