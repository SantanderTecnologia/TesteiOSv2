//
//  LoginWorker.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 15/03/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.


import UIKit

class LoginWorker {
    func doSomeWork() {
    }
    
    func validateUser(userId: String, password: String, completion: @escaping(_ response: LoginResponse?, _ errorMessage: String?) -> Void){
        let request = LoginRequest(user: userId, password: password)
        Remote.makeRequest(request: request, completionHandler: completion)
    }
}
