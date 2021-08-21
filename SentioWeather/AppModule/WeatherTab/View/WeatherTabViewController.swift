//
//  WeatherTabViewController.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import UIKit

class WeatherTabViewController: UITabBarController {
    var presenter: WeatherTabPresenting?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppreance()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }

    private func setupAppreance() {
        navigationController?.isNavigationBarHidden = true
    }
}
