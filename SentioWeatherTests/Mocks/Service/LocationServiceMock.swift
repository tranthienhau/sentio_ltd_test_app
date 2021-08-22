//
//  LocationServiceMock.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import Foundation
@testable import SentioWeather

final class LocationServiceMock: LocationServicing {
    enum Invocation {
        case userLocation
    }
    var invocations: [Invocation] = []
    
    var result: Result<(Double, Double), Error> = .failure(MockError.sampleError)
    
    func userLocation(completion: @escaping (Result<(Double, Double), Error>) -> Void) {
        invocations.append(.userLocation)
        completion(result)
    }
}
