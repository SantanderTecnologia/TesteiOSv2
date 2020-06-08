//
//  ValidatorEmail.swift
//  Validator
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Presenter

public class ValidatorEmail: UserNameValidateProtocol {
    
    public func isValid(userName: String?) -> Bool {
        guard let content = userName else { return false }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: content)
    }
}
