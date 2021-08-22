//
//  LocationService.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/22/21.
//

import CoreLocation
import Foundation

enum LocationServiceError: Error {
    case authorizationDenied
    case authorizationRestricted
    case unknownError
    case invalidCoordinate
    case customError(Error)
}

extension LocationServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .authorizationDenied:
            return "Location service is not enabled. Please enable to use the app."
        case .authorizationRestricted:
            return "Location service is restricted. Please enable to use the app."
        case .unknownError:
            return "Unexpected error"
        case .invalidCoordinate:
            return "User location is invalid"
        case let .customError(error):
            return error.localizedDescription
        }
    }
}

protocol LocationServicing {
    func userLocation(completion: @escaping (Result<(Double, Double), Error>) -> Void)
}

final class LocationService: NSObject, LocationServicing {
    let locationManager: CLLocationManager
    private var completion: ((Result<(Double, Double), Error>) -> Void)?
    private var cachedUserLocation: CLLocation?
    override init() {
        locationManager = CLLocationManager()
        super.init()
        setupLocationManager()
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func userLocation(completion: @escaping (Result<(Double, Double), Error>) -> Void) {
        self.completion = completion
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else {
            requestLocation()
        }
    }

    private func requestLocation() {
        if let cachedLocation = cachedUserLocation {
            completion?(.success((cachedLocation.coordinate.latitude, cachedLocation.coordinate.longitude)))
            return
        }
        locationManager.requestLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            requestLocation()
        case .denied:
            completion?(.failure(LocationServiceError.authorizationDenied))
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            completion?(.failure(LocationServiceError.authorizationRestricted))
        @unknown default:
            completion?(.failure(LocationServiceError.unknownError))
        }
    }

    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first else { return }
        completion?(.success((firstLocation.coordinate.latitude, firstLocation.coordinate.longitude)))
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_: CLLocationManager, didFailWithError error: Error) {
        completion?(.failure(error))
    }
}
