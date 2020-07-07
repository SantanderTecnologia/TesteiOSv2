//
//  APIProvider.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import Foundation

enum EndPoint {
    case login
    case statements(String)
    
    func getExtension() -> String {
        switch self {
        case .login: return "login"
        case .statements(let idUser): return "statements/\(idUser)"
        }
    }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum APIResponse {
    case sucess(Data)
    case clientError(Error)
    case urlNotFound
    case errorToFetchData
}

class APIProvider {
    
    static let shared = APIProvider()
    
    private let baseURL = "https://bank-app-test.herokuapp.com/api/"
    
    private init() { }
    
    func request(body: String,
                 httpMethod: HttpMethod,
                 endpoint: EndPoint,
                 completion: @escaping APIResponseCallback) {
        guard let request = getCompleteRequest(forBody: body,
                                               httpMethod: httpMethod,
                                               endPoint: endpoint) else {
            completion(.urlNotFound)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                if let error = error {
                    completion(.clientError(error))
                }
                return
            }
            guard let data = data else {
                completion(.errorToFetchData)
                return
            }
            completion(.sucess(data))
        }
        task.resume()
    }
}

extension APIProvider {
    
    private func getCompleteRequest(forBody body: String,
                                    httpMethod: HttpMethod,
                                    endPoint: EndPoint) -> URLRequest? {
        let urlStr = baseURL + endPoint.getExtension()
        guard let url = URL(string: urlStr) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body.data(using: .utf8)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        return request
    }
}
