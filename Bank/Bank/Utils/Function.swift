//
//  Function.swift
//  Bank
//
//  Created by Junior Obici on 13/01/20.
//  Copyright © 2020 Junior Obici. All rights reserved.
//

import Foundation

class Function {
    
    class func validateEmail (email: String) -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let predicate = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
    
    class func validateCPF (cpf: String) -> Bool {
        let numCpf = cpf.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "-", with: "")
        guard numCpf.count == 11 else { return false }
        
        let i1 = numCpf.index(numCpf.startIndex, offsetBy: 9)
        let i2 = numCpf.index(numCpf.startIndex, offsetBy: 10)
        let i3 = numCpf.index(numCpf.startIndex, offsetBy: 11)
        let d1 = Int(numCpf[i1..<i2])
        let d2 = Int(numCpf[i2..<i3])
        
        var temp1 = 0, temp2 = 0
        
        for i in 0...8 {
            let start = numCpf.index(numCpf.startIndex, offsetBy: i)
            let end = numCpf.index(numCpf.startIndex, offsetBy: i+1)
            let char = Int(numCpf[start..<end])
            
            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        
        return temp1 == d1 && temp2 == d2
    }
    
    class func validatePassword(password: String) -> Bool {
        let regEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        let predicate = NSPredicate (format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: password)
    }
}
