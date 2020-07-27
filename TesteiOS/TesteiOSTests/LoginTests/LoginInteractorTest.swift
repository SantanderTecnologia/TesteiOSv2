//
//  LoginInteractorTest.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class LoginInteractorTest: XCTestCase {

      var sut: LoginInteractor!
        
      override func setUp() {
          super.setUp()
          setupLoginInteractor()
      }
        
      func setupLoginInteractor() {
          sut = LoginInteractor()
      }
            
      class LoginWorkerSpy: LoginWorker {
          let loginPresentationLogic = LoginPresentationLogicSpy()
          
          override func login(requestData: LoginModel.Login.Request, completionSuccess: @escaping LoginResponseSuccess, completionFailure: @escaping LoginResponseFailure) {
              let response = LoginModel.Login.Response(user: nil)
              loginPresentationLogic.presentLogin(response: response)
          }
      }
      
      class LoginInteractorSpy: LoginInteractor {
          let loginPresentationLogic = LoginPresentationLogicSpy()
          
          override func performLogin(request: LoginModel.Login.Request) {
              loginPresentationLogic.presentLoginError(error: "erro")
          }
      }
    
      class LoginPresentationLogicSpy: LoginPresentationLogic {
          var presentLoginIsCalled = false
          var presentLoginErrorIsCalled = false
          var getLastUsernameIsCalled = false
          
          func presentLogin(response: LoginModel.Login.Response) {
              presentLoginIsCalled = true
          }
          
          func presentLoginError(error: String) {
              presentLoginErrorIsCalled = true
          }
          
          func getLastUsername(username: String) {
              getLastUsernameIsCalled = true
          }
      }
      
      func testPerformLogin() {
          let loginWorkerSpy = LoginWorkerSpy()
          sut.worker = loginWorkerSpy
          
          sut.performLogin(request: LoginModel.Login.Request(user: "teste@teste.com", password: "Teste@1"))
          
          XCTAssertTrue(loginWorkerSpy.loginPresentationLogic.presentLoginIsCalled)
      }
      
      func testPerformLoginError() {
          let interactorSpy = LoginInteractorSpy()
          
          interactorSpy.performLogin(request: LoginModel.Login.Request(user: "teste.com", password: "Teste"))
          
          XCTAssertTrue(interactorSpy.loginPresentationLogic.presentLoginErrorIsCalled)
      }
      
      func testGetLastUsername() {
          let loginPresentSpy = LoginPresentationLogicSpy()
          sut.presenter = loginPresentSpy
          
          sut.getLastUserName()
          XCTAssertTrue(loginPresentSpy.getLastUsernameIsCalled)
      }    
}
