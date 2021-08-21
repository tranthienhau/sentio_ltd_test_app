//
//  ItemWheatherInforView.swift
//  SentioWeather
//
//  Created by DatNguyen on 21/08/2021.
//

import UIKit

class ItemWheatherInforView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var ivIconWheather: UIImageView!
    @IBOutlet weak var lbInforWeather: UILabel!
    
    //MARK: - SetUp Custom View
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    func setUpView() {
        Bundle.main.loadNibNamed("ItemWheatherInforView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func setDataWheather(image: UIImage, infor: String) {
        ivIconWheather.image = image
        lbInforWeather.text = infor
    }
}
