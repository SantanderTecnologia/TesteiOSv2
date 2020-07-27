//
//  Constants.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

struct Constants {
    
    struct Network {
        static let scheme = "https"
        static let host = "bank-app-test.herokuapp.com"
    }
    
    struct Palette {
        static let defaultColor = UIColor(hex: "#3B48EE")
        static let extraLightGray = UIColor(hex: "#FEFEFE")
    }
    
    struct KeychainKeys {
        static let user = "user"
        static let password = "password"
    }
}
