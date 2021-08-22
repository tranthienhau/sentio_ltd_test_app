//
//  ForecastCell.swift
//  SentioWeather
//
//  Created by Hau Tran on 21/08/2021.
//

import SDWebImage
import UIKit

class ForecastCell: UITableViewCell {
    @IBOutlet var ivWeather: UIImageView!
    @IBOutlet var lbTime: UILabel!
    @IBOutlet var lbWeather: UILabel!
    @IBOutlet var lbTemperature: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(viewModel: ForecastItemViewModel) {
        ivWeather.sd_setImage(with: URL(string: viewModel.iconUrl ?? ""), completed: nil)
        lbTime.text = viewModel.time
        lbTemperature.text = viewModel.temperature
        lbWeather.text = viewModel.description
    }
}
