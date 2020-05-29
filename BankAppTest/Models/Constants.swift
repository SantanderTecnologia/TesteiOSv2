//
//  Constants.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 25/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Storyboard {
        
        static let homeViewController = "Home"
        
    }
    
    struct String {
        
        static let passError = "Sua senha deve ter pelo menos 8 caracteres, um caractere especial e um número"
        static let loginError = "Por favor, preencha todos os campos"
        static let userError = "Por favor, preencha seu usuário"
        static let voidString = ""
        static let passRequirements = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%#?&#])[A-Za-z\\d$@$!%*?&#]{6,8}"
        static let login = "login"
        static let wallet = "statements/1"
    }
}

