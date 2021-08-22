//
//  ErrorView.swift
//  SentioWeather
//
//  Created by DatNguyen on 22/08/2021.
//

import UIKit

class ErrorView: UIViewController {
    @IBOutlet var lbTitleError: UILabel!
    @IBOutlet var lbError: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setError(title: String, message: String) {
        lbTitleError.text = title
        lbError.text = message
    }
}
