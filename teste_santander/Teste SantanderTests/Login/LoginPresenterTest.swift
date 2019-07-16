//
//  LoginPresenterTest.swift
//  Teste SantanderTests
//
//  Created by THIAGO on 10/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Quick
import Nimble

@testable import Teste_Santander

class LoginPresenterTest: QuickSpec {

    override func spec() {
        
        var presenter: LoginPresenter!
        
        describe("LoginPresenterTests") {
            beforeSuite {
                let route = LoginWireframe()
                presenter = LoginPresenterBuilder.make(wireframe: route)
            }
        }
        context("LoginPresenter") {
            it("InteractorNotNill") {
                expect(presenter.interactor).notTo(beNil())
            }
        }
        
        context("LoginPresenterOutput") {
            it("LoginPresenterOutputNill") {
                expect(presenter.output).to(beNil())
            }
        }
        
        context("TitleMessagemEmpty") {
            it("CheckEmptyFieldMessage") {
                expect(presenter.titleMessage(valid: .empty)).to(equal(("Erro existe dados em branco")))
            }
        }
        
        context("TitleMessagemValid") {
            it("CheckValidFieldMessage") {
                expect(presenter.titleMessage(valid: .valid)).to(equal(("Sua senha não conferer com os criterios de validação")))
                 expect(presenter.titleMessage(valid: .cpfEmail)).to(equal(("Por favor forneça um e-mail válido ou CPF válido")))
            }
        }
        
        context("Protocol") {
            it("checking Conforming Protocol") {
                expect(presenter).to(beAKindOf(LoginPresenterInput.self))
                expect(presenter).to(beAKindOf(LoginInteractorOutput.self))
                expect(presenter).to(beAKindOf(LoginPresenter.self))
            }
        }
    }
}
