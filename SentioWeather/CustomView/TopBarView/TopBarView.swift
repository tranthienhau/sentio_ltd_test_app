//
//  TopBarView.swift
//  SentioWeather
//
//  Created by Hau Tran on 21/08/2021.
//

import UIKit

class TopBarView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var lbTitle: UILabel!

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
        Bundle.main.loadNibNamed("TopBarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setTitleWith(title: String, font: UIFont?, color: UIColor?) {
        lbTitle.text = title
        lbTitle.font = font ?? UIFont.systemFont(ofSize: 16, weight: .bold)
        lbTitle.textColor = color ?? UIColor.black
    }
}
