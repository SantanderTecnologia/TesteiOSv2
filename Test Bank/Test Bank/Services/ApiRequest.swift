//
//  ApiRequest.swift
//  Test Bank
//
//  Created by Lucas Santana Brito on 21/06/20.
//  Copyright © 2020 lsb. All rights reserved.
//

import Foundation

class ApiRequest {
    static let shared = ApiRequest()
    
    let urlBaseString = "https://bank-app-test.herokuapp.com/api/"
    
    func doLogin(userLogin: Login.Request, completion: @escaping (ApiResult<Data>) -> Void) {
        
        let urlString = urlBaseString + "login"
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "user=\(userLogin.user)&password=\(userLogin.password)".data(using: .utf8)

        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let this = self else {
                completion(.failure(.unknown("ApiRequest error")))
                return
            }
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
                return
            }
            
            guard let dataResponse = data else {
                completion(.failure(.brokenData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown("Could not cast to HTTPURLResponse")))
                return
            }
            
            let result = this.handler(statusCode: httpResponse.statusCode, dataResponse: dataResponse)
            completion(result)
            
        }.resume()
    }
    
    func getStatements(userId: Int, completion: @escaping (ApiResult<Data>) -> Void) {
        let urlString = urlBaseString + "statements/\(userId)"
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let this = self else {
                completion(.failure(.unknown("ApiRequest error")))
                return
            }
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
                return
            }
            
            guard let dataResponse = data else {
                completion(.failure(.brokenData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown("Could not cast to HTTPURLResponse")))
                return
            }
            
            let result = this.handler(statusCode: httpResponse.statusCode, dataResponse: dataResponse)
            completion(result)
            
        }.resume()
    }
    
    private func handler(statusCode: Int, dataResponse: Data) -> ApiResult<Data> {
        switch statusCode {
            case 200...299:
                return ApiResult.success(dataResponse)

            case 403:
                return ApiResult.failure(.authenticationRequired)

            case 404:
                return ApiResult.failure(.couldNotFindHost)

            case 500:
                return ApiResult.failure(.badRequest)

            default:
                return ApiResult.failure(.unknown(""))
        }
    }
}
