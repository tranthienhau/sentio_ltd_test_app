//
//  DependencyContainer.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Swinject

class DependencyContainer {
    static let sharedInstance = DependencyContainer()
    private let container = Container()

    func registerDefaultServices() {
        register(service: RestClient.self) { _ in
            RestClientImpl()
        }
        register(service: WeatherRepositoring.self) { resolver in
            WeatherRepository(restClient: resolver.resolve(RestClient.self)!)
        }
        register(service: DateTimeFormatting.self) { _ in
            DateTimeFormatter()
        }
        register(service: StringFormatting.self) { _ in
            StringFormatter()
        }
        register(service: WeatherServicing.self) { resolver in
            WeatherService(repository: resolver.resolve(WeatherRepositoring.self)!)
        }
        register(service: LocationServicing.self) { _ in
            LocationService()
        }
    }

    func register<T>(service _: T.Type, factory: @escaping (Resolver) -> T) {
        container.register(T.self, factory: factory)
    }

    func getService<T>() -> T {
        return container.resolve(T.self)!
    }
}
