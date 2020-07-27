//
//  LoginInteractorTests.swift
//  SantanderTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 27/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import XCTest
import Quick
import Nimble
import PromiseKit
@testable import SantanderTest

class LoginInteractorTests: QuickSpec {

    override func spec() {
        super.spec()
        
        describe("LoginInteractorTests") {
            var sut: LoginInteractor!
            var mockWorker: MockLoginWorker!
            var mockPresenter: MockLoginPresenter!
            
            beforeEach {
                PromiseKit.conf.Q.map = nil
                PromiseKit.conf.Q.return = nil
                
                mockWorker = MockLoginWorker()
                mockPresenter = MockLoginPresenter()
                
                let interector = LoginInteractor(with: mockWorker)
                interector.presenter = mockPresenter
                
                sut = interector
            }
            
            describe("a request to login") {
                
                context("successful") {
                    
                    it("When requesting login and saving login in KeychainWrapper") {
                        let request = Login.Request(user: "User", password: "Test@190")
                        sut.userReceived = request.user
                        sut.passwordReceived = request.password
                        mockWorker.returnType = .success(reques: request)
                        sut.login(with: request)
                        
                        expect(mockPresenter.hasCalledLoading).to(beTrue())
                        expect(mockPresenter.hasCalledSuccess).to(beTrue())
                    }
                    
                    it("When requesting login without saving login in KeychainWrapper") {
                        let request = Login.Request(user: "User", password: "Test@190")
                        mockWorker.returnType = .success(reques: request)
                        sut.login(with: request)
                        
                        expect(mockPresenter.hasCalledLoading).to(beTrue())
                        expect(mockPresenter.hasCalledSuccess).to(beTrue())
                    }
                }
                
                context("failure") {
                    
                    it("When requesting login with empty user") {
                        let request = Login.Request(user: "", password: "Test@190")
                        mockWorker.returnType = .emptyField
                        sut.login(with: request)
                        
                        expect(mockPresenter.hasCalledError).to(beTrue())
                    }
                    
                    it("When requesting login with empty password") {
                        let request = Login.Request(user: "User", password: "")
                        mockWorker.returnType = .emptyField
                        sut.login(with: request)
                        
                        expect(mockPresenter.hasCalledError).to(beTrue())
                    }
                    
                    it("When requesting login with invalid password") {
                        let request = Login.Request(user: "User", password: "123")
                        mockWorker.returnType = .invalidPassword
                        sut.login(with: request)
                        
                        expect(mockPresenter.hasCalledError).to(beTrue())
                    }
                
                }
            }
        }
    }

}
