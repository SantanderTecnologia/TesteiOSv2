//
//  APIManager.swift
//  TesteiOSV2
//
//  Created by Julio Cezar de Souza on 30/05/20.
//  Copyright © 2020 Julio Souza. All rights reserved.
//

import Foundation
import UIKit
import Network

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        return components
    }
    
    var request: URLRequest {
        guard let url = URL(string: "\(base)\(path)") else { return URLRequest(url: urlComponents.url!) }
        return URLRequest(url: url)
    }
}

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case jsonParsingFailure
    case serverError(data: Data)
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Erro de requisição"
        case .jsonConversionFailure: return "Objetos mapeados e retorno do serviço estão diferentes"
        case .jsonParsingFailure: return "Erro ao converter objetos"
        case .invalidData: return "Retorno inválido"
        case .serverError (let data):
            do {
                let genericError = try JSONDecoder().decode(ServerError.self, from: data)
                return genericError.error
            } catch {
                return "Erro desconhecido"
            }
        }
    }
}

struct ServerError: Codable {
    let error: String
}

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}

protocol APIClient {
    
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void)
}

extension APIClient {
    
    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    
    func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {

        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            if (200 ..< 300).contains (httpResponse.statusCode) {
                
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                    
                } else {
                    completion(nil, .invalidData)
                }
            }
        }
        return task
    }
    
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void) {
        
        let task = self.decodingTask(with: request, decodingType: T.self) { (json, error) in
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(Result.failure(error))
                    } else {
                        completion(Result.failure(.invalidData))
                    }
                    return
                }
                if let value = decode(json) {
                    completion(.success(value))
                } else {
                    completion(.failure(.jsonParsingFailure))
                }
            }
        }
        task.resume()
    }
}
