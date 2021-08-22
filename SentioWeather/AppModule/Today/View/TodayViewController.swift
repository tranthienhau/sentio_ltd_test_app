//
//  TodayViewController.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/21/21.
//

import SDWebImage
import UIKit

protocol TodayView: AnyObject {
    func showError(title: String, message: String)
    func showData(viewModel: TodayViewModel)
}

class TodayViewController: UIViewController {
    @IBOutlet var vTopBar: TopBarView!
    @IBOutlet var ivWeather: UIImageView!
    @IBOutlet var lbLocation: UILabel!
    @IBOutlet var lbTemperature: UILabel!
    @IBOutlet var lbWeather: UILabel!
    @IBOutlet var vPop: WeatherInfoItemView!
    @IBOutlet var vRain: WeatherInfoItemView!
    @IBOutlet var vGrndLevel: WeatherInfoItemView!
    @IBOutlet var vWindspeed: WeatherInfoItemView!
    @IBOutlet var vSys: WeatherInfoItemView!

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
    func showError(title: String, message: String) {
        self.showErrorView(title: title, error: message)
    }

    func showData(viewModel: TodayViewModel) {
        ivWeather.sd_setImage(with: URL(string: viewModel.icon), completed: nil)
        lbLocation.text = viewModel.locationName
        lbTemperature.text = viewModel.temperature
        lbWeather.text = viewModel.mainWeather
        vPop.setDataWheather(image: AppImages.iconPop!, infor: viewModel.pop)
        vRain.setDataWheather(image: AppImages.iconRain!, infor: viewModel.rain)
        vGrndLevel.setDataWheather(image: AppImages.iconGrndLevel!, infor: viewModel.grndLevel)
        vWindspeed.setDataWheather(image: AppImages.iconWindspeed!, infor: viewModel.windSpeed)
        vSys.setDataWheather(image: AppImages.iconSys!, infor: viewModel.sys.uppercased())
    }
}
