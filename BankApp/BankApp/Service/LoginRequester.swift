//
//  LoginRequester.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class LoginRequester {
    
    static func postLogin(_ loginForm: LoginForm, completion: @escaping (LoginResponseStruct) -> Void, fail: @escaping (String) -> Void) {
        
        let endpoint = "/login"
        let headers = ["Content-Type" : "application/x-www-form-urlencoded"]
        
        var body = URLComponents()
        body.queryItems = [URLQueryItem(name: "user", value: loginForm.username),
                           URLQueryItem(name: "password", value: loginForm.password)]
        let jsonData = body.query?.data(using: .utf8)
        
        
        APIRequester.request(jsonData, method: .post, on: endpoint, headers: headers) { response in
            switch response.result {
                case .success:
                    guard
                        let data = response.data,
                        let object = try? JSONDecoder().decode(LoginResponseStruct.self, from: data)
                        else { fail("Decode Error"); return }
                    
                    completion(object)
                case .failure(let error):
                    switch error {
                        case .responseStatusCode(let statusCode):
                            fail("Falha ao fazer o login.\nErro \(statusCode)")
                        default:
                            fail("Falha de comunicação com o servidor")
                    }
            }
        }
    }
}


