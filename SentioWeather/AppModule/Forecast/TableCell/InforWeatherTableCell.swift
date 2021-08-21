//
//  InforWeatherTableCell.swift
//  SentioWeather
//
//  Created by DatNguyen on 21/08/2021.
//

import UIKit

class InforWeatherTableCell: UITableViewCell {

    @IBOutlet weak var ivWeather: UIImageView!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbWeather: UILabel!
    @IBOutlet weak var lbTemperature: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
