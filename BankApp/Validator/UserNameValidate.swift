//
//  UserNameValidate.swift
//  Validator
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Presenter

public class UserNameValidate: UserNameValidateProtocol {
    
    public let validatorCPF = StatusValidator()
    public let validatorEmail = ValidatorEmail()
    
    public init() { }
    
    public func isValid(userName: String?) -> Bool {
        guard let user = userName else { return false }
        let isValidCPF = validatorCPF.validate(cpf: user) == .valid
        let isValidEmail = validatorEmail.isValid(userName: user)
        
        switch (isValidCPF, isValidEmail) {
        case (true, true): return false
        case (false, true): return true
        case (true, false): return true
        default: return false
        }
    }
}
