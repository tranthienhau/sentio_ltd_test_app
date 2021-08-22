//
//  WeatherInfoItemView.swift
//  SentioWeather
//
//  Created by DatNguyen on 21/08/2021.
//

import UIKit

class WeatherInfoItemView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var ivIconWeather: UIImageView!
    @IBOutlet var lbInforWeather: UILabel!

    // MARK: - SetUp Custom View

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }

    func setUpView() {
        Bundle.main.loadNibNamed("WeatherInfoItemView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setDataWheather(image: UIImage, infor: String) {
        ivIconWeather.image = image
        lbInforWeather.text = infor
    }
}
