//
//  File.swift
//  Networking
//
//  Created by Estaife Lima on 01/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//
import Foundation
import Alamofire
import Data

public final class AlamofireAdapter {
    private let session: Session
   
    public init(session: Session = .default) {
        self.session = session
    }
    
    private func handleSuccssesWith(statusCode: Int, and data: Data?) -> Result<Data?, HTTPError> {
        switch statusCode {
        case 204: return .success(nil)
        case 200...299: return .success(data)
        case 401: return .failure(.unauthorized)
        case 403: return .failure(.forbidden)
        case 300...399: return .failure(.noConnectivity)
        case 404: return .failure(.notFound)
        case 400...499: return .failure(.invalidRequest)
        case 500...599: return .failure(.internalServer)
        default: return .failure(.unknown)
        }
    }
}

extension AlamofireAdapter: HTTPPostClient {
    public func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, HTTPError>) -> Void) {
        session.request(url, method: .post, parameters: data?.json)
            .responseData { [weak self] response in
                guard let self = self else { return }
                guard let statusCode = response.response?.statusCode else { return completion(.failure(.unknown)) }
                switch response.result {
                case .success(let data):
                    completion(self.handleSuccssesWith(statusCode: statusCode, and: data))
                case .failure: completion(.failure(.unknown))
                }
        }
    }
}

extension AlamofireAdapter: HTTPGetClient {
    public func get(from url: URL, completion: @escaping (Result<Data?, HTTPError>) -> Void) {
        session.request(url, method: .get)
            .responseData { [weak self] response in
                guard let self = self else { return }
                guard let statusCode = response.response?.statusCode else { return completion(.failure(.unknown)) }
                switch response.result {
                case .success(let data):
                    completion(self.handleSuccssesWith(statusCode: statusCode, and: data))
                case .failure: completion(.failure(.unknown))
                }
        }
    }
}
