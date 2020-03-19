//
//  LoginInteractorSpec.swift
//  BankAppTests
//
//  Created by José Inácio Athayde Ferrarini on 19/03/20.
//  Copyright © 2020 br.com.solutis.inacioferrarini. All rights reserved.
//

import Quick
import Nimble
@testable import BankApp

class LoginInteractorSpec: QuickSpec {

    enum NetworkError: Error {
        case error
    }

    override func spec() {
        
        describe("LoginInteractor") {
            
            var sut: LoginInteractor = LoginInteractor()
            
            beforeEach {
                sut = LoginInteractor()
            }
            
            context("doLogin") {

                it("if succeeds, must call presenter.fetchSuccess") {
                    sut.worker = LoginWorkerMock({ (request) -> (Result<Login.Authentication.Response?, Error>) in
                        return Result.success(nil)
                    })
                    
                    let presenter = LoginPresenterMock()
                    sut.presenter = presenter
                    
                    sut.doLogin(request: Login.Authentication.Request(login: "", password: ""))
                    
                    expect(presenter.wasSuccessCalled).to(beTruthy())
                    expect(presenter.wasFailureCalled).to(beFalsy())
                }
                
                it("if fails, must call presenter.fetchError") {
                    sut.worker = LoginWorkerMock({ (request) -> (Result<Login.Authentication.Response?, Error>) in
                        return Result.failure(NetworkError.error)
                    })

                    let presenter = LoginPresenterMock()
                    sut.presenter = presenter

                    sut.doLogin(request: Login.Authentication.Request(login: "", password: ""))
                    
                    expect(presenter.wasSuccessCalled).to(beFalsy())
                    expect(presenter.wasFailureCalled).to(beTruthy())
                }

            }
            
            context("isCPFValid") {

                it("must return true if value matches pattern") {
                    let isValid = sut.isCPFValid(cpf: "123.456.789-09")
                    expect(isValid).to(equal(true))
                }
                
                it("must return false if value does not match pattern") {
                    let isValid = sut.isCPFValid(cpf: "123.456.789-0")
                    expect(isValid).to(equal(false))
                }
                
            }
            
            context("isEmailValid") {

                it("must return true if value matches pattern") {
                    let isValid = sut.isEmailValid(email: "email@email.com")
                    expect(isValid).to(equal(true))
                }
                
                it("must return false if value does not match pattern") {
                    let isValid = sut.isEmailValid(email: "email_email.com")
                    expect(isValid).to(equal(false))
                }
                
            }
            
            context("isPasswordValid") {
                
                it("must return true if value matches pattern") {
                    let isValid = sut.isPasswordValid(password: "Lo0@")
                    expect(isValid).to(equal(true))
                }
                
                it("must return false if value does not match pattern") {
                    let isValid = sut.isPasswordValid(password: "X")
                    expect(isValid).to(equal(false))
                }
                
            }
            
        }
        
    }
    
}
