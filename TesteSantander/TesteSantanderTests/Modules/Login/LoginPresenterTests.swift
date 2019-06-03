//
//  LoginPresenterTests.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 03/06/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TesteSantander

class LoginPresenterTests: QuickSpec {
    
    var presenter: LoginPresenter!
    var viewController: LoginPresentationSpy!
    
    class LoginPresentationSpy: LoginDisplayLogic {
        
        var presentedStatements: Bool = false
        var errorMessage: String?
        
        func presentStatements(viewModel: Login.Login.ViewModel) {
            presentedStatements = true
        }
        
        func displayErrorMessage(message: String) {
            errorMessage = message
        }
    }
    
    fileprivate func setup() {
        presenter = LoginPresenter()
        viewController = LoginPresentationSpy()
        presenter.viewController = viewController
    }
    
    override func spec() {
        
        describe("Test login presenter") {
            
            beforeEach {
                self.setup()
            }
            
            it("On success login") {
                let response = Login.Login.Response(user: Seeds.Users.maria)
                self.presenter.presentStatements(response: response)
                
                expect(self.viewController.presentedStatements).to(beTrue())
                expect(self.viewController.errorMessage).to(beNil())
            }
            
            it("On failed login") {
                self.presenter.displayErrorMessage(message: TestConstants.loginErrorMessage)
                
                expect(self.viewController.presentedStatements).toNot(beTrue())
                expect(self.viewController.errorMessage).toNot(beNil())
                expect(self.viewController.errorMessage ?? "").to(equal(TestConstants.loginErrorMessage))
            }
            
        }
        
    }
    
}
