//
//  ForecastHeader.swift
//  SentioWeather
//
//  Created by DatNguyen on 22/08/2021.
//

import UIKit

class ForecastHeader: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbDay: UILabel!

    private var dateString: String?

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
        Bundle.main.loadNibNamed("ForecastHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        lbDay.text = dateString
    }

    func update(day: String) {
        lbDay.text = day
    }
}
