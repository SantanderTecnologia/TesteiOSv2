//
//  Login.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 01/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import Foundation

extension StringTables {
    
    enum LocalizedLogin: String {
        case errorTitle
        case errorButtonTitle
        case uncompletedFieldsMessage
        case wrongFieldsMessage
        case loginAuthenticationErrorTitle
        case loginAuthenticationErrorMessage
        
        var string: String {
            return String(key: rawValue.convertToSnakeCase(), table: .login)
        }
    }
}
