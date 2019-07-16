//
//  ValidationsFields.swift
//  TestSantander
//
//  Created by ely.assumpcao.ndiaye on 10/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

class ValidationsFields{
    
    func isValidPassword(passID:String) -> Bool {
        let passRegEx = "(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*])(?=.*[a-z]).{1,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        return passwordTest.evaluate(with: passID)
    }
    
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
}

extension String {
    var isCPF: Bool {
        //Retira, caso tenham, '.' '-' c
        let cpf = self.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
        //Elimina os CPFS abaixo invalidos.
        let cpfsInvalidos: [String] = ["00000000000",
                                       "11111111111",
                                       "22222222222",
                                       "33333333333",
                                       "44444444444",
                                       "55555555555",
                                       "66666666666",
                                       "77777777777",
                                       "88888888888",
                                       "99999999999",
                                       ];
        
        for cpfInvalido in cpfsInvalidos {
            if(cpf == cpfInvalido) {return false;}
        }
        
        //Logica da validação
        if cpf.characters.count == 11 {
            
            let d1 = Int(cpf.substring(with: cpf.index(cpf.startIndex, offsetBy: 9)..<cpf.index(cpf.startIndex, offsetBy: 10)))
            
            let d2 = Int(cpf.substring(with: cpf.index(cpf.startIndex, offsetBy: 10)..<cpf.index(cpf.startIndex, offsetBy: 11)))
            
            var temp1 = 0, temp2 = 0
            
            for i in 0...8 {
                let char = Int(cpf.substring(with: cpf.index(cpf.startIndex, offsetBy: i)..<cpf.index(cpf.startIndex, offsetBy: (i+1))))
                
                temp1 += char! * (10 - i)
                temp2 += char! * (11 - i)
                
            }
            
            temp1 %= 11
            temp1 = temp1 < 2 ? 0 : 11-temp1
            
            temp2 += temp1 * 2
            temp2 %= 11
            temp2 = temp2 < 2 ? 0 : 11-temp2
            
            if temp1 == d1 && temp2 == d2 {
                
                return true
                
            }
            
        }
        return false
    }
}
