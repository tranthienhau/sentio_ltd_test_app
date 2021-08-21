//
//  TodayViewController.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import UIKit
import SDWebImage

protocol TodayView: AnyObject {
    func showError(title: String, message: String)
    func showData(viewModel: TodayViewModel)
}

class TodayViewController: UIViewController {

    @IBOutlet weak var vTopBar: TopBarView!
    @IBOutlet weak var ivWeather: UIImageView!
    @IBOutlet weak var lbLocation: UILabel!
    @IBOutlet weak var lbTemperature: UILabel!
    @IBOutlet weak var lbWeather: UILabel!
    @IBOutlet weak var vPop: WeatherInfoItemView!
    @IBOutlet weak var vRain: WeatherInfoItemView!
    @IBOutlet weak var vGrndLevel: WeatherInfoItemView!
    @IBOutlet weak var vWindspeed: WeatherInfoItemView!
    @IBOutlet weak var vSys: WeatherInfoItemView!

    var presenter: TodayPresenting?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppreance()
    }

    private func setupAppreance() {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vTopBar.setTitleWith(title: "Today", font: nil, color: nil)
        presenter?.onViewWillAppear()
    }
}

extension TodayViewController: TodayView {
    func showError(title _: String, message _: String) {
        // TODO:
    }

    func showData(viewModel: TodayViewModel) {
        ivWeather.sd_setImage(with: URL(string: viewModel.icon), completed: nil)
        lbLocation.text = viewModel.locationName
        lbTemperature.text = viewModel.temperature
        lbWeather.text = viewModel.mainWeather
        // TODO: fix??
        vPop.setDataWheather(image: AppImages.iconPop!, infor: "\(viewModel.pop * 100)%")
        vRain.setDataWheather(image: AppImages.iconRain!, infor: "\(viewModel.rain) mm")
        vGrndLevel.setDataWheather(image: AppImages.iconGrndLevel!, infor: "\(viewModel.grndLevel) hPa")
        vWindspeed.setDataWheather(image: AppImages.iconWindspeed!, infor: "\(viewModel.windSpeed) km/h")
        vSys.setDataWheather(image: AppImages.iconSys!, infor: viewModel.sys.uppercased())
    }
}
