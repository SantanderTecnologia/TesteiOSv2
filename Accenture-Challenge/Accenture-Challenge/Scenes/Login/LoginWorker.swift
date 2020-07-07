//
//  LoginWorker.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import Foundation

protocol LoginWorkerProtocol {
    func fetchLogin(request: Login.Info.LoginRequest, completion: @escaping LoginResponseCallback)
}

enum LoginResponse {
    case success(Login.Info.LoginResponse)
    case error(Error)
    case genericError
}

class LoginWorker: LoginWorkerProtocol {
    
    func fetchLogin(request: Login.Info.LoginRequest, completion: @escaping LoginResponseCallback) {
        let body = "user=\(request.user)&password=\(request.password)"
        let endpoint = EndPoint.login
        let httpMethod = HttpMethod.post
        
        APIProvider.shared.request(body: body,
                                   httpMethod: httpMethod,
                                   endpoint: endpoint) { response in
                                    switch response {
                                    case .sucess(let data):
                                        do {
                                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                                if let user = json["userAccount"] as? [String : Any] {
                                                    let userJSON = try JSONSerialization.data(withJSONObject: user, options: [])
                                                    let jsonModel = try JSONDecoder().decode(Login.Info.LoginResponse.self,
                                                    from: userJSON)
                                                    completion(.success(jsonModel))
                                                }
                                            }
                                        } catch {
                                            completion(.genericError)
                                        }
                                        break
                                    case .clientError(let error):
                                        completion(.error(error))
                                        break
                                    case .urlNotFound:
                                        completion(.genericError)
                                        break
                                    case .errorToFetchData:
                                        completion(.genericError)
                                    }
        }
    }
}
