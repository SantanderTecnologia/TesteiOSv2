//
//  LoginRequest.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 05/04/19.
//  Copyright © 2019 Lucas Brandão Pereira. All rights reserved.
//

import Foundation



class LoginRequest: Request {
    var endpoint: String = "https://bank-app-test.herokuapp.com/api/login"
    var method: HTTPMethod = .post
    
    var user: String
    var password: String

    init(user: String, password: String){
        self.user = user
        self.password = password
    }
    
    var body: Any {
        return [
            "user": user,
            "password": password
        ]
    }
    
}

