//
//  Constants.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

struct Constants {
    struct Service {
        static let login = "login"
        static let home = "statements/"
        static let user = "user"
        static let password = "password"
        
        static let json = "application/x-www-form-urlencoded"
        static let contentType = "Content-Type"
    }
    
    struct Error {
        static let mandatoryUser = "User is mandatory"
        static let mandatoryPassword = "Password is mandatory"
        static let invalidUser = "Invalid user"
        static let invalidPassword = "Invalid Password"
    }
}
