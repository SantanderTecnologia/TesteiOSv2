//
//  LoginModels.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

enum Login {
    
    // MARK: Use cases
    
    enum FetchLastLoggedUser {
        struct Response {
            var user: String
        }
    }
    
    enum Fetch {
        struct Request {
            let user: String
            let password: String
        }
        
        struct Response: Codable {
            var userId: Int?
            var name: String?
            var bankAccount: String?
            var agency: String?
            var balance: Double?
        }
    }
}
