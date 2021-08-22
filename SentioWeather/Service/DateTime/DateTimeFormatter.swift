//
//  DateTimeFormatter.swift
//  SentioWeather
//
//  Created by Duy Nguyen on 8/21/21.
//

import Foundation

protocol DateTimeFormatting {
    func date(from timestamp: Double) -> Date
    func time(from timestamp: Double) -> String
    func isSameDate(lhs: Date, rhs: Date) -> Bool
    func relativeDate(lhs: Date, rhs: Date) -> String
}

final class DateTimeFormatter: DateTimeFormatting {
    let dateFormatter = DateFormatter()

    func date(from timestamp: Double) -> Date {
        Date(timeIntervalSince1970: timestamp)
    }

    func isSameDate(lhs: Date, rhs: Date) -> Bool {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = NSTimeZone(name: "GMT")! as TimeZone
        return calendar.compare(lhs, to: rhs, toGranularity: .day) == .orderedSame
    }

    func time(from timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        dateFormatter.timeZone = .current
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }

    func relativeDate(lhs: Date, rhs: Date) -> String {
        if isSameDate(lhs: lhs, rhs: rhs) {
            return "Today"
        }
        guard (lhs - rhs).day != nil else { return "" }
        dateFormatter.timeZone = .current
        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: lhs)
    }
}

extension Date {
    static func - (recent: Date, previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second

        return (month: month, day: day, hour: hour, minute: minute, second: second)
    }
}
