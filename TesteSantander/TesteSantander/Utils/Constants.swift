//
//  Constants.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 28/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Networking {
        static let baseURL = "https://bank-app-test.herokuapp.com/api"
    }
    
    struct Errors {
        static let defaultMessage = "ERROR: "
        static let loadFont = defaultMessage + "Unable to load font"
        static let loadURL = defaultMessage + "Unable to load base url"
        static let encodeData = defaultMessage + "Unable to encode data"
        static let APIError = defaultMessage + "Unable to connect to the API"
        
        static let invalidUsername = "Username must be a CPF or email"
        static let invalidPassword = "Password must contain a capital letter, a special character and an alphanumeric character"
        
        static let UIStringError = "Dado inválido"
        static let UIIntError: Int = 0
        static let UIDoubleError: Double = 0
    }
    
    static let userDefaultsUsername = "username"
    
}
