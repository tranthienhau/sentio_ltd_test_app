//
//  Encodable+Extension.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/22/21.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (
            try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            )
        ).flatMap { $0 as? [String: Any] }
    }
}

extension Dictionary {
    func decode<D: Decodable>(type: D.Type) throws -> D {
        do {
            let json = try JSONSerialization.data(withJSONObject: self)
            let decoder = JSONDecoder()
            let decodedObject = try decoder.decode(type, from: json)
            return decodedObject
        } catch {
            throw error
        }
    }
}
