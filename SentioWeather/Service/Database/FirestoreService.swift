//
//  FirestoreService.swift
//  SentioWeather
//
//  Created by Hau Tran on 8/22/21.
//

import Firebase
import Foundation

enum FirestoreServiceError: Error {
    case save
    case fetch
    case decode
}

final class FirestoreService: DatabaseServicing {
    private var firestore: Firestore
    init() {
        firestore = Firestore.firestore()
        setupFirestore()
    }

    private func setupFirestore() {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        firestore.settings = settings
    }

    func save<T>(
        object: T,
        dbName: String,
        completion: ((Result<Void, Error>) -> Void)?
    ) where T: Decodable, T: Encodable {
        guard var data = object.dictionary else { return }
        data["device_id"] = UIDevice.current.identifierForVendor?.uuidString
        data["timestamp"] = Date().timeIntervalSince1970
        _ = firestore.collection(dbName).addDocument(data: data) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion?(.failure(FirestoreServiceError.save))
            } else {
                completion?(.success(()))
            }
        }
    }

    func fetch<T>(
        dbName: String,
        queryParams: DatabaseQueryParams,
        completion: @escaping (Result<T, Error>) -> Void
    ) where T: Decodable, T: Encodable {
        let query = firestore.collection(dbName)
        if let whereFields = queryParams.whereFields {
            for (field, value) in whereFields {
                query.whereField(field, isEqualTo: value)
            }
        }
        if let orderBy = queryParams.orderBy {
            query.order(by: orderBy, descending: !queryParams.acsending)
        }
        query.getDocuments { querySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(FirestoreServiceError.fetch))
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let object = try document.data().decode(type: T.self)
                        completion(.success(object))
                    } catch {
                        completion(.failure(FirestoreServiceError.decode))
                    }
                }
            }
        }
    }
}
