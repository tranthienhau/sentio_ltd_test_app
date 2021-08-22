//
//  UIViewController+Extension.swift
//  SentioWeather
//
//  Created by Hau Tran on 22/08/2021.
//

import UIKit

extension UIViewController {
    func showErrorView(title: String, message: String) {
        let errorView = ErrorView(nibName: "ErrorView", bundle: nil)
        _ = errorView.view
        errorView.setError(title: title, message: message)
        present(errorView, animated: true, completion: nil)
    }
}
