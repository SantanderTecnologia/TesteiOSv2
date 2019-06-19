//
//  AccountSpec.swift
//  Santander Teste iOS Tests
//
//  Created by Lucas Ferraciolli Assis on 18/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Quick
import Nimble

@testable import Santander_Teste_iOS

class AccountSpec: QuickSpec {
    override func spec() {
        describe("Testing Account Scene") {
            var viewController: AccountViewController!
            var presenter: AccountPresenter!
            var interactor: AccountInteractor!
            var router: AccountRouter!
            var worker: AccountWorker!
            
            beforeEach {
                viewController = AccountViewController()
                presenter = AccountPresenter()
                interactor = AccountInteractor()
                router = AccountRouter()
                worker = AccountWorker()
                viewController.interactor = interactor
                viewController.router = router
                interactor.presenter = presenter
                interactor.worker = worker
                presenter.viewController = viewController
                router.viewController = viewController
                UIApplication.shared.keyWindow?.rootViewController = viewController
                viewController.loadViewIfNeeded()
            }
            
            afterEach {
                if viewController.presentedViewController != nil {
                    viewController.dismiss(animated: false, completion: nil)
                }
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
            
            context("User account data", closure: {
                it("Set user account", closure: {
                    let userAccount = UserAccount(userId: 0, name: "Lucas Conte Ferracioli", bankAccount: "1234", agency: "123456789", balance: 1000.0)
                    interactor.setUserAccount(userAccount: userAccount)
                    expect(interactor.userAccount).toNot(beNil())
                })
            })
            
            context("Statements data", closure: {
                it("Fetch data", closure: {
                    interactor.fetchStatementList()
                    expect(interactor.getStatementList()).toEventuallyNot(beNil(), timeout: 3.0, pollInterval: 0.2, description: nil)
                })
            })
            
            context("Logout", closure: {
                it("Display logout alert", closure: {
                    interactor.logout()
                    expect(viewController.presentedViewController).toEventually(beAKindOf( UIAlertController.self), timeout: 3.0, pollInterval: 0.2, description: nil)
                })
            })
            
            context("Presenter validation", closure: {
                it("Currency mask", closure: {
                    expect(presenter.parseSaldoToString(saldo: 10.0)).to(equal("R$ 10.00"))
                })
                
                it("Agency mask", closure: {
                    expect(presenter.formatAgency(agency: "123456789")).to(equal("12.345678-9"))
                })
                
                it("Agency and account mask", closure: {
                    expect(presenter.formatAgencyBankAccount(agency: "123456789", bankAccount: "1234")).to(equal("1234 / 12.345678-9"))
                })
            })
        }
    }
}
