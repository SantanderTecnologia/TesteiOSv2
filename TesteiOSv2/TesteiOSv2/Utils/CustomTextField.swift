//
//  CustomTextField.swift
//  TesteiOSv2
//
//  Created by Foliveira on 06/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation
import VMaskTextField

class CustomTextfield: VMaskTextField {
    
    func validateByType (_ type: ValidationType) throws -> String {
        let validator = Validator.validateField(type)
        guard let value = self.text else { return "" }
        
        if value.isEmpty {
            switch type {
            case .user: throw ValidationError("Campo de CPF não preenchido!")
            case .password: throw ValidationError("Campo de senha não preenchido!")
            }
            
        }
        
        do {
            let valid = try validator.validateString(value)
            return valid
            
        } catch {
            throw error
        }
        
        
    }
    
    
}
