//
//  Validator.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 25/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import Foundation

import CPF_CNPJ_Validator

class Validator {

    private init(){}
    
    static func validate(password: String) -> Bool
    {
        let regex = "^(?=.*[A-Z])(?=.*[a-z0-9])(?=.*[!@#$%^?&*()_+=\\-{}|:;<>]).{3,}$"
        let isValid = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: password)
        return isValid
    }
    
    static func validate(user: String) -> InputValidationResult
    {
        if isCpf(user: user){
            if !validate(cpf: user){
                return InputValidationResult(serviceError: ServiceError(code: -1, message: "Usuário inválido"))
            }
        }else{
            if !validate(email: user){
                return InputValidationResult(serviceError: ServiceError(code: -1, message: "Usuário inválido"))
            }
        }
        
        return InputValidationResult(serviceError: nil)
    }
    
    private static func validate(cpf: String) -> Bool
    {
        let isValid = BooleanValidator().validate(cpf: cpf)
        return isValid
    }
    
    private static func validate(email: String) -> Bool
    {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let isValid = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: email)
        return isValid
    }
    
    private static func isCpf(user: String) -> Bool
    {
        let regex = "\\d+"
        let isCpf = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: user)
        return isCpf
    }
    
}
