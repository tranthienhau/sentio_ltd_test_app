//
//  TodayRouter.swift
//  SentioWeather
//
//  Created by Hau Tran on 22/08/2021.
//

import UIKit

protocol TodayRouting {
    func presentShareView(with param: UIImage)
}

class TodayRouter {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension TodayRouter: TodayRouting {
    func presentShareView(with param: UIImage) {
        let activity = UIActivityViewController(activityItems: [param], applicationActivities: nil)
        viewController?.present(activity, animated: true)
    }
}
