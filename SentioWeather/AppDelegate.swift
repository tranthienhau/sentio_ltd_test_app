//
//  AppDelegate.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.

        // Setup dependencies
        setupDependencies()

        let view = WeatherTabBuilder.build()
        let navigationController = UINavigationController(rootViewController: view)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    private func setupDependencies() {
        let dependencyContainer = DependencyContainer.sharedInstance
        dependencyContainer.registerDefaultServices()
    }
}
