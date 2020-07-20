//
//  LoginWorker.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

class LoginWorker {
    
    enum LoginResponse {
        case success(Login.Fetch.Response)
        case error(Error)
        case nonSpecifiedError
    }
    
    func performLogin(request: Login.Fetch.Request,
                      completion: @escaping (LoginResponse) -> Void) {
        
        let body = "user=\(request.user)&password=\(request.password)"
        
        APIProvider.shared.request(body: body, method: .post, endPoint: .login) {
            (response: APIResponse) in
            
            switch response {
            case .sucess(let data):
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                        completion(.nonSpecifiedError)
                        return
                    }
                    
                    if let userDictionary = json["userAccount"] as? [String: Any] {
                        let userJSON = try JSONSerialization.data(withJSONObject: userDictionary, options: [])
                        let loginResponse = try JSONDecoder().decode(Login.Fetch.Response.self, from: userJSON)
                        
                        completion(.success(loginResponse))
                    }
                } catch let error {
                    completion(.error(error))
                }
                break
            case .error(let error):
                completion(.error(error))
                break
            default:
                completion(.nonSpecifiedError)
            }
        }
    }
    
}
