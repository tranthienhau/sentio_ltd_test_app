//
//  DatabaseService.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/22/21.
//

struct DatabaseQueryParams {
    let whereFields: [String: Any]?
    let orderBy: String?
    var acsending: Bool = true
}

protocol DatabaseServicing {
    func save<T: Codable>(object: T, dbName: String, completion: ((Result<Void, Error>) -> Void)?)
    func fetch<T: Codable>(
        dbName: String,
        queryParams: DatabaseQueryParams,
        completion: @escaping (Result<T, Error>) -> Void
    )
}
