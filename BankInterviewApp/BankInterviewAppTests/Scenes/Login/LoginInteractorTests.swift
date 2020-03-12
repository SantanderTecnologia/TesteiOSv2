//
//  LoginInteractorTests.swift
//  BankInterviewAppTests
//
//  Created by Osias Carneiro on 11/03/20.
//  Copyright © 2020 Osias Carneiro. All rights reserved.
//

import XCTest

class LoginInteractorTests: XCTestCase {
    
    let interactor = LoginInteractor()
    let spy = LoginPresenterSpy()
    
    override func setUp() {
        interactor.userWorker = UserWorker(store: UserAPIMock(), localStore: LocalDbMock())
        interactor.presenter = spy
    }
    
    func testLoginWithRightUser() {
        interactor.doLogin(request: Login.Request(user: "teste@oi.com", password: "12qQ@"))
        
        XCTAssert(spy.sucess != nil && spy.sucess!.name == "Joao dos testes")
    }
    
    func testLoginWithWrongUserButValidEmail() {
        interactor.doLogin(request: Login.Request(user: "test1e@oi.com", password: "12qQ@"))
        
        XCTAssert(spy.error != nil && spy.error!.message == "Usuário ou senha inválidos")
    }
    
    func testLoginWithWrongUserButValidCPF() {
        interactor.doLogin(request: Login.Request(user: "01234567890", password: "12qQ@"))
        
        XCTAssert(spy.error != nil && spy.error!.message == "Usuário ou senha inválidos")
    }
    
    func testLoginWithInvalidUser() {
        interactor.doLogin(request: Login.Request(user: "test", password: "12qQ@"))
        
        XCTAssert(spy.error != nil && spy.error!.message == "Invalid user/password")
    }
    
    func testLoginWithInvalidPassword() {
        interactor.doLogin(request: Login.Request(user: "teste@oi.com", password: "12"))
        
        XCTAssert(spy.error != nil && spy.error!.message == "Invalid user/password")
    }
    
    func testLoginWithWrongPassword() {
        interactor.doLogin(request: Login.Request(user: "teste@oi.com", password: "q12Awe@"))
        
        XCTAssert(spy.error != nil && spy.error!.message == "Usuário ou senha inválidos")
    }
    
    func testFetchUser() {
        interactor.doLogin(request: Login.Request(user: "teste@oi.com", password: "12qQ@"))
        
        let user = interactor.fetchUser()
        XCTAssert(user != nil && user == "teste@oi.com")
    }
    
}
