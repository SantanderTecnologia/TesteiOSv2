//
//  LoginInteractor.swift
//  AppSantander
//
//  Created by Lucas Brandão Pereira on 15/03/19.
//  Copyright (c) 2019 Lucas Brandão Pereira. All rights reserved.


import UIKit

protocol LoginBusinessLogic {
    func fetch(request: Login.Validate.Request)
    func validate(request: Login.Validate.Request)
}

protocol LoginDataStore {
    var userInfo: UserInfo { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var userInfo: UserInfo = UserInfo(name: "", agencyAccount: "", balance: "")
    var canLogin = false
    
    // MARK: Do something
    
    // User's input local validation
    func isValidEmail(validatedString:String) -> Bool {
        let emailEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailEx)
        
        return emailTest.evaluate(with: validatedString)
    }
    
    func isValidCPF(validatedString: String) -> Bool{
        let set = CharacterSet(charactersIn: "1234567890.-")
        if (!(validatedString.rangeOfCharacter(from: set.inverted) != nil) && (validatedString.count == 11 || validatedString.count == 14)){
            return validatedString.isValidCPF
        }
        return false
    }
    
    func isValidPassword(validatedString: String) -> Bool{
        let passwordRegex = "^(?=.*\\d)(?=.*[A-Z])(?=.*[!@#$&*])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{4,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: validatedString)
    }
    
    func validate(request: Login.Validate.Request){
            //isValidCPF(validatedString: request.userId) || isValidEmail(validatedString: request.userId)
            let response = Login.Validate.Response(isValid: (isValidCPF(validatedString: request.userId) || isValidEmail(validatedString: request.userId)) && (isValidPassword(validatedString: request.password)))
            self.canLogin = response.isValid
            presenter?.present(response: response)
    }
    
   //Fetch Data from Endpoint
    func fetch(request: Login.Validate.Request) {
        if !canLogin{
            return
        }
        
        worker = LoginWorker()
        worker?.doSomeWork()
        worker!.validateUser(userId: request.userId, password: request.password) { (response, errorMessage) in
            guard response != nil else {
                //Erro
                _ = Login.ServerValidate.Response(isAuthenticated: false, userInfo: self.userInfo)
                return
            }
            self.userInfo.name = (response?.userAccount.name)!
            
            let accountString = self.bankMask(string: (response?.userAccount.agency)!) 
            let agencyAccountString = "\(response?.userAccount.bankAccount ?? "") / \(accountString)"

            
            self.userInfo.agencyAccount = agencyAccountString
            self.userInfo.balance = "\((response?.userAccount.balance)!)"
            
            let r = Login.ServerValidate.Response(isAuthenticated: true, userInfo: self.userInfo)
            self.presenter?.presentStatements(response: r)
        }
    }
    
    // mask to agency / bank format
    func bankMask(string: String) -> String{
        var characters = Array(string)
        
        characters.insert(".", at: 2)
        characters.insert("-", at: 9)
        let masked = String(characters)
        
        return masked
    }
    
}
