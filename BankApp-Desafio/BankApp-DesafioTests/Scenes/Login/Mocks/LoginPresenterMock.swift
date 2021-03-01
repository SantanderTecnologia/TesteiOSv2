//
//  LoginPresenterMock.swift
//  BankApp-DesafioTests
//
//  Created by Mizia Lima on 2/28/21.
//

import Foundation
@testable import BankApp_Desafio

class LoginPresenterMock: LoginPresentationLogic {
    
    var receivedResponse: Login.Response?
    var receivedMessage: String?
    
    func presentLoginUser(response: Login.Response) {
        self.receivedResponse = response
    }
    
    func presentErrorMessage(message: String) {
        self.receivedMessage = message
    }
    
    func loadingUser() {
        //
    }
}
