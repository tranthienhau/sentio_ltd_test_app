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

    private var titleError: String?
    private var errorDescription: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        lbTitleError.text = titleError
        lbError.text = errorDescription
    }

    func setError(title: String, error: String) {
        titleError = title
        errorDescription = error
    }
}
