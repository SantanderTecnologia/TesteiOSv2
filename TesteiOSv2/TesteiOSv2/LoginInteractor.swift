//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

class LoginInteractor: LoginDataStore, LoginBussinessLogic{
    var user: UserAccount?
    
    var presenter : LogicPresenterLogic?
    
    ///Login configurations keychain instace
    let keychain : LoginKeychain = LoginKeychain()
    
    /**
     Validate user and password and returns a LoginValidationErrorEnum.
     
     - parameters:
     - user: String
     - password: String
     */
    func validLogin(user: String, password: String) -> LoginValidationErrorEnum {
        
        var isValidUser : Bool {
            if(user.isValidEmail() || user.isValidCPF){
                return true
            }else{
                return false
            }
        }
        
        var isValidPassword : Bool{
            if(password.hasNumericCharacter() && password.hasSpecialCharacters() && password.hasUpperCase()){
                return true
            }else{
                return false
            }
        }
        
        switch false {
        case isValidUser:
            return .username
        case isValidPassword:
            return .password
        default:
            return .none
        }
    }
    /**
     Execute the login and call presenter way acording validLogin results.
     
     - parameters:
     - user: String
     - password: String
     */
    func login(user: String, password: String) {
        
        let loginResult = validLogin(user: user, password: password)
        switch loginResult {
        case .none:
            let userLogin = UserLoginAlamofireGateway()
            userLogin.authLogin(user: user, password: password) { [weak self] userResult in
                guard let strongSelf = self else {return}
                strongSelf.user = userResult
                strongSelf.keychain.save(user: user)
                strongSelf.keychain.save(password: password)
                strongSelf.presenter?.presentLoginResults()
            }
        case .username:
            self.presenter?.presentLoginError(with: .username)
        case .password:
            self.presenter?.presentLoginError(with: .password)
        }
        
    }
}
