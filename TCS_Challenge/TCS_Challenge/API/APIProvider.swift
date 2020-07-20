//
//  APIProvider.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

enum EndPoint {
    case login
    case statements(String)
    
    func getPath() -> String {
        switch self {
        case .login:
            return "login"
        case .statements(let id):
            return "statements/\(id)"
        }
    }
}

enum APIResponse {
    case sucess(Data)
    case error(Error)
    case urlNotFound
    case missingData
}

class APIProvider {
    
    static let shared = APIProvider()
    
    private let baseURL = "https://bank-app-test.herokuapp.com/api/"
    
    private init() {}
    
    /// Method to perform requests to the server api
    /// - Parameters:
    ///   - body: Request body content
    ///   - method: HTTP method
    ///   - endPoint: Operation to perform
    ///   - completion: APIResponse with the completion status of the operation
    func request(body: String,
                 method: HttpMethod,
                 endPoint: EndPoint,
                 completion: @escaping ((APIResponse) -> Void)) {
        
        guard let request = asURLRequest(body: body, method: method, endPoint: endPoint) else {
            completion(.urlNotFound)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            
            if let error = error {
                completion(.error(error))
                return
            }
            
            guard let data = data else {
                completion(.missingData)
                return
            }
            
            completion(.sucess(data))
        }
        task.resume()
    }
    
    private func asURLRequest(body: String,
                              method: HttpMethod,
                              endPoint: EndPoint) -> URLRequest? {
        
        let urlString = baseURL + endPoint.getPath()
        
        // failed to create URL from string
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpBody = body.data(using: .utf8)
        request.httpMethod = method.rawValue
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}
