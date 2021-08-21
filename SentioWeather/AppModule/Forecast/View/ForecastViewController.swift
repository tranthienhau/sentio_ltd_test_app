//
//  ForecaseViewController.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import UIKit

protocol ForecastView {
    func showError(title: String, message: String)
    func showData(viewModels: [ForecastViewModel])
}

class ForecastViewController: UIViewController {
    var presenter: ForecastPresenting?
    private var viewModels: [ForecastViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppreance()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }

    private func setupAppreance() {
        navigationController?.isNavigationBarHidden = true
    }

    private func setupTableView() {
        // tableView.reloadData()
    }
}

extension ForecastViewController: ForecastView {
    func showError(title _: String, message _: String) {}
    func showData(viewModels _: [ForecastViewModel]) {}
}

extension ForecastViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return viewModels.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels[section].items.count
    }

    func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        // TODO:
        return UITableViewCell()
    }
}
