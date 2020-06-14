//
//  Validator.swift
//  TesteiOSv2
//
//  Created by Foliveira on 07/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

enum ValidationType {
    case user
    case password
}

protocol ValidationProtocol {
    func validateString(_ value: String) throws -> String
}

struct ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

class Validator {
    static func validateField (_ type: ValidationType) -> ValidationProtocol {
        switch type {
        case .user: return UserValidator()
        case .password: return PasswordValidator()
        }
    }
}


class UserValidator: ValidationProtocol {
    func validateString(_ value: String) throws -> String {
        let range = NSRange(location: 0, length: value.utf16.count)
        let regex = try NSRegularExpression(pattern:"(^\\d{3}\\x2E\\d{3}\\x2E\\d{3}\\x2D\\d{2}$)")
        let result = regex.firstMatch(in: value, options: [], range: range)
        
        if(result == nil){
        throw ValidationError("Usuário inválido")
        }
        return value
    }
}

class PasswordValidator: ValidationProtocol {
    func validateString(_ value: String) throws -> String {
        let range = NSRange(location: 0, length: value.utf16.count)
        let regex = try NSRegularExpression(pattern: "(?=.*[A-Z])(?=.*[_@.\\/#&+-])[\\w_@.\\/#&+-]{3,}")
        let result = regex.firstMatch(in: value, options: [], range: range)
        
        if(result == nil){
        throw ValidationError("Senha inválida")
        }
        return value
    }
}
