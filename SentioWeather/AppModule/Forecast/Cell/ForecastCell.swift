//
//  ForecastCell.swift
//  SentioWeather
//
//  Created by DatNguyen on 21/08/2021.
//

import UIKit

struct ForecastCellViewModel {
    let temperature: String
    let description: String
    let iconUrl: String
    // ...
}

class ForecastCell: UITableViewCell {
    @IBOutlet var ivWeather: UIImageView!
    @IBOutlet var lbTime: UILabel!
    @IBOutlet var lbWeather: UILabel!
    @IBOutlet var lbTemperature: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(viewModel: ForecastCellViewModel) {
    }
}
