//
//  WeatherTabViewController.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
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
        presenter?.onViewDidLoad()
    }

    private func setupAppreance() {
        navigationController?.isNavigationBarHidden = true
    }
}
