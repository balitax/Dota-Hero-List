//
//  APIClient.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import RxSwift
import Alamofire
import RealmSwift

enum APIClientError: LocalizedError {
    case custom(String)
    case noConnection
    case cannotMapToObject
    case nilValue(String)
    
    var errorDescription: String? {
        switch self {
        case .custom(let description):
            return description
        case .noConnection:
            return "Koneksi Internet dibutuhkan untuk melakukan aksi ini"
        case .cannotMapToObject:
            return "Cannot map JSON into Decoodable Object"
        case .nilValue(let objectName):
            return "Value of object \(objectName) is null"
        }
        
    }
}

class APIClient {
    
    /// REQUEST API
    /// - Parameter router: router description
    /// - Parameter codable: codable description
    static func request<T: Codable>(with router: APIConfiguration, codable: T.Type) -> Observable<T> {
        return Observable<T>.create({ observer -> Disposable in
            
            let request = AF.request(router)
                .validate()
                .responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success:
                        
                        guard let data = response.data else { return }
                        do {
                            let decoded = try JSONDecoder().decode(T.self, from: data)
                            observer.onNext(decoded)
                        } catch (let error ) {
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                })
            
            return Disposables.create(with: {
                request.cancel()
            })
            
        })
    }
    
    static func request(with router: APIConfiguration) -> Single<Void> {
        return Single<Void>.create { emitter in
            let request = AF.request(router)
                .validate()
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success( _):
                        emitter(.success(()))
                    case .failure(let error):
                        emitter(.error(error))
                    }
                })
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    static func deleteLocalDatabase<T: Object>(_ object: T.Type) {
        if let data = Database.shared.get(type: object.self) {
            Database.shared.delete(objects: data)
        }
    }
    
}
