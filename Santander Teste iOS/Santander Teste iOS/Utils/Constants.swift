//
//  Constants.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 12/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import UIKit

struct K {
    struct Colors {
        static let mainBlue = UIColor(named: "main")
        static let lightGray = UIColor(named: "lightGray")
        static let darkGray = UIColor(named: "darkGray")
    }
    
    struct UserDefaults {
        static let lastUserKey = "lastUserKey"
    }
    
    struct LoginScene {
        // Strings
        static let user = "User"
        static let password = "Password"
        static let login = "Login"
        static let fail = "Fail"
        static let success = "Success"
        static let wrongUserOrPassword = "Seu usuário ou senha não está correto!"
        static let ok = "OK"
        static let connecting = "Conectando..."
        
        //Images
        static let logoImageName = "Logo"
    }
    
    struct AccountScene {
        //Strings
        static let recentes = "Recentes"
        static let conta = "Conta"
        static let saldo = "Saldo"
        static let cancelar = "Cancelar"
        static let sim = "Sim"
        static let logout = "Tem certeza de que deseja sair?"
        
        //Images
        static let logoutImageName = "logout"
    }
}
