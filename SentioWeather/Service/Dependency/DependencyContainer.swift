//
//  DependencyContainer.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Swinject

class DependencyContainer {
    public static let sharedInstance = DependencyContainer()
    private let container = Container()

    func registerDefaultServices() {
        register(service: RestClient.self) { _ in
            RestClientImpl()
        }
    }

    func register<T>(service _: T.Type, factory: @escaping (Resolver) -> T) {
        container.register(T.self, factory: factory)
    }

    func getService<T>() -> T {
        return container.resolve(T.self)!
    }
}
