//
//  LoginInteratorTest.swift
//  Williamberg BankTests
//
//  Created by padrao on 06/06/20.
//  Copyright © 2020 Williamberg. All rights reserved.
//
@testable import Williamberg_Bank
import UIKit
import XCTest
import Mockingjay

class LoginInteratorTest: XCTestCase {

    // MARK: - Subject under test
    
    var sut: LoginInteractor!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
      super.setUp()
      sut = LoginInteractor()
    }
    
    class LoginPresentationLogicSpy: LoginPresentationLogic
    {
      // MARK: Method call expectations
      
      var presentLoginResultCalled = false
      var presentUserSavedCalled = false
      
      // MARK: Spied methods
        func presentLoginResult(response: Login.Login.Response) {
            presentLoginResultCalled = true
        }
        
        func presentUserSaved(response: Login.SavedUser.Response) {
            presentUserSavedCalled = true
        }
    }
    
    func testGetSavedUser()
    {
      // Given
      let presentationLogicSpy = LoginPresentationLogicSpy()
      sut.presenter = presentationLogicSpy
      
      // When
      sut.getSavedUser(request: Login.SavedUser.Request())
      
      // Then
      XCTAssert(presentationLogicSpy.presentUserSavedCalled)
    }
    
    func testLoginFail()
    {
      // Given
      let presentationLogicSpy = LoginPresentationLogicSpy()
      sut.presenter = presentationLogicSpy
      
      // When
      sut.login(request: Login.Login.Request(user: "7965906406", password: "A@1q"))
      
      // Then
        XCTAssert(presentationLogicSpy.presentLoginResultCalled)
    }
    
}
