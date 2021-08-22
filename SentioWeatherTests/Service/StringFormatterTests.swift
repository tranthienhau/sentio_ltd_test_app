//
//  DateTimeFormatterTests.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import XCTest
@testable import SentioWeather

final class DateTimeFormatterTests: XCTestCase {
    var formatter: DateTimeFormatter!
    override func setUp() {
        super.setUp()
        formatter = DateTimeFormatter()
    }
    
    override func tearDown() {
        super.tearDown()
        formatter = nil
    }
    
}
