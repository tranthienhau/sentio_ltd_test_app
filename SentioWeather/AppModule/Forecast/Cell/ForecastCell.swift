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

    @IBOutlet weak var ivWeather: UIImageView!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbWeather: UILabel!
    @IBOutlet weak var lbTemperature: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(viewModel: ForecastCellViewModel) {
    }
}
