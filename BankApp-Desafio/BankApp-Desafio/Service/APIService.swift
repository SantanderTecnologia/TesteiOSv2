//
//  APIService.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/27/21.
//

import Foundation

enum API {
    static let baseURL = "https://bank-app-test.herokuapp.com/api"
    enum Path {
        static let login = API.baseURL + "/login"
        static let statements = API.baseURL + "/statements/1"
    }
}

enum ServiceError: Error {
    case invalidData
    case invalidURL
    case unknown(Error?)
}

//MARK: APIService
class APIService {
    let session = URLSession.shared
    
    //MARK: GET
    func get(url: URL?, completion: @escaping (Result<Data, ServiceError>) -> Void) {
        guard let url = url else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        self.dataTask(with: request, completion: completion)
    }
    
    //MARK: POST
    func post(params: [String: Any], url: URL?, completion: @escaping (Result<Data, ServiceError>) -> Void) {
        guard let url = url else {
            completion(.failure(.invalidURL))
            return
        }
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        
        self.dataTask(with: request, completion: completion)
    }
    
    private func dataTask(with request: URLRequest, completion: @escaping (Result<Data, ServiceError>) -> Void) {
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            guard let validData = data else {
                completion(.failure(.invalidData))
                return
            }
            completion(.success(validData))
        }.resume()
    }
}
