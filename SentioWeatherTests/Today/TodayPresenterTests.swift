//
//  TodayPresenterTests.swift
//  SentioWeatherTests
//
//  Created by Hau Tran on 8/22/21.
//

@testable import SentioWeather
import XCTest

class TodayPresenterTests: XCTestCase {
    var interactor: TodayInteractorMock!
    var view: TodayViewMock!
    var mapper: TodayViewModelMapperMock!
    var router: TodayRouterMock!
    var presenter: TodayPresenter!

    override func setUp() {
        super.setUp()
        interactor = TodayInteractorMock()
        view = TodayViewMock()
        router = TodayRouterMock()
        mapper = TodayViewModelMapperMock()
        presenter = TodayPresenter(view: view, interactor: interactor, router: router, mapper: mapper)
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
        XCTAssertFalse(mapper.invocations.contains { $0 == .todayViewModel })
        XCTAssertTrue(view.invocations.contains { $0 == .showError })
    }

    func testOnViewWillAppearWhenSucceed() {
        // arrange
        interactor.result = .success(weatherForecastResponse)

        // act
        presenter.onViewWillAppear()

        // assert
        XCTAssertTrue(interactor.invocations.contains { $0 == .weatherData })
        XCTAssertTrue(mapper.invocations.contains { $0 == .todayViewModel })
        XCTAssertTrue(view.invocations.contains { $0 == .showData })
    }
    
    func testOnShare() {
        // arrange
        
        // act
        presenter.onShare(param: UIImage())
        
        // assert
        XCTAssertTrue(router.invocations.contains { $0 == .presentShareView })
    }
}
