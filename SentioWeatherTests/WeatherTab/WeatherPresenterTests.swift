//
//  WeatherPresenterTests.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import XCTest
@testable import SentioWeather

class WeatherPresenterTests: XCTestCase {
    var router: WeatherTabRouterMock!
    var presenter: WeatherTabPresenter!
    override func setUp() {
        super.setUp()
        router = WeatherTabRouterMock()
        presenter = WeatherTabPresenter(router: router)
    }
    
    override func tearDown() {
        super.tearDown()
        router = nil
        presenter = nil
    }
    
    func testOnViewWillAppear() {
        // arrange
        
        // act
        presenter.onViewWillAppear()
        
        // assert
        XCTAssertTrue(router.invocations.contains { $0 == .setupTabBar })
    }
}
