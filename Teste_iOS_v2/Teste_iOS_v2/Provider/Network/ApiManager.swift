//
//  ApiManager.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 03/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

class ApiManager {
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 25.0
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func makeRequest(endpoint: Constants.EndPoints, parameters: RequestParameters, success: @escaping GenericResponse, failure: @escaping EmptyClosure) {
        switch parameters.method {
        case .post:
            postRequest(endpoint: endpoint, parameters: parameters, success: success, failure: failure)
        case .get:
            getRequest(endpoint: endpoint, parameters: parameters, success: success, failure: failure)
        }
    }
    
    private class func getRequest(endpoint: Constants.EndPoints, parameters: RequestParameters, success: @escaping GenericResponse, failure: @escaping EmptyClosure) {
        guard let url = URL(string: endpoint.url) else {
            failure()
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else { failure(); return }
                guard let data = data else { failure(); return }
                guard let response = response as? HTTPURLResponse else { failure(); return}
                if response.statusCode == 200 {
                    success(data)
                } else {
                    failure()
                }
            }
        }.resume()
    }
    
    private class func postRequest(endpoint: Constants.EndPoints, parameters: RequestParameters, success: @escaping GenericResponse, failure: @escaping EmptyClosure) {
        guard let url = URL(string: endpoint.url) else {
            failure()
            return
        }
        
        var request = URLRequest(url: url)
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = parameters.body
        request.httpMethod = parameters.method.rawValue
        request.httpBody = requestBodyComponents.query?.data(using: .utf8)
        
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else { failure(); return }
                guard let data = data else { failure(); return }
                guard let response = response as? HTTPURLResponse else { failure(); return}
                if response.statusCode == 200 {
                    success(data)
                } else {
                    failure()
                }
            }
        }.resume()
    }
}
