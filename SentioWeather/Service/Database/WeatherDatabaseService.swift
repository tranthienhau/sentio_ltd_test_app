//
//  WeatherDatabaseService.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/22/21.
//

import Foundation
import UIKit

protocol WeatherDatabaseServicing {
    func save(response: WeatherResponse)
    func fetch(completion: @escaping (Result<WeatherResponse, Error>) -> Void)
}

final class WeatherDatabaseService: WeatherDatabaseServicing {
    private let databaseService: DatabaseServicing
    init(databaseService: DatabaseServicing) {
        self.databaseService = databaseService
    }

    func save(response: WeatherResponse) {
        databaseService.save(object: response, dbName: "weather", completion: nil)
    }

    func fetch(completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        databaseService.fetch(
            dbName: "weather",
            queryParams: DatabaseQueryParams(
                whereFields: ["device_id": UIDevice.current.identifierForVendor?.uuidString],
                orderBy: "timestamp",
                acsending: false
            ),
            completion: completion
        )
    }
}
