//
//  ForecastPresenterTests.swift
//  SentioWeatherTests
//
//  Created by Duy Nguyen on 8/22/21.
//

import XCTest
@testable import SentioWeather

class ForecastPresenterTests: XCTestCase {
    var interactor: ForecastInteractorMock!
    var view: ForecastViewMock!
    var mapper: ForecastViewModelMapperMock!
    var presenter: ForecastPresenter!
    
    override func setUp() {
        super.setUp()
        interactor = ForecastInteractorMock()
        view = ForecastViewMock()
        mapper = ForecastViewModelMapperMock()
        presenter = ForecastPresenter(view: view, interactor: interactor, mapper: mapper)
    }

    override func tearDown() {
        super.tearDown()
        interactor = nil
        view = nil
        mapper = nil
        presenter = nil
    }
    
    func testOnViewWillAppearWhenFailed() {
        // arrange
        interactor.result = .failure(MockError.sampleError)
        
        // act
        presenter.onViewWillAppear()
        
        // assert
        XCTAssertTrue(interactor.invocations.contains { $0 == .weatherData })
        XCTAssertFalse(mapper.invocations.contains { $0 == .forecastViewModels })
        XCTAssertTrue(view.invocations.contains { $0 == .showError })
    }
    
    func testOnViewWillAppearWhenSucceed() {
        // arrange
        interactor.result = .success(weatherForecastResponse)
        
        // act
        presenter.onViewWillAppear()
        
        // assert
        XCTAssertTrue(interactor.invocations.contains { $0 == .weatherData })
        XCTAssertTrue(mapper.invocations.contains { $0 == .forecastViewModels })
        XCTAssertTrue(view.invocations.contains { $0 == .showData })
    }
}
