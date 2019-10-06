//
//  LoginPresenterTest.swift
//  BankAppTests
//
//  Created by Victor Hugo Martins Lisboa on 02/10/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class LoginDisplayLogicSpy: LoginDisplayLogic {
    var isDisplayCalled = false
    func presentExtrato() {
        isDisplayCalled = true
    }
}

class LoginPresenterTests: XCTestCase {
    
    var sut: LoginPresenter?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = LoginPresenter()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPresenter() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let spy =  LoginDisplayLogicSpy()
        sut?.viewController = spy
        sut?.presentLogin()
        
        XCTAssert(spy.isDisplayCalled)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
