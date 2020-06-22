//
//  Password.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 20/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation

class Password {
    var password: String
    var isUpperCase = false
    var isSpecialChar = false
    var isNum = false
    var isLetter = false
    var strUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var strLowerCase = "abcdefghijklmnopqrstuvwxyz"
    var strSpecialChar = "~!#$%ˆ&*()_-+=[{]}\\|<,>.?/"
    var strNum = "1234567890"
    
    init(password:String) {
          self.password = password
    }
    func isValid() -> Bool{
        for letter in password {
            if strUpperCase.contains(letter) {
                isUpperCase = true
            }
            if strLowerCase.contains(letter) {
                isLetter = true
            }
            if strNum.contains(letter) {
                isNum = true
            }
            if strSpecialChar.contains(letter) {
                isSpecialChar = true
            }
        }
        if (isLetter && isSpecialChar && isNum && isUpperCase){
            return true
        } else {
            return false
        }
    }

}


