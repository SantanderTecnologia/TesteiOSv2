//
//  LoginViewBuilderTest.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 10/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class LoginViewBuilderTest: QuickSpec {
    
    override func spec() {
        
        var loginBuilder: LoginViewControllerBuilder!
        
        describe("LoginBuilderTests") {
            beforeSuite {
                loginBuilder = LoginViewControllerBuilder()
            }
            
            context("BuildingViewController") {
                it("hasPropertyStoryboardNameEqualName") {
                    expect(loginBuilder.storyboardName).to(equal("Login"))
                }
            }
        }
        
        context("GenerateLoginViewScreen") {
            it("MakeScreen") {
                let loginView = LoginWireframe().makeScreen(window: nil)
                expect(loginView.isKind(of: LoginViewController.self)).to(beTrue())
            }
        }
        
        context("LoginViewScreenOutput") {
            it("TestingPresenter") {
                let loginView = LoginWireframe().makeScreen(window: nil)
                expect(loginView.presenter).notTo(beNil())
            }
        }
    }
}
