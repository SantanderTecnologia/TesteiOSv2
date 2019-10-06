//
//  LoginViewControllerTest.swift
//  BankAppTests
//
//  Created by Victor Hugo Martins Lisboa on 02/10/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class LoginViewControllerTests: XCTestCase {

    var user: String?
    var password: String?
    var viewController: LoginViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        user = "Test@clean.swift"
        password = "Test@1"
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewController() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewController?.userTextField = UITextField()
        viewController?.passwordTextField = UITextField()
        
        viewController?.userTextField.text = user
        viewController?.passwordTextField.text = password
        
        XCTAssertNotNil(viewController?.executeLogin())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
