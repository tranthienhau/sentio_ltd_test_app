//
//  StringFormatterTests.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import XCTest
@testable import SentioWeather

final class StringFormatterTests: XCTestCase {
    var formatter: StringFormatter!
    override func setUp() {
        super.setUp()
        formatter = StringFormatter()
    }
    
    override func tearDown() {
        super.tearDown()
        formatter = nil
    }
    
    func testTemperatureCelcius() {
        // arrange
        let metric: TemperatureMetric = .celsius
        
        // act
        let temperature = formatter.temperature(temperature: 22.2467, metric: metric)
        
        // assert
        XCTAssertEqual(temperature, "22.25 °C")
    }
    
    func testTemperatureFahrenheit() {
        // arrange
        let metric: TemperatureMetric = .fahrenheit
        
        // act
        let temperature = formatter.temperature(temperature: 22.2467, metric: metric)
        
        // assert
        XCTAssertEqual(temperature, "22.25 °F")
    }
    
    func testIcon() {
        // arrange
        
        // act
        let icon1 = formatter.icon(name: "abc")
        let icon2 = formatter.icon(name: nil)
        
        // assert
        XCTAssertEqual(icon1, "http://openweathermap.org/img/w/abc.png")
        XCTAssertEqual(icon2, nil)
    }
    
    func testPop() {
        // arrange
        
        // act
        let pop1 = formatter.pop(value: 1.2467)
        let pop2 = formatter.pop(value: 1.2411)
        let pop3 = formatter.pop(value: nil)
        
        // assert
        XCTAssertEqual(pop1, "125.0%")
        XCTAssertEqual(pop2, "124.0%")
        XCTAssertNil(pop3)
    }
    
    func testWindSpeed() {
        // arrange
        
        // act
        let windSpeed1 = formatter.windSpeed(value: 22.2467)
        let windSpeed2 = formatter.windSpeed(value: nil)
        
        // assert
        XCTAssertEqual(windSpeed1, "22.25 km/h")
        XCTAssertNil(windSpeed2)
    }
    
    func testGroundLevel() {
        // arrange
        
        // act
        let groundLevel1 = formatter.groundLevel(value: 22)
        let groundLevel2 = formatter.groundLevel(value: nil)
        
        // assert
        XCTAssertEqual(groundLevel1, "22 hPa")
        XCTAssertNil(groundLevel2)
    }
    
    func testRain() {
        // arrange
        
        // act
        let rain1 = formatter.rain(value: 22.2467)
        let rain2 = formatter.rain(value: nil)
        
        // assert
        XCTAssertEqual(rain1, "22.25 mm")
        XCTAssertNil(rain2)
    }
}
