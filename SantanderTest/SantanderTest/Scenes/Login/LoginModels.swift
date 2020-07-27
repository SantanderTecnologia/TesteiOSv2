//
//  LoginModels.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

enum Login {
    // MARK: Use cases
    
    struct Request {
        var user: String
        var password: String
    }
    struct Response: Decodable {
        let userAccount: UserAccount?
        let error: ResultError?
    }
    struct ViewModel {
        let errorMsg: String?
        
        init(error: ResultError? = nil) {
            errorMsg = error?.message
        }
    }
}

struct UserAccount: Decodable {
    var userID: Int?
    var name, bankAccount, agency: String?
    var balance: Double?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, bankAccount, agency, balance
    }
    
    init() {
        userID = 0
        name = ""
        bankAccount = ""
        agency = ""
        balance = 0.0
    }
}
