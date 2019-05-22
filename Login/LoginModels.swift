//
//  LoginModels.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 15/03/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.

import UIKit

enum Login {
  // MARK: Use cases
  
    enum Validate {
        struct Request {
            var userId: String
            var password : String
        }
        struct Response {
            var isValid: Bool
        }
        struct ViewModel {
            var isValid : Bool
        }
    }
    
    enum ServerValidate {
        struct Request {
        }
        struct Response {
            var isAuthenticated: Bool
            var userInfo: UserInfo
        }
        struct ViewModel {
            var isAuthenticated : Bool
            var userInfo: UserInfo
        }
    }
}
