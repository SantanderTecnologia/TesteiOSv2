//
//  LoginInteractorTests.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 03/06/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TesteSantander

class LoginInteractorTests: QuickSpec {
    
    var interactor: LoginInteractor!
    var presenter: LoginPresentationSpy!
    var worker: LoginWorkerSpy!
    
    class LoginPresentationSpy: LoginPresentationLogic {
        
        var presentedStatements: Bool = false
        var errorMessage: String?
        
        func presentStatements(response: Login.Login.Response) {
            presentedStatements = true
        }
        
        func displayErrorMessage(message: String) {
            errorMessage = message
        }
    }
    
    class LoginWorkerSpy: LoginWorker {
        
        var success: Bool = true
        
        override func login(userFormFields: Login.UserFormFields, callback: @escaping (User) -> Void) {
            if success {
                return callback(Seeds.Users.joao)
            } else {
                return callback(Seeds.Users.error)
            }
        }
        
    }
    
    fileprivate func setup() {
        interactor = LoginInteractor()
        presenter = LoginPresentationSpy()
        worker = LoginWorkerSpy()
        interactor.presenter = presenter
        interactor.worker = worker
    }
    
    override func spec() {
        
        describe("Test login interactor") {
            
            beforeEach {
                self.setup()
            }
            
            it("On success login with CPF") {
                let request = Login.Login.Request(userFormFields: Seeds.Forms.validUserWithCPF)
                self.interactor.login(request: request)
                
                expect(self.presenter.presentedStatements).to(beTrue())
                expect(self.presenter.errorMessage).to(beNil())
            }
            
            it("On success login with email") {
                let request = Login.Login.Request(userFormFields: Seeds.Forms.validUserWithEmail)
                self.interactor.login(request: request)
                
                expect(self.presenter.presentedStatements).to(beTrue())
                expect(self.presenter.errorMessage).to(beNil())
            }
            
            it("On invalid CPF") {
                let request1 = Login.Login.Request(userFormFields: Seeds.Forms.invalidUserCPF1)
                let request2 = Login.Login.Request(userFormFields: Seeds.Forms.invalidUserCPF2)
                
                self.interactor.login(request: request1)
                expect(self.presenter.presentedStatements).toNot(beTrue())
                expect(self.presenter.errorMessage).toNot(beNil())
                expect(self.presenter.errorMessage ?? "").to(equal(Constants.Errors.invalidUsername))
                
                self.interactor.login(request: request2)
                expect(self.presenter.presentedStatements).toNot(beTrue())
                expect(self.presenter.errorMessage).toNot(beNil())
                expect(self.presenter.errorMessage ?? "").to(equal(Constants.Errors.invalidUsername))
            }
            
            it("On invalid email") {
                let request1 = Login.Login.Request(userFormFields: Seeds.Forms.invalidUserEmail1)
                let request2 = Login.Login.Request(userFormFields: Seeds.Forms.invalidUserEmail2)
                
                self.interactor.login(request: request1)
                expect(self.presenter.presentedStatements).toNot(beTrue())
                expect(self.presenter.errorMessage).toNot(beNil())
                expect(self.presenter.errorMessage ?? "").to(equal(Constants.Errors.invalidUsername))
                
                self.interactor.login(request: request2)
                expect(self.presenter.presentedStatements).toNot(beTrue())
                expect(self.presenter.errorMessage).toNot(beNil())
                expect(self.presenter.errorMessage ?? "").to(equal(Constants.Errors.invalidUsername))
            }
            
            it("On invalid password") {
                let request1 = Login.Login.Request(userFormFields: Seeds.Forms.invalidUserPassword1)
                let request2 = Login.Login.Request(userFormFields: Seeds.Forms.invalidUserPassword2)
                let request3 = Login.Login.Request(userFormFields: Seeds.Forms.invalidUserPassword3)
                
                self.interactor.login(request: request1)
                expect(self.presenter.presentedStatements).toNot(beTrue())
                expect(self.presenter.errorMessage).toNot(beNil())
                expect(self.presenter.errorMessage ?? "").to(equal(Constants.Errors.invalidPassword))

                self.interactor.login(request: request2)
                expect(self.presenter.presentedStatements).toNot(beTrue())
                expect(self.presenter.errorMessage).toNot(beNil())
                expect(self.presenter.errorMessage ?? "").to(equal(Constants.Errors.invalidPassword))

                self.interactor.login(request: request3)
                expect(self.presenter.presentedStatements).toNot(beTrue())
                expect(self.presenter.errorMessage).toNot(beNil())
                expect(self.presenter.errorMessage ?? "").to(equal(Constants.Errors.invalidPassword))
            }
            
        }
        
    }
    
}
