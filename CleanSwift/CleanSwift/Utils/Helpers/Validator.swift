//
//  Validator.swift
//  CleanSwift
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-08-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

struct Validator {
    static func isValid(username: String) -> String? {
        if username.isEmpty { return CSError.mandatoryUser.localizedDescription }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        if !username.matchRegex(emailRegex) && !username.isCPF {
            return CSError.invalidUser.localizedDescription
        }
        
        return nil
    }
    
    static func isValid(password: String) -> String? {
        if password.isEmpty { return CSError.mandatoryPassword.localizedDescription }
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{3,}"
        if !password.matchRegex(passwordRegex) { return CSError.invalidPassword.localizedDescription }
        return nil
    }
}
