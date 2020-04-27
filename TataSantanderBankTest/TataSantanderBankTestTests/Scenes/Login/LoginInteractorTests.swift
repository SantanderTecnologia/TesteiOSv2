//
//  LoginInteractorTests.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 26/04/20.
//  Copyright (c) 2020 Bank. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TataSantanderBankTest
import XCTest

class LoginInteractorTests: XCTestCase
{
  // MARK: Subject under test
    var sut: LoginInteractor!
    let spy = LoginPresentationLogicSpy()
    
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupLoginInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupLoginInteractor()
  {
    sut = LoginInteractor()
    sut.userWorker = UserWorker(store: UserServiceMock())
    sut.presenter = spy
  }
  
  // MARK: Test doubles
  
    class LoginPresentationLogicSpy: LoginPresentationLogic
    {
        var sucess: Login.UserData.Response?
        var error: Login.UserData.Error?

        func presentLoginSucess(response: Login.UserData.Response) {
            self.sucess = response
        }

        func presentError(error: Login.UserData.Error) {
            self.error = error
        }
    }
  
    // MARK: Tests
    func testRightUser() {
        sut.doLogin(request: Login.UserData.Request(user: "test_user@mail.com", password: "Test@1"))
        XCTAssert(spy.sucess != nil && spy.sucess!.name == "Matheus Rodrigues Ribeiro")
    }
    
    func testWrongUserValidEmail() {
        sut.doLogin(request: Login.UserData.Request(user: "wrong_mail@mail.com", password: "Test@1"))
        XCTAssert(spy.error != nil && spy.error!.message == "Usuário ou senha inválidos")
    }
    
    func testWrongUserValidCPF() {
        sut.doLogin(request: Login.UserData.Request(user: "01234567890", password: "Test@1"))
        XCTAssert(spy.error != nil && spy.error!.message == "Usuário ou senha inválidos")
    }
    
    func testInvalidUser() {
        sut.doLogin(request: Login.UserData.Request(user: "test", password: "Test@1"))
        XCTAssert(spy.error != nil && spy.error!.message == "User or password incorrect.")
    }
    
    func testInvalidPassword() {
        sut.doLogin(request: Login.UserData.Request(user: "test_user@mail.com", password: "12"))
        XCTAssert(spy.error != nil && spy.error!.message == "User or password incorrect.")
    }
    
    func testWrongPassword() {
        sut.doLogin(request: Login.UserData.Request(user: "test_user@mail.com", password: "q12Awe@"))
        XCTAssert(spy.error != nil && spy.error!.message == "Usuário ou senha inválidos")
    }
    
    func testFetchUser() {
        sut.doLogin(request: Login.UserData.Request(user: "test_user@mail.com", password: "Test@1"))
        let user = sut.fetchLoggedUser()
        XCTAssert(user != nil && user == "test_user@mail.com")
    }
}
