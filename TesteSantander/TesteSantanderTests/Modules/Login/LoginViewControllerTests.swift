//
//  LoginViewControllerTests.swift
//  TesteSantanderTests
//
//  Created by Felipe Alexander Silva Melo on 03/06/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TesteSantander

class LoginViewControllerTests: QuickSpec {
    
    var loginViewController: LoginViewController!
    var loginInteractor: LoginInteractorSpy!
    var window: UIWindow!
    
    class LoginInteractorSpy: LoginBusinessLogic {
        
        var loggedIn: Bool = false
        
        func login(request: Login.Login.Request) {
            loggedIn = true
        }
        
    }
    
    fileprivate func setup() {
        window = UIWindow()
        loginViewController = LoginViewController()
        loginInteractor = LoginInteractorSpy()
        loginViewController.interactor = loginInteractor
        
        window.addSubview(loginViewController.view)
        RunLoop.current.run(until: Date())
    }
    
    override func spec() {
        
        describe("Test login view controller") {
            
            beforeEach {
                self.setup()
            }
            
            it("Login button pressed") {
                self.loginViewController.loginButtonPressed(self)
                expect(self.loginInteractor.loggedIn).to(beTrue())
            }
            
        }
        
    }
    
}
