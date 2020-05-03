//
//  Extras.swift
//  SANTANDER
//
//  Created by Maíra Preto on 23/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation
import CPF_CNPJ_Validator

extension String {
    
    
    static func validarCPf(cpf: String) -> Bool {
        let success = BooleanValidator().validate(cpf: cpf)
        
        return success
        
    }
    
    static func validarEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: email)
    }
    
    static func validarPassword(_ password : String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{4,}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        
        return passwordTest.evaluate(with: password)
    }
    
    static func dateFromCustomString(customString: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: customString) 
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let now = dateFormatter.string(from: date!)
        
        return now
    }
    
}



