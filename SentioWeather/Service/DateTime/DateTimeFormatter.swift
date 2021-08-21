//
//  DateTimeFormatter.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Foundation

protocol DateTimeFormatting {
    func date(from timestamp: Double) -> Date
    func isSameDate(lhs: Date, rhs: Date) -> Bool
}

final class DateTimeFormatter: DateTimeFormatting {
    func date(from timestamp: Double) -> Date {
        Date(timeIntervalSince1970: timestamp)
    }

    func isSameDate(lhs: Date, rhs: Date) -> Bool {
        return Calendar.current.compare(lhs, to: rhs, toGranularity: .day) == .orderedSame
    }
}
