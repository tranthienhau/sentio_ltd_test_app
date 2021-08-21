//
//  TodayViewController.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import UIKit

protocol TodayView: AnyObject {
    func showError(title: String, message: String)
    func showData(viewModel: TodayViewModel)
}

class TodayViewController: UIViewController {
    var presenter: TodayPresenter?

class TodayViewController: UIViewController {
    
    var presenter : TodayViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppreance()
    }

    private func setupAppreance() {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}

extension TodayViewController: TodayView {
    func showError(title _: String, message _: String) {
        // TODO:
    }

    func showData(viewModel _: TodayViewModel) {
        // TODO:
    }
}

extension TodayViewController : TodayViewControllerProtocol {
    
}
