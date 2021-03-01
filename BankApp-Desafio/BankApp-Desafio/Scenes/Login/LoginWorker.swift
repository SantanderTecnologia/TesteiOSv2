//
//  LoginWorker.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/26/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SwiftKeychainWrapper

class LoginWorker {
    private let service: APIService
    init(service: APIService = APIService()) {
        self.service = service
    }
    
    //MARK: Worker
    func login(username: String, password: String, completion: @escaping (Result<Login.Response, ServiceError>) -> Void) {
        let url = URL(string: API.Path.login)
        let parameters = ["user": username, "password": password]
        service.post(params: parameters, url: url) { (result) in
            switch result {
            case let .success(data):
                do {
                    let user = try JSONDecoder().decode(UserAPIModel.self, from: data)
                    let response = Login.Response(user: user)
                    self.saveLoginCredentials(user: username, password: password)
                    DispatchQueue.main.async {
                        completion(.success(response))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        completion(.failure(.unknown(error)))
                    }
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    //MARK: Keychain
    func getLastUser() -> Login.Request {
        guard let username = KeychainWrapper.standard.string(forKey: "username"),
        let password = KeychainWrapper.standard.string(forKey: "password")
        else {
            return Login.Request(user: "", password: "")
        }
        return Login.Request(user: username, password: password)
    }
    
    func saveLoginCredentials(user: String, password: String) {
        KeychainWrapper.standard.set(user, forKey: "username")
        KeychainWrapper.standard.set(password, forKey: "password")
    }
}
