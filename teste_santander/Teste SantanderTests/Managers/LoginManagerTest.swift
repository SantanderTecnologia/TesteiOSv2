//
//  LoginManagerTest.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble
import KeychainSwift

@testable import Teste_Santander

class LoginManagerTest: QuickSpec {
    
    override func spec() {
        
        var manager: LoginManager!
        
        describe("LoginManagerTests") {
            beforeSuite {
                manager = LoginManager()
            }
        }
        
        context("Testing Login") {
            it("Testing login fetch") {
               manager.fetch(user: "userTest", password: "Teste123")
                let loggedUserInteractor = LoggedUserInteractor()
                expect(loggedUserInteractor.loggedUser()?.name).toEventually(contain("Jose da Silva Teste"))
                expect(loggedUserInteractor.loggedUser()?.userID).toEventually(equal(1))
                expect(loggedUserInteractor.loggedUser()?.balance).toEventually(equal(3.3445))
            }
        }
        
        context("LoginManagerOutput") {
            it("LoginManagerOutputNill") {
                expect(manager.output).to(beNil())
            }
        }
    }
}
