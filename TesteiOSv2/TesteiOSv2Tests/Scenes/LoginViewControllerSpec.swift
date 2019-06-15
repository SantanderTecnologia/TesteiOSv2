//
//  LoginViewControllerSpec.swift
//  TesteiOSv2Tests
//
//  Created by Felipe Rodrigues Silva on 17/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOSv2

class LoginViewControllerSpec : QuickSpec{
    override func spec() {
        describe("LoginViewControllerSpec Spec") {
            var loginViewcontroller : LoginViewController!
            var interactor : LoginInteractor!
            var presenter : LoginPresenter!
            var router : LoginRouter!

            
            context("when initilize, will do all VIP cicle"){
                var validLogin : LoginValidationErrorEnum!
                var invalidLoginUser : LoginValidationErrorEnum!
                var invalidLoginPassword : LoginValidationErrorEnum!
                var alert : UIAlertController!
                var isPassingOnPresentLoginError : Bool!
                beforeEach {
                    loginViewcontroller = LoginViewController()
                    alert = loginViewcontroller.loadAlert
                    
                    interactor = loginViewcontroller.interactor as? LoginInteractor
                    presenter = interactor.presenter as? LoginPresenter
                    router = loginViewcontroller.router as? LoginRouter
                    
                    validLogin = interactor.validLogin(user: "teste@gmail.com", password: "S12@d")
                    invalidLoginUser = interactor.validLogin(user: "testegmailcom", password: "S12@d")
                    invalidLoginPassword = interactor.validLogin(user: "teste@gmail.com", password: "asdaskdd")
                    
                    presenter.presentLoginError(with: .password)
                    
                    
                    isPassingOnPresentLoginError = (loginViewcontroller.errorAlert.title == LOGIN_ERROR_TITLE_PASSWORD)
                    
                    presenter.presentLoginResults()
                    
                }
                
                it("viewController not be nil"){
                    expect(loginViewcontroller).toNot(beNil())
                }
                it("interactor not be nil"){
                    expect(interactor).toNot(beNil())
                }
                it("presenter not be nil"){
                    expect(presenter).toNot(beNil())
                }
                it("router not be nil"){
                    expect(router).toNot(beNil())
                }
                it("loadAlert not be nil"){
                    expect(alert).toNot(beNil())
                }
                it("interactor valid login to be .none"){
                    expect(validLogin == LoginValidationErrorEnum.none).to(beTrue())
                }
                it("interactor invalid login to be .username"){
                    expect(invalidLoginUser == LoginValidationErrorEnum.username).to(beTrue())
                }
                it("interactor invalid login to be .password"){
                    expect(invalidLoginPassword == LoginValidationErrorEnum.password).to(beTrue())
                }
                it("if pass into presenter error function"){
                    expect(isPassingOnPresentLoginError).to(beTrue())
                }
            }
        }
    }
}
