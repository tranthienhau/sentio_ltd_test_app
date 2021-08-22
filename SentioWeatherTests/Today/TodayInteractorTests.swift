//
//  TodayInteractorTests.swift
//  SentioWeatherTests
//
//  Created by Hau Tran on 8/22/21.
//

import Nimble
@testable import SentioWeather
import XCTest

class TodayInteractorTests: XCTestCase {
    var interactor: TodayInteractor!
    var service: WeatherServiceMock!
    var locationService: LocationServiceMock!

    var error: Error?
    var response: WeatherForecastResponse?

    override func setUp() {
        super.setUp()
        service = WeatherServiceMock()
        locationService = LocationServiceMock()
        interactor = TodayInteractor(service: service, locationService: locationService)
    }

    override func tearDown() {
        super.tearDown()
        service = nil
        locationService = nil
        interactor = nil
        error = nil
    }

    func testWeatherDataWhenLocationFailed() {
        // arrange
        locationService.result = .failure(MockError.sampleError)
        service.result = .failure(MockError.sampleError)

        // act
        interactor.weatherData { result in
            switch result {
            case let .failure(error):
                self.error = error
            case let .success(response):
                self.response = response
            }
        }

        // assert
        expect(self.error).toEventuallyNot(beNil())
        expect(self.response).toEventually(beNil())
    }

    func testWeatherDataWhenLocationIsZero() {
        // arrange
        locationService.result = .success((0.0, 0.0))
        service.result = .failure(MockError.sampleError)

        // act
        interactor.weatherData { result in
            switch result {
            case let .failure(error):
                self.error = error
            case let .success(response):
                self.response = response
            }
        }

        // assert
        expect(self.error).toEventuallyNot(beNil())
        expect(self.response).toEventually(beNil())
    }

    func testWeatherDataWhenFailed() {
        // arrange
        locationService.result = .success((1.0, 1.0))
        service.result = .failure(MockError.sampleError)

        // act
        interactor.weatherData { result in
            switch result {
            case let .failure(error):
                self.error = error
            case let .success(response):
                self.response = response
            }
        }

        // assert
        expect(self.response).toEventually(beNil())
        expect(self.error).toEventuallyNot(beNil())
    }

    func testWeatherDataWhenSucceed200() {
        // arrange
        locationService.result = .success((1.0, 1.0))
        service.result = .success(weatherResponse(status: 200))

        // act
        interactor.weatherData { result in
            switch result {
            case let .failure(error):
                self.error = error
            case let .success(response):
                self.response = response
            }
        }

        // assert
        expect(self.response).toEventuallyNot(beNil())
        expect(self.error).toEventually(beNil())
    }

    func testWeatherDataWhenSucceed201() {
        // arrange
        locationService.result = .success((1.0, 1.0))
        service.result = .success(weatherResponse(status: 201))

        // act
        interactor.weatherData { result in
            switch result {
            case let .failure(error):
                self.error = error
            case let .success(response):
                self.response = response
            }
        }

        // assert
        expect(self.response).toEventually(beNil())
        expect(self.error).toEventuallyNot(beNil())
        expect(self.error).toEventually(matchError(WeatherRepositoryError.failedRequest))
    }
}
