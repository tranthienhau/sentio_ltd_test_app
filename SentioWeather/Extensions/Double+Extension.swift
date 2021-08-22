//
//  Double+Extension.swift
//  SentioWeather
//
//  Created by Hau Tran on 22/08/2021.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
