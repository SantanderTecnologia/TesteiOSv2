//
//  Autenticacao.swift
//  BankApp
//
//  Created by Joni Campos on 19/09/19.
//  Copyright © 2019 Joni Campos. All rights reserved.
//

import Foundation
import UIKit

class Autenticacao
{
    
    var isPasswordValid = true
    
    func validatePassword(password: String?) -> String? {
        var errorMsg = "A senha requer pelo menos"
        
        if let txt = password {
            if (txt.rangeOfCharacter(from: CharacterSet.uppercaseLetters) == nil) {
                isPasswordValid = false;
                errorMsg += " uma letra maiúscula"
            }
            if (txt.rangeOfCharacter(from: CharacterSet.lowercaseLetters) == nil) {
                errorMsg += ", uma letra minúscula"
                isPasswordValid = false;
            }
            if (txt.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) {
                errorMsg += ", um múmero"
                isPasswordValid = false;
            }
            
            let specialCharacter  = ".*[!&^%$#@()/_*+-]+.*"
            let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacter)
            if !texttest2.evaluate(with: txt) {
                errorMsg += ", um caracter especial"
                isPasswordValid = false;
            }

            
            
            if txt.count < 8 {
                errorMsg += ", oito caracteres"
                isPasswordValid = false;
            }
            
            
            
            
        }
        
        if isPasswordValid {
            return "Senha é Válida"
        } else {
            
            return errorMsg
        }
    }
    
    
}
