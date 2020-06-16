//
//  LoginInteractor.swift
//  TesteiOSv2Project
//
//  Created by Andrey on 11/06/20.
//  Copyright (c) 2020 Andrey Matos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic
{
    func fetchUserAccount(request: Login.FetchUser.Request)
}

protocol LoginDataStore
{
    //var name: String { get set }
    var userAccount: UserAccount? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var userAccount: UserAccount?
    
    // MARK: Fetch user account given user credentials
    
    func fetchUserAccount(request: Login.FetchUser.Request)
    {
//        if request.credentials.emailOrCPF.isEmpty{
//            presenter?.presentValidationErrors(message: "Please inform the username!")
//            return
//        }
        if request.credentials.password.isEmpty{
            presenter?.presentErrorMessage(message: "Please inform the password!")
            return
        }
        if !isValidPassword(password: request.credentials.password){
            presenter?.presentErrorMessage(message: "The password should have at least an uppercase letter, an alpha numeric character and a special character")
            return
        }
        
        worker = LoginWorker(bankStore: BankAPI())
        worker?.fetchUserAccount(userCredentials: request.credentials, completionHandler: { (response, error) in
            DispatchQueue.main.async {
                if let error = error{
                    self.presenter?.presentErrorMessage(message: error.localizedDescription)
                    return
                }
                if let errorMessage = response?.error?.message,
                    let errorCode = response?.error?.code{
                    self.presenter?.presentErrorMessage(message: "Code: \(errorCode)\n\(errorMessage)")
                    return
                }
                if let response = response{
                    self.userAccount = response.userAccount
                    self.presenter?.presentUserData(response: response)
                }
            }
        })
    }
    
    private func isValidPassword(password: String) -> Bool{
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        let containsUppercase = password.contains(where: {$0.isUppercase})
        let containsNumber = password.contains(where: {$0.isNumber})
        let containsSpecialChar = password.rangeOfCharacter(from: characterset.inverted) != nil
        return containsUppercase && containsNumber && containsSpecialChar
    }
}
