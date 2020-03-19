//
//  LoginPresenterMock.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Foundation
@testable import BankApp

class LoginPresenterMock: LoginPresentationLogic {

    var wasSuccessCalled = false
    var wasFailureCalled = false

    func loginSuccess(response: Login.Authentication.Response?) {
        wasSuccessCalled = true
    }
    
    func loginError(error: String?) {
        wasFailureCalled = true
    }

}
