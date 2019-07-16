//
//  LoginControllerTest.swift
//  TestSantanderTests
//
//  Created by ely.assumpcao.ndiaye on 12/07/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import XCTest
@testable import TestSantander

class LoginControllerTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        test_validatePassword()
        test_username_placeholder()
    }
    
    func test_validatePassword()
    {
        var status = false
        let validation = ValidationsFields()
        if validation.isValidPassword(passID: "!QAZ2wsx") == false {
            status = false
        }else {status = true}
        XCTAssert(status, "Verificar senha")
    }
    
    
    func test_username_placeholder() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateInitialViewController() as! LoginViewController
        let _ = login.view
        XCTAssertEqual("Username", login.usernameTxt!.placeholder!)
    }
}
