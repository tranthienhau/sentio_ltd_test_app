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
    @IBOutlet weak var stackMain: UIStackView!
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
        vTopBar.setTitleWith(title: "Today", font: nil, color: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }

    // MARK: - Button Action
    @IBAction func btnShare_Action(_ sender: UIButton) {
        sender.isHidden = true
        let imageScreenshot = UIImage.init(view: stackMain)
        presenter?.btnShareTap(param: imageScreenshot)
        sender.isHidden = false
    }

}

extension TodayViewController: TodayView {
    func showError(title: String, message: String) {
        showErrorView(title: title, message: message)
    }

    func showData(viewModel: TodayViewModel) {
        ivWeather.sd_setImage(with: URL(string: viewModel.icon), completed: nil)
        lbLocation.text = viewModel.locationName
        lbTemperature.text = viewModel.temperature
        lbWeather.text = viewModel.mainWeather
        vPop.setData(image: AppImages.iconPop!, infor: viewModel.pop)
        vRain.setData(image: AppImages.iconRain!, infor: viewModel.rain)
        vGrndLevel.setData(image: AppImages.iconGrndLevel!, infor: viewModel.groundLevel)
        vWindspeed.setData(image: AppImages.iconWindspeed!, infor: viewModel.windSpeed)
        vSys.setData(image: AppImages.iconSys!, infor: viewModel.sys)
    }
}
