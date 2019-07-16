//
//  LoginViewControllerTest.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 11/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class LoginViewControllerTest: QuickSpec {

    override func spec() {
        let viewController: LoginViewController = LoginWireframe().makeScreen(window: nil)
        
        describe("LoginViewControllerTest") {
            beforeSuite {
                viewController.beginAppearanceTransition(true, animated: false)
                viewController.endAppearanceTransition()
            }
        }
        
        context("TestLogin") {
            it("Testing send user and password empty") {
                viewController.presenter?.send(user: "", password: "" )
                expect(viewController.errorUserLabel.isHidden).to(equal(false))
                expect(viewController.errorPasswordLabel.isHidden).to(equal(false))
                expect(viewController.errorUserLabel.text).to(contain("Erro existe dados em branco"))
                expect(viewController.errorPasswordLabel.text).to(contain("Erro existe dados em branco"))
            }
            
            it("Testing send user empty") {
                viewController.presenter?.send(user: "", password: "Eee1" )
                expect(viewController.errorUserLabel.text).to(contain("Erro existe dados em branco"))
                expect(viewController.errorUserLabel.isHidden).to(equal(false))
            }
            
            it("Testing send password Empty") {
                viewController.presenter?.send(user: "teste", password: "" )
                expect(viewController.errorPasswordLabel.isHidden).to(equal(false))
                expect(viewController.errorPasswordLabel.text).to(contain("Erro existe dados em branco"))
            }
            
            it("Testing send password invalid") {
                viewController.presenter?.send(user: "teste@teste.com", password: "teste" )
                expect(viewController.errorPasswordLabel.isHidden).to(equal(false))
                expect(viewController.errorPasswordLabel.text).to(contain("Sua senha não conferer com os criterios de validação"))
            }
            
            it("Testing send password and valid") {
                viewController.presenter?.send(user: "teste@teste.com", password: "Teste1999" )
                expect(viewController.errorPasswordLabel.text).toEventually(equal(""))
                expect(viewController.errorUserLabel.text).toEventually(equal(""))
            }
        }
    }
}
