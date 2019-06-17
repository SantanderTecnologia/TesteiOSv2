//
//  NetworkAlamofire.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright © 2019 Gabriel Faustino. All rights reserved.
//

import Alamofire

public class NetworkLayerAlamofire: NetworkLayer {
    
    public var isConnectedToInternet: Bool {
        get {
            guard let reachability = NetworkReachabilityManager() else {return true}
            return reachability.isReachable
        }
    }
    
    public init(){}
    
    public func get(_ url: URL, headers: [String : String]?, completion: @escaping (NetworkResult<Data>) -> Void) {
        guard isConnectedToInternet else {
            let error = Errors.noConnectionError({ self.get(url, headers: headers, completion: completion) })
            completion(.failure(error))
            return
        }
        
        request(url, method: .get, headers: headers).response { response in
            self.logResponse(response)
            if let error = response.error {
                completion(.failure(error))
            }
            
            guard let data = response.data else {
                completion(.failure(Errors.serverError(nil)))
                return
            }
            
            completion(.success(data))
        }
    }
    
    public func get<T>(_ url: URL, model: T.Type, headers: [String : String]?, completion: @escaping (NetworkResult<T>) -> Void) where T: Codable {
        get(url, headers: headers, completion: { result in
            switch result {
            case .success(let data):
                do {
                    let resultObjc = try JSONDecoder().decode(model, from: data)
                    completion(.success(resultObjc))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let err):
                completion(.failure(err))
            }
        })
    }
    
    public func post(_ url: URL, params: [String : Any], headers: [String : String]?, completion: @escaping (NetworkResult<Data>) -> Void) {
        guard isConnectedToInternet else {
            let error = Errors.noConnectionError({ self.post(url, params: params, headers: headers, completion: completion) })
            completion(.failure(error))
            return
        }
        
        request(url, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: headers).response { response in
            self.logResponse(response)
            if let error = response.error {
                completion(.failure(error))
            }
            
            guard let data = response.data else {
                completion(.failure(Errors.serverError(nil)))
                return
            }
            
            completion(.success(data))
        }
    }
    
    public func post<T: Codable>(_ url: URL, model: T.Type, params: [String : Any], headers: [String : String]?, completion: @escaping (NetworkResult<T>) -> Void) {
        post(url, params: params, headers: headers, completion: { result in
            switch result {
            case .success(let data):
                do {
                    let resultObjc = try JSONDecoder().decode(model, from: data)
                    completion(.success(resultObjc))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let err):
                completion(.failure(err))
            }
        })
    }
    
    private func logResponse(_ response: (Alamofire.DefaultDataResponse)) {
        print("\n\n<+==== Request (\(response.request?.url?.absoluteString ?? "")) ====+>")
        print("method: \(String(describing: response.request?.httpMethod))")
        print("headers: \(String(describing: response.request?.allHTTPHeaderFields))")
        if let data = response.request?.httpBody, let dataString = String(data: data, encoding: .utf8) {
            print("requestBody: \(dataString)")
        }
        print("<+==== Response ====+>")
        print("statusCode: \(response.response?.statusCode ?? 0)")
        if let data = response.data, let dataString = String(data: data, encoding: .utf8) {
            print("responseBody: \(dataString)")
        }
        print("<+==== End ====+>")
    }
}
