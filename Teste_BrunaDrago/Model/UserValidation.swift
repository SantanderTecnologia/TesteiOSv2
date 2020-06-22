//
//  UserValidation.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 20/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import Foundation


// valida de usuario é CPF ou e-mail

class UserValidation {
    var user: String
    var isCPFLen = false
    var isEmail = false
    var isNumeric = true
    var strNum = "1234567890"

    init(user:String) {
          self.user = user
    }
    
    func isValid() -> Bool{
        if user.contains("@") {
            isEmail = true
        }
        

        for letter in user {
            if !strNum.contains(letter){
             isNumeric = false
            }
        }
        if user.count == 11 {
            isCPFLen = true
        }
        

        if ( isEmail || (isNumeric && isCPFLen)){
            return true
        } else {
            return false
        }
    }
}

//var teste = Senha(senha: "Teste123").isValid()


/*if (Usuario(usuario: "36870004688").isValid()){
    print("entra")
}else
{
print("usuario invalida")
}*/
