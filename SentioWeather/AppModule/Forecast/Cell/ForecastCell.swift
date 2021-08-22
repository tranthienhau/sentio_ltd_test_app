//
//  ForecastCell.swift
//  SentioWeather
//
//  Created by DatNguyen on 21/08/2021.
//

import SDWebImage
import UIKit

struct ForecastCellViewModel {
    let temperature: String
    let description: String
    let iconUrl: String
    let time: String
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

    func update(viewModel data: ForecastCellViewModel) {
        ivWeather.sd_setImage(with: URL(string: data.iconUrl), completed: nil)
        lbTime.text = data.time
        lbTemperature.text = data.temperature
        lbWeather.text = data.description
    }
}
