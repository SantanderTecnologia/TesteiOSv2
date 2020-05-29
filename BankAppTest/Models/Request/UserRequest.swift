//
//  UserRequest.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 18/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import UIKit

enum UserError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

class UserRequest {
    
    let baseURL = "https://bank-app-test.herokuapp.com/api/"
    
    func postSaving (_ messageToSave:LoginRequest,endpoint: String, completion: @escaping(Result<LoginResponse, UserError>) -> Void) {
        
        do {
            guard let path = URL(string: baseURL + endpoint) else {
                print("Invalid URL")
                return}
            
            var urlRequest = URLRequest(url: path)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            var requestBodyComponents = URLComponents()
            requestBodyComponents.queryItems = [URLQueryItem(name: "user", value: messageToSave.user),
                                                URLQueryItem(name: "password", value: messageToSave.password)]
            
            urlRequest.httpBody = requestBodyComponents.query?.data(using: .utf8)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    
                    return
                }
                do {
                    let messageData = try JSONDecoder().decode(LoginResponse.self, from: jsonData)
                    completion(.success(messageData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        }
    }
    
    func getSaving(endpoint: String ,completion: @escaping(Result<Wallet, UserError>) -> Void) {
        
        
        guard let path = URL(string: baseURL + endpoint) else {
            print("Invalid URL")
            return }
        
        var urlRequest = URLRequest(url: path )
        urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                completion(.failure(.responseProblem))
                
                return
            }
            do {
                let messageData = try JSONDecoder().decode(Wallet.self, from: jsonData)
                completion(.success(messageData))
            } catch {
                completion(.failure(.decodingProblem))
            }
        }
        dataTask.resume()
    }
}
