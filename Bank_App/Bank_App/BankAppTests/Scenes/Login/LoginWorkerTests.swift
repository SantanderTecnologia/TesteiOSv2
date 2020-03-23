//
//  LoginWorkerTests.swift
//  BankApp
//
//  Created by apple on 22/03/20.
//  Copyright (c) 2020 Barbara_Aniele. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import BankApp
import XCTest

class LoginWorkerTests: XCTestCase {
  
  // MARK: Subject under test
  
  var sut: LoginWorker!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupLoginWorker()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupLoginWorker() {
    sut = LoginWorker()
  }
}
