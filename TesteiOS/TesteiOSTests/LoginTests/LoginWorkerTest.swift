//
//  LoginWorkerTest.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class LoginWorkerTest: XCTestCase {

      var sut: LoginWorker!
        
      override func setUp() {
          super.setUp()
          setupWorker()
      }
      
      func setupWorker() {
          sut = LoginWorker()
      }
    
      func testCreateRequest() {
          guard let url = URL(string: Constants.login) else { return }
          let requestData = LoginModel.Login.Request(user: "teste@teste.com", password: "Teste@1")
          let request = sut.createRequest(requestData: requestData, urlRequest: url)
          XCTAssertNotNil(request)
          XCTAssertEqual(request.httpMethod, "POST")
      }
      
      func testValidUsername() {
          let isValid = sut.validateUserName(username: "teste@teste.com")
          XCTAssertTrue(isValid)
      }
      
      func testValidUsernameFail() {
          let isInvalid = sut.validateUserName(username: "teste.teste@")
          XCTAssertFalse(isInvalid)
      }
      
      func testValidPassword() {
          let isValid = sut.validatePassword(password: "Teste@1")
          XCTAssertTrue(isValid)
      }
      
      func testValidPasswordFail() {
          let isInvalid = sut.validatePassword(password: "teste@1")
          XCTAssertFalse(isInvalid)
      }
      
      func testLoginRequest() {
          let expectation = XCTestExpectation(description: "validate login request")
          
          sut.login(requestData: LoginModel.Login.Request(user: "teste@teste.com", password: "Teste@1"), completionSuccess: { (response) in
              XCTAssertNotNil(response)
              expectation.fulfill()
          }, completionFailure: { (failure) in })
          
          wait(for: [expectation], timeout: 30.0)
      }
}
