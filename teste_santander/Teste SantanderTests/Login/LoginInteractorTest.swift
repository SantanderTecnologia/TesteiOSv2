//
//  LoginInteractorTest.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 10/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class LoginInteractorTest: QuickSpec {
    override func spec() {
        var loginInteractor: LoginInteractor!
        
        describe("LoginInteractorTests") {
            beforeSuite {
               loginInteractor = LoginInteractorBuilder.make()
            }
        }
        
        context("Protocol") {
            it("checking Conforming Protocol") {
                expect(loginInteractor).to(beAKindOf(LoginInteractorInput.self))
                expect(loginInteractor).to(beAKindOf(LoginManagerOutput.self))
                expect(loginInteractor).to(beAKindOf(LoginInteractor.self))
            }
        }
        
        context("Checked Manager") {
            it("checking manager") {
                expect(loginInteractor.manager).notTo(beNil())
            }
        }
        
        context("Valid Password") {
            it("checkingPasswordInvalid") {
                expect(!loginInteractor.validPassword(value: "teste")).to(equal(true))
                expect(!loginInteractor.validPassword(value: "teste1")).to(equal(true))
            }
            
            it("checkingPasswordValid") {
                expect(!loginInteractor.validPassword(value: "tesT1909")).to(equal(false))
                expect(!loginInteractor.validPassword(value: "Teste200o")).to(equal(false))
            }
        }
        context("Valid USER") {
            it("checkingUSERInvalid") {
                expect(loginInteractor.validateEmail(enteredEmail: "teste@teste.com")).to(equal(true))
                expect(loginInteractor.validateEmail(enteredEmail: "teste@teste")).to(equal(false))
                expect(loginInteractor.validCpfEmail(text: "134.973.957-06")).to(equal(true))
                expect(loginInteractor.removeSpecialCharsFromString(text: "134.973.957-06")).to(equal("13497395706"))
            }
        }
    }
}
