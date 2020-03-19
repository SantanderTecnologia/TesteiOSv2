//
//  LoginPresenterSpec.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Quick
import Nimble
@testable import BankApp

class LoginPresenterSpec: QuickSpec {
    
    override func spec() {
        
        describe("LoginPresenter") {
            
            var sut: LoginPresenter? = LoginPresenter()
            
            beforeEach {
                sut = LoginPresenter()
            }
            
            context("loginSuccess") {
                
                it("must set viewModel with value and no error") {
                    let viewController = LoginViewControllerMock()
                    sut?.viewController = viewController
                    
                    let response = Login.Authentication.Response(userAccount:
                        UserDataModel(userId: 0,
                                      name: "",
                                      bankAccount: "",
                                      agency: "",
                                      balance: 0))
                    
                    sut?.loginSuccess(response: response)
                    expect(viewController.viewModel).toNot(beNil())
                    expect(viewController.viewModel?.userData).toNot(beNil())
                    expect(viewController.viewModel?.errorMessage).to(beNil())
                }
                
            }

            context("loginError") {

                it("must set viewModel with no value and an error defined") {
                    let viewController = LoginViewControllerMock()
                    sut?.viewController = viewController

                    sut?.loginError(error: "Error")
                    expect(viewController.viewModel).toNot(beNil())
                    expect(viewController.viewModel?.userData).to(beNil())
                    expect(viewController.viewModel?.errorMessage).toNot(beNil())
                }
                
            }
            
        }
        
    }
    
}
