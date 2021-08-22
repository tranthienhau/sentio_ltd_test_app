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
    @IBOutlet var vTopbar: TopBarView!
    @IBOutlet var tableView: UITableView!

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
        vTopbar.setTitleWith(title: "Forecast", font: nil, color: nil)
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.register(UINib(nibName: "ForecastCell", bundle: nil), forCellReuseIdentifier: "ForecastCell")
    }
}

extension ForecastViewController: ForecastView {
    func showError(title: String, message: String) {
        showErrorView(title: title, message: message)
    }

    func showData(viewModels: [ForecastViewModel]) {
        self.viewModels = viewModels
        tableView.reloadData()
    }
}

extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        return viewModels.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath)
        let item = viewModels[indexPath.section].items[indexPath.row]
        (cell as? ForecastCell)?.update(viewModel: item)
        return cell
    }

    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewModel = viewModels[section]
        let headerView = ForecastHeader(frame: .zero)
        headerView.update(viewModel: viewModel.header)
        return headerView
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return 60
    }
}
