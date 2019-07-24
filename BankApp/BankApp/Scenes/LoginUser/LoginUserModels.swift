//
//  LoginUserModels.swift
//  BankApp
//
//  Created by Visão Grupo on 7/20/19.
//  Copyright © 2019 Vinicius Teixeira. All rights reserved.
//

import Foundation

enum LoginUser {
    
    enum FetchUser {
        struct Request {}
        
        struct Response {
            var login: String
        }
        
        struct ViewModel {
            var login: String
        }
    }
    
    enum RequestUser {
        struct Request {
            var user: String
            var password: String
        }
        
        struct Response {
            var user: User?
        }
        
        struct ViewModel {
            var user: User?
        }
    }
}
