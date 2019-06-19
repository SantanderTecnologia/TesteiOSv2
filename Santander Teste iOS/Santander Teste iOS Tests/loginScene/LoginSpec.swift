//
//  LoginSpec.swift
//  Santander Teste iOS Tests
//
//  Created by Lucas Ferraciolli Assis on 18/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Quick
import Nimble

@testable import Santander_Teste_iOS

class LoginSpec: QuickSpec {
    override func spec() {
        describe("Testing Login Scene") {
            var viewController: LoginViewController!
            var presenter: LoginPresenter!
            var interactor: LoginInteractor!
            var router: LoginRouter!
            var worker: LoginWorker!
            
            beforeEach {
                viewController = LoginViewController()
                presenter = LoginPresenter()
                interactor = LoginInteractor()
                router = LoginRouter()
                worker = LoginWorker()
                viewController.interactor = interactor
                viewController.router = router
                interactor.presenter = presenter
                interactor.worker = worker
                presenter.viewController = viewController
                router.viewController = viewController
            }
            
            context("VIP setup", {
                it("View Controller is not null", closure: {
                    expect(viewController).notTo(beNil())
                    expect(presenter.viewController).notTo(beNil())
                    expect(router.viewController).notTo(beNil())
                })
                
                it("Interactor is not null", closure: {
                    expect(viewController.interactor).notTo(beNil())
                    expect(interactor).notTo(beNil())
                })
                
                it("Presenter is not null", closure: {
                    expect(interactor.presenter).notTo(beNil())
                    expect(presenter).notTo(beNil())
                })
                
                it("Router is not null", closure: {
                    expect(router).notTo(beNil())
                    expect(viewController.router).notTo(beNil())
                })
                
                it("Worker is not null", closure: {
                    expect(worker).notTo(beNil())
                    expect(interactor.worker).notTo(beNil())
                })
            })
            
            context("Validate username", {
                it("CPF validation", closure: {
                    let userWithValidCpf = Login.Auth(user: "43966189801", password: "")
                    let userWithInvalidCpf = Login.Auth(user: "09012838929", password: "")
                    
                    expect(interactor.validateUser(user: userWithValidCpf)).to(beTrue())
                    expect(interactor.validateUser(user: userWithInvalidCpf)).notTo(beTrue())
                })
                
                it("E-mail validation", closure: {
                    let userWithValidEmail = Login.Auth(user: "test@gmail.com", password: "")
                    let userWithInvalidEmail = Login.Auth(user: "test.com", password: "")
                    
                    expect(interactor.validateUser(user: userWithValidEmail)).to(beTrue())
                    expect(interactor.validateUser(user: userWithInvalidEmail)).notTo(beTrue())
                })
            })
            
            context("Validate password", {
                it("Number validation", closure: {
                    let userWithValidPassword = Login.Auth(user: "", password: "Test@#1")
                    let userWithInvalidPassword = Login.Auth(user: "", password: "Test@#")
                    expect(interactor.validatePassword(user: userWithValidPassword)).to(beTrue())
                    expect(interactor.validatePassword(user: userWithInvalidPassword)).notTo(beTrue())
                })
                
                it("Capital letter validation", closure: {
                    let userWithValidPassword = Login.Auth(user: "", password: "Test@#1")
                    let userWithInvalidPassword = Login.Auth(user: "", password: "test@#1")
                    expect(interactor.validatePassword(user: userWithValidPassword)).to(beTrue())
                    expect(interactor.validatePassword(user: userWithInvalidPassword)).notTo(beTrue())
                })
                
                it("Special caracters validation", closure: {
                    let userWithValidPassword = Login.Auth(user: "", password: "Test@#1")
                    let userWithInvalidPassword = Login.Auth(user: "", password: "Test1")
                    expect(interactor.validatePassword(user: userWithValidPassword)).to(beTrue())
                    expect(interactor.validatePassword(user: userWithInvalidPassword)).notTo(beTrue())
                })
            })
        }
    }
}
