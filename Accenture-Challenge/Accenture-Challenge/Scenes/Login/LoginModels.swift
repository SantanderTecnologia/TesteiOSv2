//
//  LoginModels.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

struct Login {
    
    struct Constants {
        
        struct Images {
            static let logoImageView = UIImage(named: "bank-logo")
        }
        
        struct Colors {
            static let backgroundColor = UIColor(rgb: 0xffffff)
            static let textFieldBackgroundColor = UIColor(rgb: 0xffffff)
            static let textFieldLayerColor = UIColor(rgb: 0xdce2ee)
            static let textFieldPlaceHolderColor = UIColor(rgb: 0xa8b4c4)
            static let loginButtonTextColor = UIColor(rgb: 0xffffff)
            static let loginButtonBackgroundColor = UIColor(rgb: 0x38b48ee)
        }
        
        struct Texts {
            static let userTextFieldPlaceHolder = "User"
            static let passwordTextFieldPlaceHolder = "password"
            static let loginButton = "Login"
        }
        
        struct Fonts {
            static let userTextFieldFont = UIFont(name: "HelveticaNeue", size: 15)
            static let passwordTextFieldFont = UIFont(name: "HelveticaNeue", size: 15)
            static let loginButtonFont = UIFont(name: "HelveticaNeue", size: 16)
        }
    }
    
    struct Info {
        
        struct LoginRequest {
            let user: String
            let password: String
        }
        
        struct LoginResponse {
            
        }
    }
}
