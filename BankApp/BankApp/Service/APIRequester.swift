//
//  APIRequester.swift
//  SwiftUtils
//
//  Created by Bruno Maciel on 8/15/20.
//  Copyright © 2020 brunomaciel. All rights reserved.
//

import UIKit

enum APIError {
    case urlError
    case taskError(_ error: Error)
    case noResponse
    case responseStatusCode(code: Int)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
    case head = "HEAD"
}

struct RestResponse {
    enum ResponseResult {
        case success, failure(APIError)
    }
    var data: Data?
    var statusCode: Int
    var result: ResponseResult
}

class APIRequester {
    private static let basePath = "https://bank-app-test.herokuapp.com/api"
    private static let session = URLSession.shared
    
    
    // MARK: - Metodos de Acesso a API
    
    static func request(_ jsonData: Data?, method: HTTPMethod, on resourcePath: String, headers: [String: String]?, completion: @escaping (RestResponse) -> Void) {
        var response = RestResponse(data: nil, statusCode: 0, result: .success)
        
        // Create Url
        let completePath = basePath + resourcePath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        guard let url = URL(string: completePath) else {
            print("\nErro na criação da url")
            response.result = .failure(.urlError)
            completion(response)
            return }
        
        // Create Request
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let body = jsonData { request.httpBody = body }
        if let header = headers { request.allHTTPHeaderFields = header }
        
        
        // Create Task
        let dataTask = session.dataTask(with: request) { (responseData: Data?, urlResponse: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                // DataTask Error
                if let error = error {
                    print("\nErro na criação do DataTask: \n\(error)")
                    response.result = .failure(.taskError(error))
                    completion(response)
                    return }
                
                // No-Response Error
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    print("\nErro na obtenção da response")
                    response.result = .failure(.noResponse)
                    completion(response)
                    return }
                
                response.data = responseData
                response.statusCode = httpResponse.statusCode
                
                // Status Code != 2xx
                guard (200...299).contains(response.statusCode) else {
                    response.result = .failure(.responseStatusCode(code: response.statusCode))
                    completion(response)
                    return }
                
                response.result = .success
                completion(response)
            }
        }
        dataTask.resume()
    }
    
}
