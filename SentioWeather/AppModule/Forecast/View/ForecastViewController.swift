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

    @IBOutlet weak var vTopbar: TopBarView!
    @IBOutlet weak var tblInforWeather: UITableView!

    var presenter: ForecastPresenting?
    private var viewModels: [ForecastViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppreance()
        setupUI()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }

    private func setupAppreance() {
        navigationController?.isNavigationBarHidden = true
    }

    private func setupUI() {
        vTopbar.setTitleWith(title: "Forecast", font: nil, color: nil)
    }

    private func setupTableView() {
        // tableView.reloadData()
    }
}

extension ForecastViewController: ForecastView {
    func showError(title: String, message: String) {
        self.showErrorView(title: title, error: message)
    }
    func showData(viewModels data: [ForecastViewModel]) {
        viewModels = data
        tblInforWeather.reloadData()
    }
}

extension ForecastViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return viewModels.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ForecastCell = tableView.dequeueReusableCell(
            withIdentifier: "ForecastCell",
            for: indexPath) as? ForecastCell ?? ForecastCell()
        let item = viewModels[indexPath.section].items[indexPath.row]
        cell.update(viewModel:
                        ForecastCellViewModel(
                            temperature: item.temperature,
                            description: item.description,
                            iconUrl: item.iconUrl ?? "",
                            time: item.time))
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewModel = viewModels[section]
        let headerView = ForecastHeader.init(frame: CGRect.zero)
        headerView.update(day: viewModel.header.title)
        return headerView
    }
}
