//
//  UIViewController+Extension.swift
//  SentioWeather
//
//  Created by DatNguyen on 22/08/2021.
//

import UIKit

extension UIViewController {
    func showErrorView(title: String, error: String) {
        let errorView = ErrorView(nibName: "ErrorView", bundle: nil)
        errorView.setError(title: title, error: error)
        self.present(errorView, animated: true, completion: nil)
    }
}
