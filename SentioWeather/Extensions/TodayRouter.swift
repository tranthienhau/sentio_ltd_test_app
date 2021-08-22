//
//  TodayRouter.swift
//  SentioWeather
//
//  Created by DatNguyen on 22/08/2021.
//

import UIKit

protocol TodayRoutering {
    func presentShareAction(with param: [UIImage])
}

class TodayRouter {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension TodayRouter: TodayRoutering {
    func presentShareAction(with param: [UIImage]) {
        let activity = UIActivityViewController(activityItems: param, applicationActivities: nil)
        viewController?.present(activity, animated: true)
    }
}
