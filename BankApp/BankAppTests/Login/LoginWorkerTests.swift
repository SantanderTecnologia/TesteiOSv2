//
//  LoginWorkerTest.swift
//  BankAppTests
//
//  Created by Victor Hugo Martins Lisboa on 02/10/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class LoginWorkerTests: XCTestCase {
    
    var user: String?
    var password: String?
    var worker: LoginWorker?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        user = "Test@clean.swift"
        password = "Test@1"
        worker = LoginWorker()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWorker() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectation = XCTestExpectation(description: "HTTP Request")
        worker?.doLoginWork(user: user ?? "", password: password ?? "") { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
